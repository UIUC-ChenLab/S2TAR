// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2.2 (64-bit)
// Tool Version Limit: 2024.02
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xtiled_mm.h"

extern XTiled_mm_Config XTiled_mm_ConfigTable[];

#ifdef SDT
XTiled_mm_Config *XTiled_mm_LookupConfig(UINTPTR BaseAddress) {
	XTiled_mm_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XTiled_mm_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XTiled_mm_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XTiled_mm_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTiled_mm_Initialize(XTiled_mm *InstancePtr, UINTPTR BaseAddress) {
	XTiled_mm_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTiled_mm_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTiled_mm_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XTiled_mm_Config *XTiled_mm_LookupConfig(u16 DeviceId) {
	XTiled_mm_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XTILED_MM_NUM_INSTANCES; Index++) {
		if (XTiled_mm_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XTiled_mm_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTiled_mm_Initialize(XTiled_mm *InstancePtr, u16 DeviceId) {
	XTiled_mm_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTiled_mm_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTiled_mm_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

