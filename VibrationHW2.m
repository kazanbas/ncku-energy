%% %3-1
clc
close
clear
 
t=0:0.001:20;
x=0.5.*cos(1.618.*t)+0.5.*cos(0.618.*t);
% x=0.5.*cos(23.591.*t)+0.5.*cos(27.172.*t);
 %x=0.5.*cos(15.648.*t)+0.5.*cos(40.966.*t);
plot(t,x)
xlabel('Time')
ylabel('x1(t)')
grid
%% %3-2
clc
close
clear
 
t=0:0.001:20;
x=-0.309.*cos(1.618.*t)+0.809.*cos(0.618.*t);
% x=3.7954.*cos(21.172.*t)-3.2954.*cos(27.172.*t);
plot(t,x)
xlabel('Time')
ylabel('x2(t)')
grid
%% .. Q3
clc;clear;
syms A1 A2 x1 x2 

equation1 = (A1)*sin(x1)+(A2)*sin(x2)==1;
equation2 = -0.618*A1*sin(x1)+1.618*sin(x2)==0.5;
equation3 = (1.618*A1)*cos(x1)+0.618*A2*cos(x2)==0;
equation4 = (-A1)*cos(x1)+A2*cos(x2)==0;
[sol1,sol2,sol3,sol4] = vpasolve([equation1,equation2,equation3,equation4],[A1,A2,x1,x2])
%% %4
clc
close
clear
 
t=0:0.001:20;
%x=0.85066.*cos(1.618.*t);
x=-0.5257.*cos(1.618.*t);
plot(t,x)
xlabel('Time')
ylabel('x1(t)')
grid
%% %5-1
clc
close
clear
 
t=0:0.001:2;
x1=0.5.*cos(27.172.*t)+0.5.*cos(23.5914.*t);
x2=(0.222825.*exp(-5.5126.*t).*(2.2444.*cos(22.938.*t)+0.5394.*sin(22.938.*t)))+(0.239.*exp(-8.376.*t).*(2.0915.*cos(25.85.*t)+0.6785.*sin(25.85.*t)));
plot(t,x1,t,x2)
xlabel('Time')
ylabel('x1(t)')
grid
%% %5-2
clc
close
clear
 
t=0:0.001:2;
x1=-3.294363.*cos(27.172.*t)+3.7943625.*cos(23.5914.*t);
x2=(1.691.*exp(-5.5126.*t).*(2.2444.*cos(22.938.*t)+0.5394.*sin(22.938.*t)))+(-1.5756.*exp(-8.376.*t).*(2.0915.*cos(25.85.*t)+0.6785.*sin(25.85.*t)));
plot(t,x1,t,x2)
xlabel('Time')
ylabel('x2(t)')
grid

%% %6-1
t=0:0.001:3;
x1=0.466*sin(23.591.*t)+0.5*cos(23.591.*t)+0.01903*sin(20.*t)+0.5*sin(27.172.*t)+0.5366*cos(27.172.*t)+0.010142.*sin(20*t);
x2=3.535*sin(23.591.*t)+3.8*cos(23.591.*t)+0.1444*sin(20.*t)-3.3*sin(27.172.*t)+3.535*cos(27.172.*t)+0.067*sin(20.*t);
plot(t,x1)
hold on
plot(t,x2) 
xlabel('Time')
ylabel('Response')
legend('x1','x2')


