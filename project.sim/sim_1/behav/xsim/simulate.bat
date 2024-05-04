@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sat May 04 18:27:51 +0500 2024
REM SW Build 2902540 on Wed May 27 19:54:49 MDT 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim RISC_V_Processor_behav -key {Behavioral:sim_1:Functional:RISC_V_Processor} -tclbatch RISC_V_Processor.tcl -view E:/study/HU/Semmester_8/ca/project/RISC_V_Processor_behav.wcfg -log simulate.log"
call xsim  RISC_V_Processor_behav -key {Behavioral:sim_1:Functional:RISC_V_Processor} -tclbatch RISC_V_Processor.tcl -view E:/study/HU/Semmester_8/ca/project/RISC_V_Processor_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
