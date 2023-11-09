% JJ System.
% Make sure JJbifurcation is in your directory.
function xdot=JJsystem(t,x)
% The JJ system.
% Run Programs 20f.
global kappa;
xdot(1)=x(2);
xdot(2)=kappa-0.6*x(2)-sin(x(1));
xdot=[xdot(1);xdot(2)];