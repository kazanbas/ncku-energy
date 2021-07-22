%% 1
close all;clear;clc
A=importdata('Signal_stdDev.mat');
% struct.field = structure.field
% X & t are var's from 'Signal_stdDev.mat
Fun=A.X;
Time=A.t;
figure
plot(Time,Fun);
xlabel('Time(s)');
ylabel('Signal');

%B=filloutliers(A,'linear')


%threshold = 3;
%moreThanThreshold = Fun > 3; 
%over_Fun = Fun(moreThanThreshold);
%over_Time = Time(moreThanThreshold);
%hold on;
%plot( 'x');

%The statement length(X) is equivalent to max(size(X)) for nonempty arrays and 0 for empty arrays.
%n = length(X) returns the size of the longest dimension of X. If X is a vector, this is the same as its length.
N=length(Fun)
mu=sum(Fun)/N
variance=sum((Fun-mu).^2)/N
% last two lines are identical to variance=var(Fun), but we need 'mu'
stDev=sqrt(variance)
%% 2
B=importdata('SampleData8192.txt');
N=length(B);
mu=sum(B)/N
variance=sum((B-mu).^2)/N
% variance=var(B);
stDev=sqrt(variance)
y=B;
Interval=50;
[Count,Bin]=hist(y,Interval);
Total_N=sum(Count);
dx=5/Interval;
Frequency=Count/Total_N;
Px=Frequency/dx;
figure
bar_width=1;
bar(Bin,Px,bar_width);
xlabel('x(t)');
ylabel('P(x)');
Kurtosis=sum((B-mu).^4)/N*variance^2
%% 3
close all;clear;clc;
C=importdata('Data.mat');
N=length(C);
mu=sum(C)/N;
variance=sum((C-mu).^2)/N;
stDev=sqrt(variance);
f=1/(stDev*sqrt(2*pi))*exp(-(C-mu).^2/(2*stDev.^2));
plot(C,f)
xlabel('Standard deviation');
ylabel('PDF');

%histogram diagram
y=C;
Interval=50;
[Count,Bin]=hist(y,Interval);
Total_N=sum(Count);
dx=5/Interval;
Frequency=Count/Total_N;
Px=Frequency/dx;
figure
bar_width=1;
bar(Bin,Px,bar_width)
xlabel('x(t)');
ylabel('P(x)');

%% 5
t = 0:0.001:3;
xref = sin(2*pi*t).*cos(2*pi*t);
xs1 = 0.5*sin(2*pi*t).*cos(2*pi*t);
xs2 = 1.0*sin(2*pi*t).*cos(2*pi*t);
xs3 = 1.0*sin(2*pi*t).*cos(2*pi*t)+0.1*sin(2*pi*10*t);

vaf1=(1-(xs1-xref)/xref)*100
vaf2=(1-(xs2-xref)/xref)*100
vaf3=(1-(xs2-xref)/xref)*100


