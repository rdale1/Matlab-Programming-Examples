function[dx_dt]=circ(t,x,k1e,kr2,...,k32,k5)
dx_dt(1)=x(2).*k1e-x(1).*(2.*kr2+kin+2.*k2e)-kdr.*x(1).*(1+kdfr/(1+a.*kdfr(x(1)+x(2))+b));
...
dx_dt(9)=x(8).*k2e-x(9).*(k5+kdr+2.*k1e);
dx_dt=dx_dt';
return
