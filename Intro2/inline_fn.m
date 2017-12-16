function main
kr1=0.497;
...
a=0.56;b=9;kdfc=10;ks=1;
k1e=.1;k2e=.1;kin=.5;kdr=0.00061;
options = odeset('RelTol',1e-6);
tspan=0:0.1:10;Xo=[1,1,1,0,0,0,0,0,0];
[t,x]=ode15s(@circ,tspan,Xo,options,k1e,kr2,...,k32,k5)
return
function[dx_dt]=circ(t,x,k1e,kr2,...,k32,k5)
dx_dt(1)=x(2).*k1e-x(1).*(2.*kr2+kin+2.*k2e)-kdr.*x(1).*(1+kdfr/(1+a.*kdfr(x(1)+x(2))+b));
...
dx_dt(9)=x(8).*k2e-x(9).*(k5+kdr+2.*k1e);
dx_dt=dx_dt';
return
