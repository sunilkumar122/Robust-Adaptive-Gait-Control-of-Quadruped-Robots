# Robust-Adaptive-Gait-Control-of-Quadruped-Robots
This paper presents a robust adaptive control framework for quadruped robots using ZMP-based stability with neural network–enhanced sliding mode and LQR control. The approach ensures stable trotting, precise gait tracking, and strong disturbance rejection in flat-terrain simulations.

# Robust Adaptive Gait Control of Quadruped Robots

This repository contains the MATLAB and Simulink implementation for the paper  
**"Robust Adaptive Gait Control of Quadruped Robots"**, 

## 📘 Overview
The project demonstrates a robust adaptive control strategy for quadruped locomotion.  
The high-level controller uses the **Zero Moment Point (ZMP)** for balance and stability,  
while the low-level joint control combines:
- **Sliding Mode Control (SMC)** for stance phase,
- **Linear Quadratic Regulator (LQR)** for swing phase,
- ensuring robust and stable trot gait tracking.

- ├── main_LQR_SMC_script.m # MATLAB script for LQR and SMC controller derivation
├── singlcontact_control_smc_lqr_mydimes_reaction.slx # Main Simulink model for single-leg control
├── walkingRobotUtils.slx # Supporting Simulink model for gait utilities
└── legInvKin.m # Function for inverse kinematics of the leg

## ⚙️ Requirements
- MATLAB R2023a or later  
- Simulink  
- Control System Toolbox  
- Symbolic Math Toolbox  

## 🚀 How to Run
1. Open MATLAB and set this folder as your working directory.  
2. Run `main_LQR_SMC_script.m` to compute controller gains.  
3. Open and simulate `singlcontact_control_smc_lqr_mydimes_reaction.slx`.  
4. View gait and stability results through generated plots.

## 📊 Results
- Stable trot gait verified through simulation  
- 15 gait cycles achieved in 10 seconds (~0.42 m/s)  
- 90% MSE reduction in knee tracking with NN-SMC + LQR  
- Maintains stability under applied disturbances  
