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

| **Parameter**              | **Symbol** | **Value** | **Unit** |
| -------------------------- | ---------- | --------- | -------- |
| Body Mass                  | *M*        | 6.0       | kg       |
| Upper Leg Length           | *l₁*       | 0.20      | m        |
| Lower Leg Length           | *l₂*       | 0.20      | m        |
| Upper Leg Mass             | *m₁*       | 0.45      | kg       |
| Lower Leg Mass             | *m₂*       | 0.065     | kg       |
| Gravitational Acceleration | *g*        | 9.81      | m/s²     |
| Body Length (X-axis)       | *Lₓ*       | 0.40      | m        |
| Body Width (Y-axis)        | *Lᵧ*       | 0.20      | m        |
| Body Height (Z-axis)       | *L𝓏*      | 0.15      | m        |


🧮 ZMP Formulation (LIPM Approximation)

x_ZMP=x_cg-(x_cg^'' z_cg)/g
y_ZMP=y_cg-(y_cg^'' z_cg)/g

<img width="600" alt="image" alt="image" src="https://github.com/user-attachments/assets/c7550df6-148c-42bb-824a-a587dcb3f62c" />

📊 Simulation Results and Results
<div align="center"> <em>Figure 1: Footstep pattern and ZMP trajectory confirming cyclic stability.</em><br> <img width="600" src="https://github.com/user-attachments/assets/5e939222-4953-426a-98e9-b3cee2f82054" /> </div> <div align="center"> <em>Figure 2: Hierarchical control structure integrating ZMP, SMC, and LQR layers.</em><br> <img width="600" src="https://github.com/user-attachments/assets/ed4cde48-27ea-4049-8239-ada36ad99dc4" /> </div> <div align="center"> <em>Figure 3: PID joint tracking showing steady-state accuracy.</em><br> <img width="600" src="https://github.com/user-attachments/assets/dcda871c-db44-4877-8905-33500e46f7ac" /> </div> <div align="center"> <em>Figure 4: MSE comparison for PID-controlled hip and knee joints.</em><br> <img width="600" src="https://github.com/user-attachments/assets/9497033b-714f-4669-9320-46d90cd49099" /> </div> <div align="center"> <em>Figure 5: Enhanced tracking using hybrid SMC–LQR controller.</em><br> <img width="600" src="https://github.com/user-attachments/assets/dbe88fee-96da-4fb4-b668-791b3ee01677" /> </div> <div align="center"> <em>Figure 6: MSE improvement with hybrid SMC–LQR control.</em><br> <img width="600" src="https://github.com/user-attachments/assets/41e938b2-ac9f-4f1c-88bd-dfc1d58c2d3b" /> </div> <div align="center"> <em>Figure 7: Disturbance rejection capability using neural-enhanced SMC.</em><br> <img width="600" src="https://github.com/user-attachments/assets/ad4257a0-b266-4fb2-a8cf-cb481f66882c" /> </div> <div align="center"> <em>Figure 8: Reduction in MSE with neural adaptation (≈90% improvement).</em><br> <img width="600" src="https://github.com/user-attachments/assets/dc230c71-aaa4-484a-beff-263846997dbc" /> </div> <div align="center"> <em>Figure 9: Hip joint control torque during SMC and LQR phases.</em><br> <img width="600" src="https://github.com/user-attachments/assets/8a2ab6f9-e89f-4513-b543-1ac74b6a51b6" /> </div> <div align="center"> <em>Figure 10: Knee joint control torque transition between SMC and LQR.</em><br> <img width="600" src="https://github.com/user-attachments/assets/6c916abc-e3ae-4259-a396-9213aaf8e782" /> </div> <div align="center"> <em>Figure 11: Body motion tracking using ZMP controller in trot gait.</em><br> <img width="600" src="https://github.com/user-attachments/assets/52f31e22-a6c2-49e1-ac77-94b1f0c1a8a1" /> </div> <div align="center"> <em>Figure 12: Position tracking of quadruped robot about X and Y axes using ZMP.</em><br> 
simulation video 

https://github.com/user-attachments/assets/66f87820-6cfb-48dc-b1c3-a56e7803bc0f


