// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2.2 (64-bit)
// Tool Version Limit: 2024.02
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XTILED_MM_H
#define XTILED_MM_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xtiled_mm_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XTiled_mm_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XTiled_mm;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTiled_mm_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTiled_mm_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTiled_mm_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTiled_mm_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XTiled_mm_Initialize(XTiled_mm *InstancePtr, UINTPTR BaseAddress);
XTiled_mm_Config* XTiled_mm_LookupConfig(UINTPTR BaseAddress);
#else
int XTiled_mm_Initialize(XTiled_mm *InstancePtr, u16 DeviceId);
XTiled_mm_Config* XTiled_mm_LookupConfig(u16 DeviceId);
#endif
int XTiled_mm_CfgInitialize(XTiled_mm *InstancePtr, XTiled_mm_Config *ConfigPtr);
#else
int XTiled_mm_Initialize(XTiled_mm *InstancePtr, const char* InstanceName);
int XTiled_mm_Release(XTiled_mm *InstancePtr);
#endif

void XTiled_mm_Start(XTiled_mm *InstancePtr);
u32 XTiled_mm_IsDone(XTiled_mm *InstancePtr);
u32 XTiled_mm_IsIdle(XTiled_mm *InstancePtr);
u32 XTiled_mm_IsReady(XTiled_mm *InstancePtr);
void XTiled_mm_EnableAutoRestart(XTiled_mm *InstancePtr);
void XTiled_mm_DisableAutoRestart(XTiled_mm *InstancePtr);

void XTiled_mm_Set_a(XTiled_mm *InstancePtr, u64 Data);
u64 XTiled_mm_Get_a(XTiled_mm *InstancePtr);
void XTiled_mm_Set_b(XTiled_mm *InstancePtr, u64 Data);
u64 XTiled_mm_Get_b(XTiled_mm *InstancePtr);
void XTiled_mm_Set_out_r(XTiled_mm *InstancePtr, u64 Data);
u64 XTiled_mm_Get_out_r(XTiled_mm *InstancePtr);

void XTiled_mm_InterruptGlobalEnable(XTiled_mm *InstancePtr);
void XTiled_mm_InterruptGlobalDisable(XTiled_mm *InstancePtr);
void XTiled_mm_InterruptEnable(XTiled_mm *InstancePtr, u32 Mask);
void XTiled_mm_InterruptDisable(XTiled_mm *InstancePtr, u32 Mask);
void XTiled_mm_InterruptClear(XTiled_mm *InstancePtr, u32 Mask);
u32 XTiled_mm_InterruptGetEnabled(XTiled_mm *InstancePtr);
u32 XTiled_mm_InterruptGetStatus(XTiled_mm *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
