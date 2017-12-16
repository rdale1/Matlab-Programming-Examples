function main
%% load data
data =xlsread('AD_even_96.xlsx','Sheet1','A2:AF6001');
% % % % % % % % % % % % % % % % % % % % % 
%% Parameters: initial guesses go here
% % % % % % % % % % % % % % % % % % % % % 
a=0.5; e=1e7;
%
tmax=4;tspan=0:.01:tmax;
% % % % % % % % % % % % % % % % % % % % % 
%% Curve fitting parameters: lower, uppper bounds
% % % % % % % % % % % % % % % % % % % % % 
P=[a,e];
lb=[0,1e5];
ub=[2,2e10];
% % % % % % % % % % % % % % % % % % % % % 
%% curvefit call
% % % % % % % % % % % % % % % % % % % % % 
options = optimoptions('lsqcurvefit','Algorithm','trust-region-reflective','Display','iter');
[P] = lsqcurvefit(@(P,datafit)min(P,datafit),P,tspan,datafit,lb,ub,options)
a=P(1);%assign the fit value
e=P(2);
for i=1 % print it to console
    P(i)
end
%% plot
options=odeset('RelTol',1e-8);%'Mass',M,
[t,x1]=ode15s(@lucif,tspan,Xo1,options,a];
plot(tspan,x1(:,29)*10000*e,'LineWidth',2);% multpliy light by gain parameter
xlim([0 tmax])
hold on
plot(tspan,data(:,1),'.k','LineWidth',.5);
return
function result = min(P,ydata) %% minimizing function
a=P(1);
e=P(2);
%%
tmax=599.9;tspan=0:.1:tmax;options=odeset('RelTol',1e-8);
[t,x]=ode15s(@lucif,tspan,Xo1,options,a);
result=x(:,29)*e;
return 
function [dx_dt] =lucif(t,x,a)
%% eqns
dx_dt=dx_dt';
return
