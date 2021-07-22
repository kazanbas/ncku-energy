%% besicetion
% Bisection method and position trajectory
% clc;clear;close all;
err=0.001;
format long
OA=100;AB=75;rab=182.0027472;
theta1=[90:290]';
for nn=1:length(theta1)
    ans1(nn,1)=theta1(nn);
    f=@(theta2) ((AB*cosd(theta1(nn))-(OA*cosd(theta2)-250))^2+(AB*sind(theta1(nn))-(OA*sind(theta2)-50))^2)^0.5-rab;
    count=1;fr=1;
for n=-180:180
    f1=f(n);f2=f(n-1);
    fr=f1*f2;
    if f1>0 
    elseif f1==0
       count=count+1;
       ans1(nn,count)=n;   
    else
    end
    if fr<0
        m1=n;m2=n-2;
       m3=(m1+m2)/2; %%bisection method
       while abs(f(m3))>err
           if f(m3)*f(m1)>0
               m1=m3;
           else
              m2=m3; 
           end
           m3=(m1+m2)/2;
       end
       count=count+1;
       ans1(nn,count)=m3;
    end
end
if count==1
   disp(["no answers if theta1=",num2str(theta1(nn))]) 
end
end
ans2=[AB*cosd(ans1(:,1));AB*sind(ans1(:,1))];
ans3=[OA*cosd(ans1(:,2))-250 OA*cosd(ans1(:,3))-250;OA*sind(ans1(:,2))-50 OA*sind(ans1(:,3))-50];

figure
plot(AB*cosd(theta1),AB*sind(theta1))
hold on; grid on;
plot(OA*cosd(ans1(:,2))-250,OA*sind(ans1(:,2))-50)
plot(OA*cosd(ans1(:,3))-250,OA*sind(ans1(:,3))-50)
legend({'B trajectory','A lower trajectory','A upper trajectory'})
%% Angular velocity 
for n=2:length(ans1)
    if n>1
        v1(n,1)=ans1(n,2)-ans1(n-1,2);
        v1(n,2)=ans1(n,3)-ans1(n-1,3);
    end
end
v1(1,:)=2*v1(2,:)-v1(3,:);
figure
plot(1:length(v1),v1)
legend({'OA upper angular veloc','OA lower angular velo'})

for n=2:length(ans1)
    if n>1
        v2(n,1)=ans1(n,1)-ans1(n-1,1);
    end
end
v2(1,:)=2*v2(2,:)-v2(3,:);
figure
plot(1:length(v2),v2)
legend({'BC angular velo'})

m(:,1)=(75*sind(theta1)+50-100*sind(ans1(:,2)))./(75*cosd(theta1)+250-100*cosd(ans1(:,2)));
m(:,2)=(75*sind(theta1)+50-100*sind(ans1(:,3)))./(75*cosd(theta1)+250-100*cosd(ans1(:,3)));
theta3=atand(m);
for n=2:length(ans1)
    if n>1
        v3(n,1)=theta3(n,1)-theta3(n-1,1);
        v3(n,2)=theta3(n,2)-theta3(n-1,2);
    end
end
v3(1,:)=2*v3(2,:)-v3(3,:);
figure
plot(1:length(v3),v3)
legend({'AB upper angular velo','AB lower angular velo'})
%% Angular acceleration
for n=2:length(v1)
    if n>1
        a1(n,1)=v1(n,1)-v1(n-1,1);
        a1(n,2)=v1(n,2)-v1(n-1,2);
    end
end
a1(1,:)=2*a1(2,:)-a1(3,:);
figure
plot(1:length(a1),a1)
legend({'OA upper angular acce','OA lower angular acce'})

for n=2:length(v2)
    if n>1
        a2(n,1)=v2(n,1)-v2(n-1,1);
    end
end
a2(1,:)=2*a2(2,:)-a2(3,:);
figure
plot(1:length(a2),a2)
legend({'BC angular acce'})

for n=2:length(v3)
    if n>1
        a3(n,1)=v3(n,1)-v3(n-1,1);
        a3(n,2)=v3(n,2)-v3(n-1,2);
    end
end
a3(1,:)=2*a3(2,:)-a3(3,:);
figure
plot(1:length(a3),a3)
legend({'AB upper angular acce','AB lower angular acce'})