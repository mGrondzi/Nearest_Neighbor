#ifndef __PIXEL_FUNCTIONS_H_
#define __PIXEL_FUNCTIONS_H_

#include <stdlib.h>
#include <stdint.h>
#include "common.cuh"

//Lookup gedöns
#define PIXEL00_0     *(dp+indexVier) = w[5];
#define PIXEL00_11    *(dp+indexVier) = Interp1(w[5], w[4]);
#define PIXEL00_12    *(dp+indexVier) = Interp1(w[5], w[2]);
#define PIXEL00_20    *(dp+indexVier) = Interp2(w[5], w[2], w[4]);
#define PIXEL00_50    *(dp+indexVier) = Interp5(w[2], w[4]);
#define PIXEL00_80    *(dp+indexVier) = Interp8(w[5], w[1]);
#define PIXEL00_81    *(dp+indexVier) = Interp8(w[5], w[4]);
#define PIXEL00_82    *(dp+indexVier) = Interp8(w[5], w[2]);
#define PIXEL01_0     *(dp+indexVier+1) = w[5];
#define PIXEL01_10    *(dp+indexVier+1) = Interp1(w[5], w[1]);
#define PIXEL01_12    *(dp+indexVier+1) = Interp1(w[5], w[2]);
#define PIXEL01_14    *(dp+indexVier+1) = Interp1(w[2], w[5]);
#define PIXEL01_21    *(dp+indexVier+1) = Interp2(w[2], w[5], w[4]);
#define PIXEL01_31    *(dp+indexVier+1) = Interp3(w[5], w[4]);
#define PIXEL01_50    *(dp+indexVier+1) = Interp5(w[2], w[5]);
#define PIXEL01_60    *(dp+indexVier+1) = Interp6(w[5], w[2], w[4]);
#define PIXEL01_61    *(dp+indexVier+1) = Interp6(w[5], w[2], w[1]);
#define PIXEL01_82    *(dp+indexVier+1) = Interp8(w[5], w[2]);
#define PIXEL01_83    *(dp+indexVier+1) = Interp8(w[2], w[4]);
#define PIXEL02_0     *(dp+indexVier+2) = w[5];
#define PIXEL02_10    *(dp+indexVier+2) = Interp1(w[5], w[3]);
#define PIXEL02_11    *(dp+indexVier+2) = Interp1(w[5], w[2]);
#define PIXEL02_13    *(dp+indexVier+2) = Interp1(w[2], w[5]);
#define PIXEL02_21    *(dp+indexVier+2) = Interp2(w[2], w[5], w[6]);
#define PIXEL02_32    *(dp+indexVier+2) = Interp3(w[5], w[6]);
#define PIXEL02_50    *(dp+indexVier+2) = Interp5(w[2], w[5]);
#define PIXEL02_60    *(dp+indexVier+2) = Interp6(w[5], w[2], w[6]);
#define PIXEL02_61    *(dp+indexVier+2) = Interp6(w[5], w[2], w[3]);
#define PIXEL02_81    *(dp+indexVier+2) = Interp8(w[5], w[2]);
#define PIXEL02_83    *(dp+indexVier+2) = Interp8(w[2], w[6]);
#define PIXEL03_0     *(dp+indexVier+3) = w[5];
#define PIXEL03_11    *(dp+indexVier+3) = Interp1(w[5], w[2]);
#define PIXEL03_12    *(dp+indexVier+3) = Interp1(w[5], w[6]);
#define PIXEL03_20    *(dp+indexVier+3) = Interp2(w[5], w[2], w[6]);
#define PIXEL03_50    *(dp+indexVier+3) = Interp5(w[2], w[6]);
#define PIXEL03_80    *(dp+indexVier+3) = Interp8(w[5], w[3]);
#define PIXEL03_81    *(dp+indexVier+3) = Interp8(w[5], w[2]);
#define PIXEL03_82    *(dp+indexVier+3) = Interp8(w[5], w[6]);
#define PIXEL10_0     *(dp+indexVier+dpL) = w[5];
#define PIXEL10_10    *(dp+indexVier+dpL) = Interp1(w[5], w[1]);
#define PIXEL10_11    *(dp+indexVier+dpL) = Interp1(w[5], w[4]);
#define PIXEL10_13    *(dp+indexVier+dpL) = Interp1(w[4], w[5]);
#define PIXEL10_21    *(dp+indexVier+dpL) = Interp2(w[4], w[5], w[2]);
#define PIXEL10_32    *(dp+indexVier+dpL) = Interp3(w[5], w[2]);
#define PIXEL10_50    *(dp+indexVier+dpL) = Interp5(w[4], w[5]);
#define PIXEL10_60    *(dp+indexVier+dpL) = Interp6(w[5], w[4], w[2]);
#define PIXEL10_61    *(dp+indexVier+dpL) = Interp6(w[5], w[4], w[1]);
#define PIXEL10_81    *(dp+indexVier+dpL) = Interp8(w[5], w[4]);
#define PIXEL10_83    *(dp+indexVier+dpL) = Interp8(w[4], w[2]);
#define PIXEL11_0     *(dp+indexVier+dpL+1) = w[5];
#define PIXEL11_30    *(dp+indexVier+dpL+1) = Interp3(w[5], w[1]);
#define PIXEL11_31    *(dp+indexVier+dpL+1) = Interp3(w[5], w[4]);
#define PIXEL11_32    *(dp+indexVier+dpL+1) = Interp3(w[5], w[2]);
#define PIXEL11_70    *(dp+indexVier+dpL+1) = Interp7(w[5], w[4], w[2]);
#define PIXEL12_0     *(dp+indexVier+dpL+2) = w[5];
#define PIXEL12_30    *(dp+indexVier+dpL+2) = Interp3(w[5], w[3]);
#define PIXEL12_31    *(dp+indexVier+dpL+2) = Interp3(w[5], w[2]);
#define PIXEL12_32    *(dp+indexVier+dpL+2) = Interp3(w[5], w[6]);
#define PIXEL12_70    *(dp+indexVier+dpL+2) = Interp7(w[5], w[6], w[2]);
#define PIXEL13_0     *(dp+indexVier+dpL+3) = w[5];
#define PIXEL13_10    *(dp+indexVier+dpL+3) = Interp1(w[5], w[3]);
#define PIXEL13_12    *(dp+indexVier+dpL+3) = Interp1(w[5], w[6]);
#define PIXEL13_14    *(dp+indexVier+dpL+3) = Interp1(w[6], w[5]);
#define PIXEL13_21    *(dp+indexVier+dpL+3) = Interp2(w[6], w[5], w[2]);
#define PIXEL13_31    *(dp+indexVier+dpL+3) = Interp3(w[5], w[2]);
#define PIXEL13_50    *(dp+indexVier+dpL+3) = Interp5(w[6], w[5]);
#define PIXEL13_60    *(dp+indexVier+dpL+3) = Interp6(w[5], w[6], w[2]);
#define PIXEL13_61    *(dp+indexVier+dpL+3) = Interp6(w[5], w[6], w[3]);
#define PIXEL13_82    *(dp+indexVier+dpL+3) = Interp8(w[5], w[6]);
#define PIXEL13_83    *(dp+indexVier+dpL+3) = Interp8(w[6], w[2]);
#define PIXEL20_0     *(dp+indexVier+dpL+dpL) = w[5];
#define PIXEL20_10    *(dp+indexVier+dpL+dpL) = Interp1(w[5], w[7]);
#define PIXEL20_12    *(dp+indexVier+dpL+dpL) = Interp1(w[5], w[4]);
#define PIXEL20_14    *(dp+indexVier+dpL+dpL) = Interp1(w[4], w[5]);
#define PIXEL20_21    *(dp+indexVier+dpL+dpL) = Interp2(w[4], w[5], w[8]);
#define PIXEL20_31    *(dp+indexVier+dpL+dpL) = Interp3(w[5], w[8]);
#define PIXEL20_50    *(dp+indexVier+dpL+dpL) = Interp5(w[4], w[5]);
#define PIXEL20_60    *(dp+indexVier+dpL+dpL) = Interp6(w[5], w[4], w[8]);
#define PIXEL20_61    *(dp+indexVier+dpL+dpL) = Interp6(w[5], w[4], w[7]);
#define PIXEL20_82    *(dp+indexVier+dpL+dpL) = Interp8(w[5], w[4]);
#define PIXEL20_83    *(dp+indexVier+dpL+dpL) = Interp8(w[4], w[8]);
#define PIXEL21_0     *(dp+indexVier+dpL+dpL+1) = w[5];
#define PIXEL21_30    *(dp+indexVier+dpL+dpL+1) = Interp3(w[5], w[7]);
#define PIXEL21_31    *(dp+indexVier+dpL+dpL+1) = Interp3(w[5], w[8]);
#define PIXEL21_32    *(dp+indexVier+dpL+dpL+1) = Interp3(w[5], w[4]);
#define PIXEL21_70    *(dp+indexVier+dpL+dpL+1) = Interp7(w[5], w[4], w[8]);
#define PIXEL22_0     *(dp+indexVier+dpL+dpL+2) = w[5];
#define PIXEL22_30    *(dp+indexVier+dpL+dpL+2) = Interp3(w[5], w[9]);
#define PIXEL22_31    *(dp+indexVier+dpL+dpL+2) = Interp3(w[5], w[6]);
#define PIXEL22_32    *(dp+indexVier+dpL+dpL+2) = Interp3(w[5], w[8]);
#define PIXEL22_70    *(dp+indexVier+dpL+dpL+2) = Interp7(w[5], w[6], w[8]);
#define PIXEL23_0     *(dp+indexVier+dpL+dpL+3) = w[5];
#define PIXEL23_10    *(dp+indexVier+dpL+dpL+3) = Interp1(w[5], w[9]);
#define PIXEL23_11    *(dp+indexVier+dpL+dpL+3) = Interp1(w[5], w[6]);
#define PIXEL23_13    *(dp+indexVier+dpL+dpL+3) = Interp1(w[6], w[5]);
#define PIXEL23_21    *(dp+indexVier+dpL+dpL+3) = Interp2(w[6], w[5], w[8]);
#define PIXEL23_32    *(dp+indexVier+dpL+dpL+3) = Interp3(w[5], w[8]);
#define PIXEL23_50    *(dp+indexVier+dpL+dpL+3) = Interp5(w[6], w[5]);
#define PIXEL23_60    *(dp+indexVier+dpL+dpL+3) = Interp6(w[5], w[6], w[8]);
#define PIXEL23_61    *(dp+indexVier+dpL+dpL+3) = Interp6(w[5], w[6], w[9]);
#define PIXEL23_81    *(dp+indexVier+dpL+dpL+3) = Interp8(w[5], w[6]);
#define PIXEL23_83    *(dp+indexVier+dpL+dpL+3) = Interp8(w[6], w[8]);
#define PIXEL30_0     *(dp+indexVier+dpL+dpL+dpL) = w[5];
#define PIXEL30_11    *(dp+indexVier+dpL+dpL+dpL) = Interp1(w[5], w[8]);
#define PIXEL30_12    *(dp+indexVier+dpL+dpL+dpL) = Interp1(w[5], w[4]);
#define PIXEL30_20    *(dp+indexVier+dpL+dpL+dpL) = Interp2(w[5], w[8], w[4]);
#define PIXEL30_50    *(dp+indexVier+dpL+dpL+dpL) = Interp5(w[8], w[4]);
#define PIXEL30_80    *(dp+indexVier+dpL+dpL+dpL) = Interp8(w[5], w[7]);
#define PIXEL30_81    *(dp+indexVier+dpL+dpL+dpL) = Interp8(w[5], w[8]);
#define PIXEL30_82    *(dp+indexVier+dpL+dpL+dpL) = Interp8(w[5], w[4]);
#define PIXEL31_0     *(dp+indexVier+dpL+dpL+dpL+1) = w[5];
#define PIXEL31_10    *(dp+indexVier+dpL+dpL+dpL+1) = Interp1(w[5], w[7]);
#define PIXEL31_11    *(dp+indexVier+dpL+dpL+dpL+1) = Interp1(w[5], w[8]);
#define PIXEL31_13    *(dp+indexVier+dpL+dpL+dpL+1) = Interp1(w[8], w[5]);
#define PIXEL31_21    *(dp+indexVier+dpL+dpL+dpL+1) = Interp2(w[8], w[5], w[4]);
#define PIXEL31_32    *(dp+indexVier+dpL+dpL+dpL+1) = Interp3(w[5], w[4]);
#define PIXEL31_50    *(dp+indexVier+dpL+dpL+dpL+1) = Interp5(w[8], w[5]);
#define PIXEL31_60    *(dp+indexVier+dpL+dpL+dpL+1) = Interp6(w[5], w[8], w[4]);
#define PIXEL31_61    *(dp+indexVier+dpL+dpL+dpL+1) = Interp6(w[5], w[8], w[7]);
#define PIXEL31_81    *(dp+indexVier+dpL+dpL+dpL+1) = Interp8(w[5], w[8]);
#define PIXEL31_83    *(dp+indexVier+dpL+dpL+dpL+1) = Interp8(w[8], w[4]);
#define PIXEL32_0     *(dp+indexVier+dpL+dpL+dpL+2) = w[5];
#define PIXEL32_10    *(dp+indexVier+dpL+dpL+dpL+2) = Interp1(w[5], w[9]);
#define PIXEL32_12    *(dp+indexVier+dpL+dpL+dpL+2) = Interp1(w[5], w[8]);
#define PIXEL32_14    *(dp+indexVier+dpL+dpL+dpL+2) = Interp1(w[8], w[5]);
#define PIXEL32_21    *(dp+indexVier+dpL+dpL+dpL+2) = Interp2(w[8], w[5], w[6]);
#define PIXEL32_31    *(dp+indexVier+dpL+dpL+dpL+2) = Interp3(w[5], w[6]);
#define PIXEL32_50    *(dp+indexVier+dpL+dpL+dpL+2) = Interp5(w[8], w[5]);
#define PIXEL32_60    *(dp+indexVier+dpL+dpL+dpL+2) = Interp6(w[5], w[8], w[6]);
#define PIXEL32_61    *(dp+indexVier+dpL+dpL+dpL+2) = Interp6(w[5], w[8], w[9]);
#define PIXEL32_82    *(dp+indexVier+dpL+dpL+dpL+2) = Interp8(w[5], w[8]);
#define PIXEL32_83    *(dp+indexVier+dpL+dpL+dpL+2) = Interp8(w[8], w[6]);
#define PIXEL33_0     *(dp+indexVier+dpL+dpL+dpL+3) = w[5];
#define PIXEL33_11    *(dp+indexVier+dpL+dpL+dpL+3) = Interp1(w[5], w[6]);
#define PIXEL33_80    *(dp+indexVier+dpL+dpL+dpL+3) = Interp8(w[5], w[9]);
#define PIXEL33_12    *(dp+indexVier+dpL+dpL+dpL+3) = Interp1(w[5], w[8]);
#define PIXEL33_20    *(dp+indexVier+dpL+dpL+dpL+3) = Interp2(w[5], w[8], w[6]);
#define PIXEL33_50    *(dp+indexVier+dpL+dpL+dpL+3) = Interp5(w[8], w[6]);
#define PIXEL33_81    *(dp+indexVier+dpL+dpL+dpL+3) = Interp8(w[5], w[6]);
#define PIXEL33_82    *(dp+indexVier+dpL+dpL+dpL+3) = Interp8(w[5], w[8]);


