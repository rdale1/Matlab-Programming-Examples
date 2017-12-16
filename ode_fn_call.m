tspan=[0:.001:6000];
Xo=init_cond;
options=odeset('RelTol',1e-6);
[t,x]=ode15s(@odefn,tspan,Xo,options,t,variables);