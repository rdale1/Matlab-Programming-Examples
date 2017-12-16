function main
k1=;
k2=;
k3=;
k4=;
k5=;
k6=;
k7=;
k8=;
k9=;
k10=;
dark=;
gain=1e5;
options=('RelTol',1e-6);
Xo=[50,0,0,0,0,0,0,0,0,0,0,1000000,75000];
[t,x]=odes15(@cf,tspan, Xo, options,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,dark);
plot(tspan,x(:,8)*gain,'Linewidth',2);

return

function [dx_dt] = cf(t,x,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,dark)
dx_dt(1)=-k1*x(1)*x(12)+k2*x(2)-k3*x(1)*x(13)+k4*x(3)+k7*x(6)-k8*x(10)*x(1)+k9*x(7)-k10*x(9)*x(1);
dx_dt(2)=k1*x(1)*x(12)-k2*x(2)-k3*x(2)*x(13)+k4*x(4);
dx_dt(3)=k3*x(1)*x(13)-k4*x(3)-k1*x(3)*x(12)+k2*x(4);
dx_dt(4)=+k3*x(2)*x(13)-k4*x(4)+k1*x(3)*x(12)-k2*x(4)-k5*x(4);
dx_dt(5)=k5*x(4)-k6*x(5);
dx_dt(6)=k6*dark*x(5)-k7*x(6)+k8*x(10)*x(1);
dx_dt(7)=k6*(1-dark)*x(5)-k9*x(7)+k10*x(9)*x(1);
dx_dt(8)=k6*(1-dark)*x(5)-x(8);
dx_dt(9)=k9*x(7)-k10*x(9)*x(1);
dx_dt(10)=k7*x(6)-k8*x(10)*x(1);
dx_dt(11)=0;
dx_dt(12)=-k1*x(1)*x(12)+k2*x(2)-k1*x(3)*x(12)+k2*x(4);
dx_dt(13)=-k3*x(1)*x(13)+k4*x(3)-k3*x(2)*x(13)+k4*x(4);
dx_dt=dx_dt';
return