T = [25 80 100 200 400 600 800 1000];
delta_gf = [-237.2 -228.2 -225.2 -220.4 -210.3 -199.6 -188.6 -177.4];
T_exhaust =  373.15;
h_liquid  = -285.84;
h_steam   = -241.83;
%in Table 2.2 at T=80C water form is liquid
%therefore steam form at at T=80C is neglected
hold
for j = 1:1:8
    %carnot_limit=(T(j)-100)/(T(j)+273.15)
    carnot_limit=(T(j)+273.15-100-273.15)/(T(j)+273.15)
    plot(T(j), 100*carnot_limit,'o');
end
for j = 1:1:8
    if j <=2
limiting_efficiency = delta_gf(j)/h_liquid
    else     
limiting_efficiency = delta_gf(j)/h_liquid
    end
plot(T(j), 100*limiting_efficiency, 'x');
end
xlabel('Operating temperature (C)');
ylabel('Efficiency limit (%)');
%axis = ([0 100 0 1000]);
