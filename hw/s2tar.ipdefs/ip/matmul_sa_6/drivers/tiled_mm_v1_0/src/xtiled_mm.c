// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2.2 (64-bit)
// Tool Version Limit: 2024.02
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xtiled_mm.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTiled_mm_CfgInitialize(XTiled_mm *InstancePtr, XTiled_mm_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTiled_mm_Start(XTiled_mm *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XTiled_mm_IsDone(XTiled_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XTiled_mm_IsIdle(XTiled_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XTiled_mm_IsReady(XTiled_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XTiled_mm_EnableAutoRestart(XTiled_mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XTiled_mm_DisableAutoRestart(XTiled_mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_AP_CTRL, 0);
}

void XTiled_mm_Set_a(XTiled_mm *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_A_DATA, (u32)(Data));
    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XTiled_mm_Get_a(XTiled_mm *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_A_DATA);
    Data += (u64)XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XTiled_mm_Set_b(XTiled_mm *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_B_DATA, (u32)(Data));
    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XTiled_mm_Get_b(XTiled_mm *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_B_DATA);
    Data += (u64)XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XTiled_mm_Set_out_r(XTiled_mm *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_OUT_R_DATA, (u32)(Data));
    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_OUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XTiled_mm_Get_out_r(XTiled_mm *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_OUT_R_DATA);
    Data += (u64)XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_OUT_R_DATA + 4) << 32;
    return Data;
}

void XTiled_mm_InterruptGlobalEnable(XTiled_mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_GIE, 1);
}

void XTiled_mm_InterruptGlobalDisable(XTiled_mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_GIE, 0);
}

void XTiled_mm_InterruptEnable(XTiled_mm *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_IER);
    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_IER, Register | Mask);
}

void XTiled_mm_InterruptDisable(XTiled_mm *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_IER);
    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_IER, Register & (~Mask));
}

void XTiled_mm_InterruptClear(XTiled_mm *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTiled_mm_WriteReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_ISR, Mask);
}

u32 XTiled_mm_InterruptGetEnabled(XTiled_mm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_IER);
}

u32 XTiled_mm_InterruptGetStatus(XTiled_mm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTiled_mm_ReadReg(InstancePtr->Control_BaseAddress, XTILED_MM_CONTROL_ADDR_ISR);
}

