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
ms = MultiStart;
problem = createOptimProblem('lsqcurvefit','x0',P,'objective', @(P,datafit)min(P,datafit),'lb',lb,'ub',ub,'xdata',tspan,'ydata',datafit,'nonlcon',constraint,'options',opts);
[xms,~,~,~,solsms]=run(ms,problem,1);
P=xms
