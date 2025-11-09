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
3. Run `ABCDvalues_lqr_quad_mydime_rection.m` to compute controller gains.
4. Run `robotparametersCtrl_modify_mydiem_rection.m` to compute controller gains.
5. Open and simulate `singlcontact_control_smc_lqr_mydimes_reaction.slx`.  
6. View gait and stability results through generated plots.
   

## 📊 Results
- Stable trot gait verified through simulation  
- 15 gait cycles achieved in 10 seconds (~0.42 m/s)  
- 90% MSE reduction in knee tracking with NN-SMC + LQR  
- Maintains stability under applied disturbances

- Parameter	Symbol	Value	Unit
Body Mass	M	6.0	kg
Upper Leg Length	l₁	0.20	m
Lower Leg Length	l₂	0.20	m
Upper Leg Mass	m₁	0.45	kg
Lower Leg Mass	m₂	0.065	kg
Gravitational Acceleration	g	9.81	m/s²
Body Length (X)	Lx	0.40	m
Body Width (Y)	Ly	0.20	m
Body Height (Z)	Lz	0.15	m

ZMP Formulation:
x_ZMP=x_cg-(x_cg^'' z_cg)/g
y_ZMP=y_cg-(y_cg^'' z_cg)/g

<img width="817" height="315" alt="image" src="https://github.com/user-attachments/assets/c7550df6-148c-42bb-824a-a587dcb3f62c" />

📊 Simulation Results
Bipedal Approximation of Quadruped Dynamics for Trot Gait Control
<img width="798" height="718" alt="image" src="https://github.com/user-attachments/assets/5e939222-4953-426a-98e9-b3cee2f82054" />
Quadruped Robot Footprint and ZMP Trajectory During Trot Gait
<img width="1005" height="693" alt="image" src="https://github.com/user-attachments/assets/ed4cde48-27ea-4049-8239-ada36ad99dc4" />
Control System Architecture for Quadruped Robot Locomotion
<img width="940" height="705" alt="image" src="https://github.com/user-attachments/assets/dcda871c-db44-4877-8905-33500e46f7ac" />
🧠 Controller Performance
PID Controller – Knee & Hip Joint Position Tracking
<img width="940" height="705" alt="image" src="https://github.com/user-attachments/assets/9497033b-714f-4669-9320-46d90cd49099" />
PID Controller – Mean Squared Error (MSE)
<img width="940" height="705" alt="image" src="https://github.com/user-attachments/assets/dbe88fee-96da-4fb4-b668-791b3ee01677" />
Hybrid SMC + LQR – Position Tracking
<img width="940" height="705" alt="image" src="https://github.com/user-attachments/assets/41e938b2-ac9f-4f1c-88bd-dfc1d58c2d3b" />
SMC + LQR – MSE Comparison
<img width="940" height="705" alt="image" src="https://github.com/user-attachments/assets/ad4257a0-b266-4fb2-a8cf-cb481f66882c" />
NNSMC + LQR – Position Tracking Under Disturbance
<img width="940" height="705" alt="image" src="https://github.com/user-attachments/assets/dc230c71-aaa4-484a-beff-263846997dbc" />
MSE Comparison – SMC + LQR vs NNSMC + LQR
<img width="940" height="705" alt="image" src="https://github.com/user-attachments/assets/8a2ab6f9-e89f-4513-b543-1ac74b6a51b6" />
Control Torque Output – Hip Joint
<img width="940" height="705" alt="image" src="https://github.com/user-attachments/assets/6c916abc-e3ae-4259-a396-9213aaf8e782" />
Control Torque Output – Knee Joint
<img width="940" height="705" alt="image" src="https://github.com/user-attachments/assets/52f31e22-a6c2-49e1-ac77-94b1f0c1a8a1" />
🧩 ZMP-Based Body Motion Tracking

Position tracking of quadruped robot along X and Y axes using ZMP control:
<img width="817" height="315" alt="image" src="https://github.com/user-attachments/assets/c7550df6-148c-42bb-824a-a587dcb3f62c" />
