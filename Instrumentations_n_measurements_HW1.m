close all;clear;clc 
t=0:0.01:25;
A=importdata('CW_Openloop.xlsx');

figure
hold on
for a=2:12
    plot(A.data(:,1),A.data(:,a));
end
hold off
%{
plot(A.data(:,1),A.data(:,2));
hold on;
plot(A.data(:,1),A.data(:,3));
plot(A.data(:,1),A.data(:,4));
plot(A.data(:,1),A.data(:,5));
plot(A.data(:,1),A.data(:,6));
plot(A.data(:,1),A.data(:,7));
plot(A.data(:,1),A.data(:,8));
plot(A.data(:,1),A.data(:,9));
plot(A.data(:,1),A.data(:,10));
plot(A.data(:,1),A.data(:,11));
plot(A.data(:,1),A.data(:,12));
%}
xlabel('Counter');
ylabel('Time(s)');
legend ('Counter 30','Counter 45','Counter 60','Counter 75','Counter 90','Counter 105','Counter 120','Counter 135','Counter 150','Counter 165','Counter 180');
saveas(gcf,'fig 1.png');
% mean of the counter
figure
% Mean= sum(column)/length(column)

% SOMETHING MIGHT BE WRONG WITH FIGURE TWO
% FIX YOURSELF

hold on
for t=1:11  
    plot(t,(A.data(:,t))/length(A.data(:,t)),'O');
end
%{
plot(1,sum(A.data(:,2))/length(A.data(:,2)),'O');
hold on;
plot(2,sum(A.data(:,3))/length(A.data(:,3)),'O');
plot(3,sum(A.data(:,4))/length(A.data(:,4)),'O');
plot(4,sum(A.data(:,5))/length(A.data(:,5)),'O');
plot(5,sum(A.data(:,6))/length(A.data(:,6)),'O');
plot(6,sum(A.data(:,7))/length(A.data(:,7)),'O');
plot(7,sum(A.data(:,8))/length(A.data(:,8)),'O');
plot(8,sum(A.data(:,9))/length(A.data(:,9)),'O');
plot(9,sum(A.data(:,10))/length(A.data(:,10)),'O');
plot(10,sum(A.data(:,11))/length(A.data(:,11)),'O');
plot(11,sum(A.data(:,12))/length(A.data(:,12)),'O');
%}
xlabel('# of Sample');
ylabel('Mean');
legend('Counter 30','Counter 45','Counter 60','Counter 75','Counter 90','Counter 105','Counter 120','Counter 135','Counter 150','Counter 165','Counter 180')
saveas(gcf,'fig 2.png');
% standard Deviation of the counter
figure
%  StDev=sqrt(variance)
Mean1=sum(A.data(:,1)/length(A.data(:,1)));
Variance1=sum((A.data(:,1)-Mean1).^2/length(A.data(:,1)));

Mean2=sum(A.data(:,2)/length(A.data(:,2)));
Variance2=sum((A.data(:,2)-Mean2).^2/length(A.data(:,2)));
%03
Mean3=sum(A.data(:,3)/length(A.data(:,3)));
Variance3=sum((A.data(:,3)-Mean3).^2/length(A.data(:,3)));
%04
Mean4=sum(A.data(:,4)/length(A.data(:,4)));
Variance4=sum((A.data(:,4)-Mean4).^2/length(A.data(:,4)));
%05
Mean5=sum(A.data(:,5)/length(A.data(:,5)));
Variance5=sum((A.data(:,5)-Mean5).^2/length(A.data(:,5)));
%06
Mean6=sum(A.data(:,6)/length(A.data(:,6)));
Variance6=sum((A.data(:,6)-Mean6).^2/length(A.data(:,6)));
%07
Mean7=sum(A.data(:,7)/length(A.data(:,7)));
Variance7=sum((A.data(:,7)-Mean7).^2/length(A.data(:,7)));
%08
Mean8=sum(A.data(:,8)/length(A.data(:,8)));
Variance8=sum((A.data(:,8)-Mean8).^2/length(A.data(:,8)));
%09
Mean9=sum(A.data(:,9)/length(A.data(:,9)));
Variance9=sum((A.data(:,9)-Mean9).^2/length(A.data(:,9)));
%10
Mean10=sum(A.data(:,10)/length(A.data(:,10)));
Variance10=sum((A.data(:,10)-Mean10).^2/length(A.data(:,10)));
%11
Mean11=sum(A.data(:,11)/length(A.data(:,11)));
Variance11=sum((A.data(:,11)-Mean11).^2/length(A.data(:,11)));
%12
Mean12=sum(A.data(:,12)/length(A.data(:,12)));
Variance12=sum((A.data(:,12)-Mean12).^2/length(A.data(:,12)));

plot(1,sqrt(Variance2),'O');
hold on
plot(2,sqrt(Variance3),'O');
plot(3,sqrt(Variance4),'O');
plot(4,sqrt(Variance5),'O');
plot(5,sqrt(Variance6),'O');
plot(6,sqrt(Variance7),'O');
plot(7,sqrt(Variance8),'O');
plot(8,sqrt(Variance9),'O');
plot(9,sqrt(Variance10),'O');
plot(10,sqrt(Variance11),'O');
plot(11,sqrt(Variance12),'O');
xlabel('# of Sample');
ylabel('Standard Deviation');
saveas(gcf,'fig 3.png');