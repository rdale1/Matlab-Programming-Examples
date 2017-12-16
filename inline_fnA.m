function main
kr1=0.497;
...
a=0.56;b=9;kdfc=10;ks=1;
k1e=.1;k2e=.1;kin=.5;kdr=0.00061;
options = odeset('RelTol',1e-6);
tspan=0:0.1:10;Xo=[1,1,1,0,0,0,0,0,0];
[t,x]=ode15s(@circ,tspan,Xo,options,k1e,kr2,...,k32,k5)
return