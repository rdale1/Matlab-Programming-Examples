function main
% % % % % % % % % % % % % % % % % % % % % 
%% Parameters: nM
% % % % % % % % % % % % % % % % % % % % % 
kadenyl=31.33;
a=313;
koni=0:.0001:.01;
l=249;
konl=.004;
kona=.005;
ii=25;
kcat=2.88;
dark=521;
deg=0.000136;
tspan=0:.01:80;

% % % % % % % % % % % % % % % % % % % % % 
%% Simulations
% % % % % % % % % % % % % % % % % % % % % 
E=50;
LH2AMP=15;
result = zeros(8001,101);
for j=1:101
    Xo1=[E 0 0 0 0 0 0 LH2AMP 0];
    options=odeset('RelTol',1e-6);%free=0;
    [t,x1]=ode15s(@lucif,tspan,Xo1,options,kadenyl,kcat,deg,a,l,ii,dark,kona,konl,koni(j));
    result(:,j)=x1(:,9);
end
% % % % % % % % % % % % % % % % % % % % % 
%% 3D Plot
% % % % % % % % % % % % % % % % % % % % %
%% surface and contour plot
figure(1)
colormap hsv
s=surfc(result,'FaceAlpha',0.75);
colorbar
set(gca,'fontsize', 16,'FontName','Helvetica');
set(gcf,'color','w')
set(gca,'xtick',[])
shading interp
ylabel('Time (s)')
xlabel('kon')
zlabel('RLU')

%% contour plot only
figure(2)
colormap jet
g=contour3(result);
colorbar
set(gca,'fontsize', 16,'FontName','Helvetica');
set(gcf,'color','w')
set(gca,'xtick',[])
ylabel('Time (s)')
xlabel('kon')
zlabel('RLU')

%% layer multiple contour plots
figure(3)
colormap cool
g=contour3(result);hold on
g=contour3(result*10);
colorbar
set(gca,'fontsize', 16,'FontName','Helvetica');
set(gcf,'color','w')
set(gca,'xtick',[])
ylabel('Time (s)')
xlabel('kon')
zlabel('RLU')

%% interpolation 
figure(4)
[X,Y]=meshgrid(koni,tspan);
[M,c]=contour3(X,Y,result,50);
colorbar
c.LineWidth = 2;
set(gca,'fontsize', 16,'FontName','Helvetica');
set(gcf,'color','w')
set(gca,'xtick',[])
ylabel('Time (s)')
xlabel('kon')
zlabel('RLU')

%% heatmap
figure(5)
heatmap(result)
colorbar
set(gca,'fontsize', 16,'FontName','Helvetica');
set(gcf,'color','w')
set(gca,'xtick',[])
ylabel('Time (s)')
xlabel('kon')
zlabel('RLU')

%% heatmap but change range of colormap
figure(6)
heatmap(result)
colorbar
lim = caxis 
caxis([.3*lim(2) lim(2)])
set(gca,'fontsize', 16,'FontName','Helvetica');
set(gcf,'color','w')
set(gca,'xtick',[])
ylabel('Time (s)')
xlabel('kon')
zlabel('RLU')
return


function [dx_dt] = lucif(t,x,kadenyl,kcat,deg,aa,ll,ii,dark,kona,konl,koni)
%% equations
% free luciferase
dx_dt(1) = -kona*x(1)*x(6) + aa*x(2) -konl*x(1)*x(7) + ll*x(3) - koni*x(1)*x(8) + ii*x(5)-deg*x(1)+kcat*x(5);
%L:a
dx_dt(2)= kona*x(1)*x(6) - aa*x(2) - konl*x(2)*x(7) + ll*x(4) ;
%L:l
dx_dt(3)=  konl*x(1)*x(7) - ll*x(3) -kona*x(3)*x(6) + aa*x(4);
%L:l & a
dx_dt(4)=  konl*x(2)*x(7) - ll*x(4)  +kona*x(3)*x(6) - aa*x(4) -kadenyl*x(4);
%L:i
dx_dt(5)=kadenyl*x(4) + koni*x(1)*x(8) - ii*x(5) -kcat*x(5);
% atp
dx_dt(6)=-kona*x(1)*x(6) + aa*x(2) -kona*x(3)*x(6) + aa*x(4);
% lh2
dx_dt(7)=  -konl*x(1)*x(7) + ll*x(3) - konl*x(2)*x(7) + ll*x(4);
%intermediate / lh2amp
dx_dt(8)=  - koni*x(1)*x(8) + ii*x(5);
% light
dx_dt(9)=700000*kcat*x(5)*dark-x(9);
dx_dt=dx_dt';
return
