% Walking Robot Parameters -- 3D
% Copyright 2019 The MathWorks, Inc.
% smc values
knee_smc_lamda=140;%100/140
knee_smc_new=80;%80/100
hip_smc_lamda=85;%45/45
hip_smc_new=25;%25/45

%%PID%%
% knee_pitch_deriv=100;
% knee_pitch_int=160;
% knee_pitch_prop=220;

knee_pitch_deriv=100;%100
knee_pitch_int=300;%300
knee_pitch_prop=400;%400

hip_roll_deriv=280;
hip_roll_int=180;
hip_roll_prop=300;

hip_pitch_deriv=200;%200
hip_pitch_int=150;%150
hip_pitch_prop=500;%350/400/450/500

filter_coefficent_pid=100;

%% General parameters
density = 500;
foot_density = 1000;
if ~exist('actuatorType','var')
    actuatorType = 1;
end
world_damping = 1e-3;
world_rot_damping = 5e-2;
stiffness1=0;
stiffness2=0;
                    
%% Contact/friction parameters
contact_stiffness = 4000;%%4000
contact_damping =850;%%850
mu_k = 1;%%1
mu_s = 0.01;%%0.01 
mu_vth = 0.01;%%0.01
height_plane = 0.025;%%0.025
plane_x = 25;
plane_y = 3;
contact_point_radius = 1e-2;

%% Foot parameters
foot_x = 9;
foot_y = 5;
foot_z = 1.5;
foot_offset = [-1 0 0];
foot_endR=2;

%% Leg parameters
leg_radius = 2.0;
lower_leg_length = 20;
upper_leg_length = 20;
legmass=leg_radius*lower_leg_length*density*(0.01^3);
densityfloor=2000;
densityupper=1200;
lowermass=0.065;
uppermass=0.45;
%% Torso parameters
torso_y =20;
torso_x = 40;
torso_z = 15;
torso_offset_z = 0;
torso_offset_x = 17;
torso_offset_x1 = -17;
mass = (0.01^3)*torso_y*torso_x*torso_z*density;
g = 9.80665;

%% Derived parameters for initial conditions
h = 32;
init_height = h + ...
              torso_z/2 + torso_offset_z + height_plane/2;

init_angs = legInvKin(upper_leg_length/100,lower_leg_length/100,0,-h/100);
init_angs = init_angs(2,:);
init_angs_R = [0 -sum(init_angs) init_angs(2) 0 init_angs(1)];
init_angs_L = init_angs_R;

%% Joint parameters
joint_damping = 1;
joint_stiffness = 1;
motion_time_constant = 0.01;

%% Joint controller parameters
hip_servo_kp = 60;
hip_servo_ki = 10;
hip_servo_kd = 20;
knee_servo_kp = 60;
knee_servo_ki = 5;
knee_servo_kd = 10;
ankle_servo_kp = 20;
ankle_servo_ki = 4;
ankle_servo_kd = 8;
deriv_filter_coeff = 100;
max_torque = 20;

%% Electric motor parameters
motor_voltage = 24;
motor_resistance = 1;
motor_constant = 0.02;
motor_inertia = 0;
motor_damping = 0;
motor_inductance = 1.2e-6;
gear_ratio = 50;

%% Walking controller parameters
TsCtrl = 0.05;      % Controller sample time (s)
tWalk = 0.3;        % Walking gait period (s)
% stepHeight = 0.1;  % Step height when swinging leg (m)
Kwalk = 0.6;        % Walking gain for tracking XYZ foot positions

%% Sample path for the robot to track
if ~exist('pathType','var')
    pathType = 1;
end

if pathType == 1        % Square
    pathT = [0 2 15 30 45 60]';
    pathX = [0 0.01 1 1 0 0]';
    pathY = [0 0.01 0 1 1 0]';
elseif pathType == 2        % Circle
    timePts = (0:2.5:30);
    pathR = 0.5;
    pathT = [0 1 timePts+2]';
    pathX = [0 0.01 pathR*cos(2*pi*timePts/60 - pi/2)]';
    pathY = [0 0.01 pathR*(sin(2*pi*timePts/60 - pi/2)+1)]';     
elseif pathType == 3    % straight line
    pathT = [0 60]';%(time in sec to complete the path)[0 60]
    pathX = [0 10]';%(lenght in meter)%% [0 10 ]for lqr[0 5]for smc[0 10]
    pathY = [0 0]';
end
curveT = linspace(0,pathT(end),100)';
curveX = interp1(pathT,pathX,curveT);
curveY = interp1(pathT,pathY,curveT);
curveZ = zeros(size(curveT));
interPts = [curveX curveY curveZ];