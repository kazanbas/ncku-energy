close all; clear; clc
% Set up the time interval and the initial positions of the nine coordinates
T_Int=0:0.01:3;
%X0=[-37.5 0 pi -213.088 39.4544 6.00488 -250 0 2*pi]; -> C as starting point 
%X0 =[0 50 pi/2 87.5 75 0.278299659 212.5 50 0]; the one with BC=75 mm
X0 =[49.02903379 9.805806755 0.1973955598 187.292256 37.45845119 0.1973955598 263.2632223 57.9579333 1.373400767];

% only if phi3=0, if =pi, then ; 
% comment: X0 starting with [0 50 pi/2 ... is for OA-AB-BC

L1=100;L2=25*sqrt(53);L3=27.0517715;
global T
Xinit=X0;

% Do the loop for each time interval
for Iter=1:length(T_Int);
T=T_Int(Iter);
% Determine the displacement at the current time
[Xtemp,fval] = fsolve(@constrEq4bar,Xinit);

% Determine the velocity at the current time
phi1=Xtemp(3); phi2=Xtemp(6); phi3=Xtemp(9);
JacoMatrix=Jaco4bar(phi1,phi2,phi3);
%Beta=[0 0 0 0 0 0 0 0 -2]';
Beta=[0 0 0 0 0 0 0 0 2*pi]';
Vtemp=JacoMatrix\Beta;

% Determine the acceleration at the current time
dphi1=Vtemp(3); dphi2=Vtemp(6); dphi3=Vtemp(9);
Gamma=Gamma4bar(phi1,phi2,phi3,dphi1,dphi2,dphi3);
Atemp=JacoMatrix\Gamma;

% Record the results of each iteration
X(:,Iter)=Xtemp; V(:,Iter)=Vtemp; A(:,Iter)=Atemp;

% Determine the new initial position to solve the equation of the next
% iteration and assume that the kinematic motion is with inertia
if Iter==1
Xinit=X(:,Iter);
else
Xinit=X(:,Iter)+(X(:,Iter)-X(:,Iter-1));
end

end
% T vs displacement plot for the nine coordinates
figure
for i=1:9;
subplot(9,1,i)
plot (T_Int,X(i,:))
set(gca,'xtick',[], 'FontSize', 5)
end
% Reset the bottom subplot to have xticks
set(gca,'xtickMode', 'auto')

% T vs velocity plot for the nine coordinates
figure
for i=1:9;
subplot(9,1,i)
plot (T_Int,V(i,:))
set(gca,'xtick',[], 'FontSize', 5)
end
set(gca,'xtickMode', 'auto')

% T vs acceleration plot for the nine coordinates
figure
for i=1:9;
subplot(9,1,i)
plot (T_Int,A(i,:))
AxeSup=max(A(i,:));
AxeInf=min(A(i,:));
if AxeSup-AxeInf<0.01
axis([-inf,inf,(AxeSup+AxeSup)/2-0.1 (AxeSup+AxeSup)/2+0.1]);
end
set(gca,'xtick',[], 'FontSize', 5)
end
set(gca,'xtickMode', 'auto')

% Determine the positions of the four revolute joints at each iteration
Ox=zeros(1,length(T_Int));
Oy=zeros(1,length(T_Int));
Ax=L1*cos(X(3,:));
Ay=L1*sin(X(3,:));
Bx=Ax+L2*cos(X(6,:));
By=Ay+L2*sin(X(6,:));
Cx=250*ones(1,length(T_Int));
Cy=50*ones(1,length(T_Int));
% zeros function is often used to allocate a variable to a known size,
% ones function could be used to allocate a variable with a const 

% Animation
figure
for t=1:length(T_Int);
bar1x=[Ox(t) Ax(t)];
bar1y=[Oy(t) Ay(t)];
bar2x=[Ax(t) Bx(t)];
bar2y=[Ay(t) By(t)];
bar3x=[Bx(t) Cx(t)];
bar3y=[By(t) Cy(t)];

plot (bar1x,bar1y,bar2x,bar2y,bar3x,bar3y);
grid
axis([-150,300,-150,150]);
axis normal

M(:,t)=getframe;
end
%%
function F=constrEq4bar(X)

L1=100;L2=25*sqrt(53);L3=27.0517715;

global T

x1=X(1); y1=X(2); phi1=X(3);
x2=X(4); y2=X(5); phi2=X(6);
x3=X(7); y3=X(8); phi3=X(9);

F=[ 
-x1+(L1/2)*cos(phi1);
-y1+(L1/2)*sin(phi1);
 x1+(L1/2)*cos(phi1)-x2+(L2/2)*cos(phi2);
 y1+(L1/2)*sin(phi1)-y2+(L2/2)*sin(phi2);
 x2+(L2/2)*cos(phi2)-x3+(L3/2)*cos(phi3);
 y2+(L2/2)*sin(phi2)-y3+(L3/2)*sin(phi3);
 x3+(L3/2)*cos(phi3)-250;
 y3+(L3/2)*sin(phi3)-50;
 %phi3+2*T-0.5628329582*pi;
 phi3-2*pi*T-pi/2;
];
end
%%
function JacoMatrix=Jaco4bar(phi1,phi2,phi3)

L1=100;L2=25*sqrt(53);L3=27.0517715;

JacoMatrix=[ 
-1  0 -(L1/2)*sin(phi1)  0  0                0   0   0                 0;
 0 -1  (L1/2)*cos(phi1)  0  0                0   0   0                 0;
 1  0 -(L1/2)*sin(phi1) -1  0 -(L2/2)*sin(phi2)  0   0                 0;
 0  1  (L1/2)*cos(phi1)  0 -1  (L2/2)*cos(phi2)  0   0                 0;
 0  0                0   1  0 -(L2/2)*sin(phi2) -1   0 -(L3/2)*sin(phi3);
 0  0                0   0  1  (L2/2)*cos(phi2)  0  -1  (L3/2)*cos(phi3);
 0  0                0   0  0                0   1   0 -(L3/2)*sin(phi3);
 0  0                0   0  0                0   0   1  (L3/2)*cos(phi3);
 0  0                0   0  0                0   0   0                 1
 ];
end

%%
function Gamma=Gamma4bar(phi1,phi2,phi3,dphi1,dphi2,dphi3)

L1=100;L2=25*sqrt(53);L3=27.0517715;

Gamma=[ 
(L1/2)*cos(phi1)*dphi1^2;
(L1/2)*sin(phi1)*dphi1^2;
(L1/2)*cos(phi1)*dphi1^2+(L2/2)*cos(phi2)*dphi2^2;
(L1/2)*sin(phi1)*dphi1^2+(L2/2)*sin(phi2)*dphi2^2;
(L2/2)*cos(phi2)*dphi2^2+(L3/2)*cos(phi3)*dphi3^2;
(L2/2)*sin(phi2)*dphi2^2+(L3/2)*sin(phi3)*dphi3^2;
(L3/2)*cos(phi3)*dphi3^2;
(L3/2)*sin(phi3)*dphi3^2;
0];
end