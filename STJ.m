clear;
clc;

xmin=0;
xmax=200;
ymin=0;
ymax=5;
Nz=5;
% xlin=linspace(xmin,xmax,Nz);
% ylin=linspace(ymin,ymax,Nz);
% [X0,Y0]=meshgrid(xlin,ylin);
% x0=reshape(X0,[],1);
% y0=reshape(Y0,[],1);
% x0=0.4*rand(Nz^2,1)+0.1;
% y0=ymax*rand(Nz^2,1);
% fy=@(y)y*(1-y/Kx/Ky)-y^2/(Kx^2+y^2);
% xnode=fsolve(fy,5);
% x0=Kx*ones(Nz^2,1);
% y0=xnode*ones(Nz^2,1);
x0=0.1*ones(Nz^2,1);
y0=0.1*ones(Nz^2,1);

% N=1;                   %%% 一个初始点给出的样本数
h=0.001;
alpha=2;
sigma1=0;
sigma2=0.5;
T=200;
nT=T/h;
t=linspace(0,T,nT+1);
xf=zeros(Nz^2,nT);
yf=zeros(Nz^2,nT);
xf(:,1)=x0';
yf(:,1)=y0';

%%% Generate data
M1=h^(1/alpha)*stblrnd(alpha,0,1,0,Nz^2,nT);
M2=h^(1/alpha)*stblrnd(alpha,0,1,0,Nz^2,nT);
for i=1:nT
    x0=xf(:,i);
    y0=yf(:,i);
    xf(:,i+1)=x0+y0.*h+sigma1*M1(:,i);
    yf(:,i+1)=y0+(1.4-1.2*y0-sin(x0))*h+sigma2*M2(:,i);
end

figure;
for i=1:Nz^2
    plot3(t,xf(i,:),yf(i,:));
    hold on
end
axis([0 T xmin xmax ymin ymax])
fsize=15;
xlabel('t','FontSize',fsize)
ylabel('x(t)','FontSize',fsize)
zlabel('v(t)','FontSize',fsize)
hold off

figure;
for i=1:Nz^2
    plot(xf(i,:),yf(i,:));
    hold on
end
axis([xmin xmax ymin ymax])
fsize=15;
xlabel('x(t)','FontSize',fsize)
ylabel('v(t)','FontSize',fsize)
hold off

figure;
for i=1:Nz^2
    plot(t,xf(i,:));
    hold on
end
axis([0 T xmin xmax])
fsize=15;
xlabel('t','FontSize',fsize)
ylabel('x(t)','FontSize',fsize)
hold off

figure;
for i=1:Nz^2
    plot(t,yf(i,:));
    hold on
end
axis([0 T ymin ymax])
fsize=15;
xlabel('t','FontSize',fsize)
ylabel('v(t)','FontSize',fsize)
hold off
