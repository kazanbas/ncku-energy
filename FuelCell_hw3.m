%% hw3_1
i=linspace(1,1000,200);
E = 1.2; A = 0.06;
%v = E - A*(log(i) - log(i_0));

v1 = E - A*(log(i) - log(0.01));
plot (i,v1);
hold on

v2 = E - A*(log(i) - log(1));
plot (i,v2);

v3 = E - A*(log(i) - log(100));
plot (i,v3);
hold off
axis ([0 1000 0 1.2]);

%xticks(0:200:1000);
%yticks(0:0.2:1.2);

xlabel('Current density (mA*cm^-2)');
ylabel('Cell voltage (V)');

%% hw3_3
Eoc=1.031; A=0.03; r=0.000245; m=0.0000211; n=0.008;
i=linspace(1,1000,200);
v= Eoc - r*i - A*log(i) - m*exp(n*i);
plot (i,v);
axis ([0 1000 0 1.2]);
format long g;

%% hw3_4
Eoc=1.01, A=0.002, r=0.0002, m=0.0001, n=0.008
i=linspace(1,1000,200)
v= Eoc - r*i - A*log(i) - m*exp(n*i)
plot (i,v)
axis ([0 1000 0 1.2]);
format long g
 


