
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <cstdio>
#include <iostream>
#include <IL/il.h>
#include "image.h"

#define FACTOR 16

__global__ void nearest_neighbor(uint32_t *dp, uint32_t *sp, ILuint width, int factor, int maxThreads)
{
	int i = threadIdx.x;
	i = i +  maxThreads * blockIdx.x;

	int row = i / width;
	int col = i % width;

	dp[i] = sp[((row / factor) * width/factor + (col / factor))];
}

extern void CallNearestNeighbor();

int main()
{

	//CallNearestNeighbor();
	ILuint handle;
	ilInit();
	ilEnable(IL_ORIGIN_SET);
	ilGenImages(1, &handle);
	ilBindImage(handle);
	cudaError_t cudaStatus;
	cudaDeviceProp deviceProp;

	cudaGetDeviceProperties(&deviceProp, 0);

	std::cout << "Read images" << std::endl;
	Image *org = new Image("image4.png");
	Image *res = new Image("image5.png", org->getWidth() * FACTOR, org->getHeight() * FACTOR);

	std::cout << "Execute nearest neighbor algorithm" << std::endl;
	
	// prepare
	uint32_t *input, *out;

	cudaStatus = cudaSetDevice(0);
	cudaMalloc(&input, org->getHeight() * org->getWidth() * sizeof(uint32_t));
	cudaMalloc(&out, res->getHeight() * res->getWidth() * sizeof(uint32_t));
	
	cudaMemcpy(input, org->getData(), org->getHeight() * org->getWidth() * sizeof(uint32_t), cudaMemcpyHostToDevice);
	
	nearest_neighbor<<<(res->getHeight() * res->getWidth()) / deviceProp.maxThreadsPerBlock, deviceProp.maxThreadsPerBlock>>>(out, input, res->getWidth(), FACTOR, deviceProp.maxThreadsPerBlock);
	
	// Check for any errors launching the kernel
	cudaStatus = cudaGetLastError();
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "addKernel launch failed: %s\n", cudaGetErrorString(cudaStatus));
	}

	cudaStatus = cudaDeviceSynchronize();
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaDeviceSynchronize returned error code %d after launching addKernel!\n", cudaStatus);
	}

	cudaStatus = cudaMemcpy(res->getData(), out, res->getHeight() * res->getWidth() * sizeof(uint32_t), cudaMemcpyDeviceToHost);
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaMalloc failed!");
	}

	std::cout << "Save new image" << std::endl;
	res->saveImage();

	std::cout << "Free space" << std::endl;
	delete org;
	delete res;
	ilDeleteImages(1, &handle);

	cudaFree(input);
	cudaFree(out);

	std:getchar();

    return 0;
}