__device__ void pixelFunction01(uint32_t *dp, int indexVier ,int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction02(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction03(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction04(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction05(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction06(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction07(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction08(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		PIXEL03_81
		PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL13_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction09(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL23_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction10(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction11(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction12(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		PIXEL20_31
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL30_81
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction13(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL10_32
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction14(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL12_0
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction15(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_61
		PIXEL21_30
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction16(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_50
				PIXEL21_0
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction17(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
			PIXEL11_0
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_61
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20
}
__device__ void pixelFunction18(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction19(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction20(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_60
		PIXEL21_70
		PIXEL22_70
		PIXEL23_60
		PIXEL30_20
		PIXEL31_60
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction21(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		PIXEL03_81
		PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL13_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL23_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction22(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_60
		PIXEL03_20
		PIXEL10_60
		PIXEL11_70
		PIXEL12_70
		PIXEL13_60
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction23(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL10_32
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL20_31
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL30_81
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction24(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL12_0
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction25(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_61
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction26(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction27(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_61
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction28(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[2], y[6]))
	{
		PIXEL00_81
			PIXEL01_31
			PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL00_12
			PIXEL01_14
			PIXEL02_83
			PIXEL03_50
			PIXEL12_70
			PIXEL13_21
	}
	PIXEL10_81
		PIXEL11_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction29(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
				PIXEL23_32
				PIXEL33_82
		}
		else
		{
			PIXEL02_21
				PIXEL03_50
				PIXEL12_70
				PIXEL13_83
				PIXEL23_13
				PIXEL33_11
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82
}

__device__ void pixelFunction30(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		if (Diff(y[6], y[8]))
		{
			PIXEL03_81
				PIXEL13_31
				PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL03_12
				PIXEL13_14
				PIXEL22_70
				PIXEL23_83
				PIXEL32_21
				PIXEL33_50
		}
	PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL20_61
		PIXEL21_30
		PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction31(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_82
		PIXEL21_32
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL30_82
				PIXEL31_32
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_70
				PIXEL23_21
				PIXEL30_11
				PIXEL31_13
				PIXEL32_83
				PIXEL33_50
		}
}

__device__ void pixelFunction32(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
				PIXEL32_31
				PIXEL33_81
		}
		else
		{
			PIXEL20_21
				PIXEL21_70
				PIXEL30_50
				PIXEL31_83
				PIXEL32_14
				PIXEL33_12
		}
	PIXEL22_31
		PIXEL23_81
}

__device__ void pixelFunction33(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[8], y[4]))
	{
		PIXEL00_82
			PIXEL10_32
			PIXEL20_10
			PIXEL21_30
			PIXEL30_80
			PIXEL31_10
	}
	else
	{
		PIXEL00_11
			PIXEL10_13
			PIXEL20_83
			PIXEL21_70
			PIXEL30_50
			PIXEL31_21
	}
	PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction34(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
			PIXEL20_31
			PIXEL30_81
	}
	else
	{
		PIXEL00_50
			PIXEL01_21
			PIXEL10_83
			PIXEL11_70
			PIXEL20_14
			PIXEL30_12
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_61
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction35(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL02_32
			PIXEL03_82
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_50
			PIXEL01_83
			PIXEL02_13
			PIXEL03_11
			PIXEL10_21
			PIXEL11_70
	}
	PIXEL12_32
		PIXEL13_82
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction36(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction37(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction38(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction39(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction40(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction41(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction42(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction43(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction44(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_0
			PIXEL03_0
			PIXEL13_0
	}
	else
	{
		PIXEL02_50
			PIXEL03_50
			PIXEL13_50
	}
	PIXEL11_0
		PIXEL12_0
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction45(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL12_0
		PIXEL20_61
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction46(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
}

__device__ void pixelFunction47(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_61
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction48(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction49(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL12_0
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction50(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction51(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction52(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_10
		PIXEL11_30
		PIXEL12_0
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction53(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_61
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction54(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_10
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction55(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_61
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction56(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		PIXEL20_10
		PIXEL21_30
		PIXEL22_30
		PIXEL23_10
		PIXEL30_80
		PIXEL31_61
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction57(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction58(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_61
		PIXEL03_80
		PIXEL10_10
		PIXEL11_30
		PIXEL12_30
		PIXEL13_10
		PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction59(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction60(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction61(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_61
		PIXEL21_30
		PIXEL22_30
		PIXEL23_61
		PIXEL30_80
		PIXEL31_10
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction62(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction63(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_10
		PIXEL03_80
		PIXEL10_61
		PIXEL11_30
		PIXEL12_30
		PIXEL13_61
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction64(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction65(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction66(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction67(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction68(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction69(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
		}
		else
		{
			PIXEL02_11
				PIXEL03_20
				PIXEL12_0
				PIXEL13_12
		}
	PIXEL10_81
		PIXEL11_31
		PIXEL20_61
		PIXEL21_30
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_11
				PIXEL32_12
				PIXEL33_20
		}
	PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction70(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	if (Diff(y[6], y[8]))
	{
		PIXEL22_30
			PIXEL23_10
			PIXEL32_10
			PIXEL33_80
	}
	else
	{
		PIXEL22_0
			PIXEL23_11
			PIXEL32_12
			PIXEL33_20
	}
}

__device__ void pixelFunction71(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_61
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	PIXEL22_31
		PIXEL23_81
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction72(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	PIXEL02_32
		PIXEL03_82
		PIXEL12_32
		PIXEL13_82
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction73(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction74(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_10
				PIXEL03_80
				PIXEL12_30
				PIXEL13_10
		}
		else
		{
			PIXEL02_11
				PIXEL03_20
				PIXEL12_0
				PIXEL13_12
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL20_82
		PIXEL21_32
		if (Diff(y[6], y[8]))
		{
			PIXEL22_30
				PIXEL23_10
				PIXEL32_10
				PIXEL33_80
		}
		else
		{
			PIXEL22_0
				PIXEL23_11
				PIXEL32_12
				PIXEL33_20
		}
	PIXEL30_82
		PIXEL31_32
}

__device__ void pixelFunction75(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		if (Diff(y[8], y[4]))
		{
			PIXEL20_10
				PIXEL21_30
				PIXEL30_80
				PIXEL31_10
		}
		else
		{
			PIXEL20_12
				PIXEL21_0
				PIXEL30_20
				PIXEL31_11
		}
	if (Diff(y[6], y[8]))
	{
		PIXEL22_30
			PIXEL23_10
			PIXEL32_10
			PIXEL33_80
	}
	else
	{
		PIXEL22_0
			PIXEL23_11
			PIXEL32_12
			PIXEL33_20
	}
}

__device__ void pixelFunction76(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_80
			PIXEL01_10
			PIXEL10_10
			PIXEL11_30
	}
	else
	{
		PIXEL00_20
			PIXEL01_12
			PIXEL10_11
			PIXEL11_0
	}
	if (Diff(y[2], y[6]))
	{
		PIXEL02_10
			PIXEL03_80
			PIXEL12_30
			PIXEL13_10
	}
	else
	{
		PIXEL02_11
			PIXEL03_20
			PIXEL12_0
			PIXEL13_12
	}
	if (Diff(y[8], y[4]))
	{
		PIXEL20_10
			PIXEL21_30
			PIXEL30_80
			PIXEL31_10
	}
	else
	{
		PIXEL20_12
			PIXEL21_0
			PIXEL30_20
			PIXEL31_11
	}
	if (Diff(y[6], y[8]))
	{
		PIXEL22_30
			PIXEL23_10
			PIXEL32_10
			PIXEL33_80
	}
	else
	{
		PIXEL22_0
			PIXEL23_11
			PIXEL32_12
			PIXEL33_20
	}
}

__device__ void pixelFunction77(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[2], y[6]))
	{
		PIXEL00_81
			PIXEL01_31
			PIXEL02_0
			PIXEL03_0
			PIXEL12_0
			PIXEL13_0
	}
	else
	{
		PIXEL00_12
			PIXEL01_14
			PIXEL02_83
			PIXEL03_50
			PIXEL12_70
			PIXEL13_21
	}
	PIXEL10_81
		PIXEL11_31
		PIXEL20_60
		PIXEL21_70
		PIXEL22_30
		PIXEL23_10
		PIXEL30_20
		PIXEL31_60
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction78(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL12_0
				PIXEL13_0
				PIXEL23_32
				PIXEL33_82
		}
		else
		{
			PIXEL02_21
				PIXEL03_50
				PIXEL12_70
				PIXEL13_83
				PIXEL23_13
				PIXEL33_11
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL20_60
		PIXEL21_70
		PIXEL22_32
		PIXEL30_20
		PIXEL31_60
		PIXEL32_82
}

__device__ void pixelFunction79(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_81
		if (Diff(y[6], y[8]))
		{
			PIXEL03_81
				PIXEL13_31
				PIXEL22_0
				PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL03_12
				PIXEL13_14
				PIXEL22_70
				PIXEL23_83
				PIXEL32_21
				PIXEL33_50
		}
	PIXEL10_60
		PIXEL11_70
		PIXEL12_31
		PIXEL20_61
		PIXEL21_30
		PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction80(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_20
		PIXEL01_60
		PIXEL02_61
		PIXEL03_80
		PIXEL10_60
		PIXEL11_70
		PIXEL12_30
		PIXEL13_10
		PIXEL20_82
		PIXEL21_32
		if (Diff(y[6], y[8]))
		{
			PIXEL22_0
				PIXEL23_0
				PIXEL30_82
				PIXEL31_32
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL22_70
				PIXEL23_21
				PIXEL30_11
				PIXEL31_13
				PIXEL32_83
				PIXEL33_50
		}
}

__device__ void pixelFunction81(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_60
		PIXEL03_20
		PIXEL10_10
		PIXEL11_30
		PIXEL12_70
		PIXEL13_60
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL21_0
				PIXEL30_0
				PIXEL31_0
				PIXEL32_31
				PIXEL33_81
		}
		else
		{
			PIXEL20_21
				PIXEL21_70
				PIXEL30_50
				PIXEL31_83
				PIXEL32_14
				PIXEL33_12
		}
	PIXEL22_31
		PIXEL23_81
}

__device__ void pixelFunction82(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[8], y[4]))
	{
		PIXEL00_82
			PIXEL10_32
			PIXEL20_0
			PIXEL21_0
			PIXEL30_0
			PIXEL31_0
	}
	else
	{
		PIXEL00_11
			PIXEL10_13
			PIXEL20_83
			PIXEL21_70
			PIXEL30_50
			PIXEL31_21
	}
	PIXEL01_82
		PIXEL02_60
		PIXEL03_20
		PIXEL11_32
		PIXEL12_70
		PIXEL13_60
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction83(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
			PIXEL11_0
			PIXEL20_31
			PIXEL30_81
	}
	else
	{
		PIXEL00_50
			PIXEL01_21
			PIXEL10_83
			PIXEL11_70
			PIXEL20_14
			PIXEL30_12
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL12_30
		PIXEL13_61
		PIXEL21_31
		PIXEL22_70
		PIXEL23_60
		PIXEL31_81
		PIXEL32_60
		PIXEL33_20
}

__device__ void pixelFunction84(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL02_32
			PIXEL03_82
			PIXEL10_0
			PIXEL11_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_83
			PIXEL02_13
			PIXEL03_11
			PIXEL10_21
			PIXEL11_70
	}
	PIXEL12_32
		PIXEL13_82
		PIXEL20_10
		PIXEL21_30
		PIXEL22_70
		PIXEL23_60
		PIXEL30_80
		PIXEL31_61
		PIXEL32_60
		PIXEL33_20
}
__device__ void pixelFunction85(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_10
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction86(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_61
		PIXEL20_10
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction87(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_10
		PIXEL11_30
		PIXEL12_0
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction88(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_10
		PIXEL20_61
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction89(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		if (Diff(y[2], y[6]))
		{
			PIXEL02_0
				PIXEL03_0
				PIXEL13_0
		}
		else
		{
			PIXEL02_50
				PIXEL03_50
				PIXEL13_50
		}
	PIXEL10_61
		PIXEL11_30
		PIXEL12_0
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_10
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction90(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_0
		if (Diff(y[6], y[8]))
		{
			PIXEL23_0
				PIXEL32_0
				PIXEL33_0
		}
		else
		{
			PIXEL23_50
				PIXEL32_50
				PIXEL33_50
		}
	PIXEL30_80
		PIXEL31_10
}

__device__ void pixelFunction91(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_10
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		if (Diff(y[8], y[4]))
		{
			PIXEL20_0
				PIXEL30_0
				PIXEL31_0
		}
		else
		{
			PIXEL20_50
				PIXEL30_50
				PIXEL31_50
		}
	PIXEL21_0
		PIXEL22_30
		PIXEL23_61
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction92(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	if (Diff(y[4], y[2]))
	{
		PIXEL00_0
			PIXEL01_0
			PIXEL10_0
	}
	else
	{
		PIXEL00_50
			PIXEL01_50
			PIXEL10_50
	}
	PIXEL02_10
		PIXEL03_80
		PIXEL11_0
		PIXEL12_30
		PIXEL13_10
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82

}

__device__ void pixelFunctio93(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_61
		PIXEL02_81
		PIXEL03_81
		PIXEL10_10
		PIXEL11_30
		PIXEL12_31
		PIXEL13_31
		PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction94(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_61
		PIXEL03_80
		PIXEL10_32
		PIXEL11_32
		PIXEL12_30
		PIXEL13_10
		PIXEL20_31
		PIXEL21_31
		PIXEL22_32
		PIXEL23_32
		PIXEL30_81
		PIXEL31_81
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction95(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		PIXEL20_31
		PIXEL21_31
		PIXEL22_30
		PIXEL23_10
		PIXEL30_81
		PIXEL31_81
		PIXEL32_61
		PIXEL33_80
}

__device__ void pixelFunction96(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_82
		PIXEL01_82
		PIXEL02_81
		PIXEL03_81
		PIXEL10_32
		PIXEL11_32
		PIXEL12_31
		PIXEL13_31
		PIXEL20_10
		PIXEL21_30
		PIXEL22_32
		PIXEL23_32
		PIXEL30_80
		PIXEL31_61
		PIXEL32_82
		PIXEL33_82
}

__device__ void pixelFunction97(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_82
		PIXEL21_32
		PIXEL22_30
		PIXEL23_61
		PIXEL30_82
		PIXEL31_32
		PIXEL32_10
		PIXEL33_80
}

__device__ void pixelFunction98(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_10
		PIXEL03_80
		PIXEL10_81
		PIXEL11_31
		PIXEL12_30
		PIXEL13_61
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction99(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_80
		PIXEL01_10
		PIXEL02_32
		PIXEL03_82
		PIXEL10_61
		PIXEL11_30
		PIXEL12_32
		PIXEL13_82
		PIXEL20_82
		PIXEL21_32
		PIXEL22_31
		PIXEL23_81
		PIXEL30_82
		PIXEL31_32
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction100(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {
	PIXEL00_81
		PIXEL01_31
		PIXEL02_32
		PIXEL03_82
		PIXEL10_81
		PIXEL11_31
		PIXEL12_32
		PIXEL13_82
		PIXEL20_61
		PIXEL21_30
		PIXEL22_31
		PIXEL23_81
		PIXEL30_80
		PIXEL31_10
		PIXEL32_31
		PIXEL33_81
}

__device__ void pixelFunction101(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction102(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunctio103(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction104(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction105(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction106(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction107(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction108(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction109(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction110(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction111(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction112(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunctio113(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction114(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction115(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction116(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction117(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction118(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction119(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction120(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction121(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction122(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunctio123(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction124(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction125(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction126(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction127(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction128(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction129(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction130(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction131(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction132(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunctio133(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction134(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction135(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction136(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction137(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction138(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}

__device__ void pixelFunction139(uint32_t *dp, int indexVier, int dpl, uint32_t **w) {

}
#endif