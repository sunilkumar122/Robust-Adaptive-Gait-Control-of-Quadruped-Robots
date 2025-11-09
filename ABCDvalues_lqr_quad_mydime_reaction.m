% clear all
% clc
syms theta1 theta2 theta1dot theta2dot theta1ddot theta2ddot m1 m2 l1 l2 g theta1_dd_sol theta2_dd_sol T1 T2
m1 =  0.45;
m2 = 0.065;
l1 = 0.20;
l2 = 0.20;
g = 9.81;
Ts=0.05;
stepHeight=0.4;
% Ts=0.0001; %%for lqr
   
% % Define system dynamics
% theta1ddot = -(l2^2*m2*theta2ddot - T1 + g*l1*sin(theta1)*(m1 + m2) + g*l2*m2*sin(theta1 + theta2) - l1*l2*m2*theta2dot^2*sin(theta2) + 2*l1*l2*m2*theta2ddot*cos(theta2) - 2*l1*l2*m2*theta1dot*theta2dot*sin(theta2))/((m1 + m2)*l1^2 + l2*m2*cos(theta2)*l1);
% theta2ddot = -(3*((l2^2*m2*theta1ddot)/3 - T2 + (g*l2*m2*sin(theta1 + theta2))/2 + (l1*l2*m2*theta1dot^2*sin(theta2))/2 + (l1*l2*m2*theta1ddot*cos(theta2))/2))/(l2^2*m2);
% T1=((1/3)*M1*L1^2+(1/3)*M2*L2^2+M2*L1^2+M2*L1*L2*cos(theta2))*theta1ddot+((1/3)*M2*L2^2+0.5*M2*L1*L2*cos(theta2))*theta2ddot-M2*L1*L2*sin(theta2)*theta1dot*theta2dot-0.5*M2*L1*L2*sin(theta2)*theta2dot^2+(0.5*M1+M2)*g*L1*sin(theta1)+0.5*M2*g*L2*sin(theta1+theta2);
% T2=((1/3)*M2*L2^2+(1/2)*M2*L1*L2*cos(theta2))*theta1ddot+(1/3)*M2*L2^2*theta2ddot+(1/2)*M2*L1*L2*sin(theta2)*theta1dot^2+(1/2)*M2*g*L2*sin(theta1+theta2);
% T1=((M1 + M2) * L1^2*theta1ddot)+ M2 * L1 * L2 * theta2ddot * cos(theta1 - theta2)+ M2 * L1 * L2 * theta2dot^2 *theta2*sin(theta1 - theta2) + (M1 + M2) * g * L1 * cos(theta1);
% T2=(M2 * L2^2*theta2ddot)+(M2 * L1 * L2 * theta1ddot * cos(theta1 - theta2))- (M2 * L1 * L2 * theta1dot^2 *theta1* sin(theta1 - theta2))  -M2 * g * L2 * cos(theta2);
theta1ddot =((l1*l2*m2*sin(theta2)*theta2dot^2)/2 + l1*l2*m2*theta1dot*sin(theta2)*theta2dot + T1 - theta2ddot*((m2*l2^2)/3 + (l1*m2*cos(theta2)*l2)/2) - (g*l2*m2*sin(theta1 + theta2))/2 - g*l1*sin(theta1)*(m1/2 + m2))/((l1^2*m1)/3 + l1^2*m2 + (l2^2*m2)/3 + l1*l2*m2*cos(theta2));
 
 
theta2ddot =-(3*((((m2*l2^2)/3 + (l1*m2*cos(theta2)*l2)/2)*((l1*l2*m2*sin(theta2)*theta2dot^2)/2 + l1*l2*m2*theta1dot*sin(theta2)*theta2dot + T1 - theta2ddot*((m2*l2^2)/3 + (l1*m2*cos(theta2)*l2)/2) - (g*l2*m2*sin(theta1 + theta2))/2 - g*l1*sin(theta1)*(m1/2 + m2)))/((l1^2*m1)/3 + l1^2*m2 + (l2^2*m2)/3 + l1*l2*m2*cos(theta2)) - T2 + (g*l2*m2*sin(theta1 + theta2))/2 + (l1*l2*m2*theta1dot^2*sin(theta2))/2))/(l2^2*m2);

% sol = solve([T1,T2],[theta1ddot,theta2ddot])
theta1_dd_sol = simplify(theta1ddot);
theta2_dd_sol = simplify(theta2ddot);
fuxn = [theta1dot; theta2dot; theta1_dd_sol; theta2_dd_sol];
variable = [theta1 theta2 theta1dot theta2dot];
J1 = jacobian(fuxn,variable);
% Find equilibrium point
equilibrium_point = [0, 0, 0, 0];  % Note: 180 degrees is pi radians

A = simplify(subs(J1,variable,equilibrium_point))
Ver = [T1 T2];
J2 = jacobian(fuxn, [T1 T2]);
B = subs(J2, variable, equilibrium_point)

% % Since we need numeric values for A and B, we need to substitute T1 and T2 with 0
% A = subs(A, [T1 T2], [0 0]);
% B = subs(B, [T1 T2], [0 0]);
% 
% Convert symbolic matrices to numeric
A = double(A);
B = double(B);
C = [1 0 0 0; 0 1 0 0;0 0 1 0;0 0 0 1]
D = zeros([4,2])

Q = diag([50000, 40000, 0, 0])%% 5000,2000,0,0%%[1000, 1000, 100, 100])
R = diag([0.09,0.4]) %% 0.01%%([0.1,0.1])
K = lqr(A, B, Q, R)
sys=ss(( A-B*K),B,C,D);
EIGS = eig(A-B*K)
pzmap(sys)
% Display the A and B matrices in proper matrix format
fprintf('State Matrix A:\n');
disp(A);

fprintf('Input Matrix B:\n');
disp(B);
