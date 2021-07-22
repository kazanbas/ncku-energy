r=1;
zeta=0.1;
wn=25.318*pi;
wd=25.318*sqrt(1-zeta.^2)
t=0:0.001:0.5;
x=((1./2).*(-t./wn.*cos(wn.*t)+sin(wn.*t)/wn.^2))
plot(t,x);
xlabel('Time')
ylabel('Resonance responses')
%% %3
clc
clear
r=1;
zeta=0.05;
zeta1=0.1;
zeta2=0.2;
wn=25.318*pi;
wd=25.318*sqrt(1-zeta.^2)*pi;
t=0:0.001:1;
x=((1./2).*(-wn.*t.*cos(wn.*t)+sin(wn.*t)))
A=1./(2.*sqrt(1-zeta^2));
B=1./(2.*zeta);
A1=1./(2.*sqrt(1-zeta1^2));
B1=1./(2.*zeta1);
A2=1./(2.*sqrt(1-zeta2^2));
B2=1./(2.*zeta2);
theta=atan((2.*zeta.*r)/(1-r^2));
theta1=atan((2.*zeta1.*r)/(1-r^2));
theta2=atan((2.*zeta2.*r)/(1-r^2));
X=1/sqrt(((1-r^2)+((2.*zeta.*r)^2)));
X1=1/sqrt(((1-r^2)+((2.*zeta1.*r)^2)));
X2=1/sqrt(((1-r^2)+((2.*zeta2.*r)^2)));
xx=(exp(-zeta.*wn.*t).*(A.*sin(wd.*t)+B.*cos(wd.*t)))+X.*sin(wn.*t-theta);
xx1=exp(-zeta1.*wn.*t).*(A1.*sin(wd.*t)+B1.*cos(wd.*t))+X1.*sin(wn.*t-theta1);
xx2=exp(-zeta2.*wn.*t).*(A2.*sin(wd.*t)+B2.*cos(wd.*t))+X2.*sin(wn.*t-theta2);
plot(t,xx,t,xx1,t,xx2);
%{
figure
plot(t,xx)
figure
plot(t,xx1)
figure
plot(t,xx2)
%}
xlabel('Time')
ylabel('Resonance responses')
%% %4
t=0:0.001:0.25;
x = (7.05183*10^-4)*sin(40*t*pi);
plot(t,x)
xlabel('time')
ylabel('x(t)')
%% %5
t=0:0.001:0.15;
x = (7.05183*10^-4)*sin(40*t*pi);
x1 = (7.0456*10^-4)*sin(40*t*pi+0.042);
plot(t,x,t,x1)
xlabel('time')
ylabel('x(t)')
%% %6-1
F0=100;
k=6000;
r=0:0.01:3;
zeta=0.1;
xx=(F0/k)./sqrt(((1-r.^2).^2)+((2.*zeta.*r).^2));
plot(r,xx)
xlabel('r')
ylabel('Magnitude')
%% %6-2
zeta=0.1;
r=0:0.01:3;
for i = 1 :length(r)
    if r(i) <= 1;
    theta(i)=atand(2.*zeta.*r(i)./(1-r(i).^2));
    else r(i) > 1;
    theta(i)=atand(2.*zeta.*r(i)./(1-r(i).^2))+180;
    end
end
plot(r,theta)
xlabel('r')
ylabel('Phase angle')

