%% hw2_1
TC = [25 80 80 100 200 400 600 800 1000];
%T  =[298.15 353.15 353.15 373.15 473.15 673.15 873.15 1073.15 1273.15];
T = TC+273.15;
Tr = 298.15;

cp_steam_ht= @(T) 143.05       -58.040*T.^0.25  +8.2751*T.^0.5  -0.036989*T;
cp_steam_st= @(T) 143.05*T.^-1 -58.040*T.^-0.75 +8.2751*T.^-0.5 -0.036989;
cp_h2_ht=    @(T) 56.505       -22222.6*T.^-0.75 +116500*T.^-1 -560700*T.^-1.5;
cp_h2_st=    @(T) 56.505*T.^-1 -22222.6*T.^-1.75 +116500*T.^-2 -560700*T.^-2.5;
cp_o2_ht=    @(T) 37.432       +2.0102*10^-5*T.^1.5 -178570*T.^-1.5 +2368800*T.^-2;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
cp_o2_st=    @(T) 37.432*T.^-1 +2.0102*10^-5*T.^0.5 -178570*T.^-2.5 +2368800*T.^-3;

for k=1:1:9
    if k<=2
ht_h2o = -285838 + integral(@(T) cp_steam_ht(T), Tr, T(k));
st_h2o =  70.05  + integral(@(T) cp_steam_st(T), Tr, T(k));
    else
ht_h2o = -241827 + integral(@(T) cp_steam_ht(T), Tr, T(k));
st_h2o =  188.83 + integral(@(T) cp_steam_st(T), Tr, T(k));
    end
    
ht_h2  =          integral(cp_h2_ht, Tr, T(k));
st_h2  = 130.59 + integral(cp_h2_st, Tr, T(k));

ht_o2  =          integral(cp_o2_ht, Tr, T(k));
st_o2  = 205.14 + integral(cp_o2_st, Tr, T(k));

delta_hf = ht_h2o - ht_h2 - 0.5*ht_o2;
delta_sf = st_h2o - st_h2 - 0.5*st_o2;
delta_gf = delta_hf - T*delta_sf;
%in order to bring delta_gf in kJ/mol^-1 form ->
delta_gf_final = delta_gf(k)/1000

end

%% hw2_2

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







