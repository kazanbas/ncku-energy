% HW4 due Nov 13
clc;clear;close
n=196; p=43; A=0.27; 
h=[7:0.5:17]; w=-15*(12-h);
d=23.45*sind(360*(284+n)/365);
cos_tz=cosd(p)*cosd(d)*cosd(w)+sind(p)*sind(d);
a0star=0.4237-0.00821*(6-A)^2;
a1star=0.5055+0.00595*(6.5-A)^2;
k_star=0.2711+0.01858*(2.5-A)^2;
Gon=1367*(1+0.033*cosd(360*n/365));
% 43N -> Mid-latitude, July 15 hence Mid-latitude summer. Table 2.8.1 gives
r0=0.97; r1=0.99; r2=1.02; a0=r0*a0star; a1=r1*a1star; k=r2*k_star;
tau_b=a0+a1*exp(-k./cos_tz); tau_d=0.271-0.294*tau_b;    
% Multiplication by 3600 makes it hour based. Marked by I instead of G.
% 6th number in row matrix of 20 variables equals to 9.5, which is 09:30am.
Gcnb=Gon.*tau_b; Icnb=Gcnb*3600; hourly_beam_radiation=Icnb(6)
Icb=Icnb.*cos_tz; horizontal_component=Icb(6)
Go=Gon.*cos_tz; Gd=Go.*tau_d; Id=Gd*3600;
Iglobal=Icb+Id; hourly_global_radiation=Iglobal(6)
t=[7.5:0.5:17.5];
subplot(2,1,1);plot(t,Iglobal);
hold on; grid
xlabel('Time');ylabel('Hourly Global Radiation');
axis([7,18,10^6,3.5*10^6]);

theta_z=acosd(cos_tz);
S=40*cscd(90-theta_z); sun_ray_path_length=S(6)
subplot(2,1,2);plot(t,S);
hold on; grid
xlabel('Time');ylabel('Sun-ray path length');
axis([7 18 40 100]);

% Units are W/m^2, except for Sun-Ray Path Length, unit of which is km.
% Q2 summary
% The two plots are inversely related.
% The smaller Sun-Ray Path Length, the bigger Hourly Global Radiation gets,
% since it approaches the meridian.
% This results in direct radiation to the ground & max. radiation,
% but min. distance to the meridian.