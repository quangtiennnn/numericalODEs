clc
clear all
format short
syms y t;
% f(t,y) = t^-2*sin(2*t)-2*(t^(-1))*y
f= @(t,y) (y.^2)./(1+t)
f(1,5);

N = 4;
b = 2;
a = 1;
h = (b-a)/N;
w(1)= -log(2)^(-1);
yex(t)= -1/log(t+1)
% %================
% Generate t
t = a:h:b;
% %================
for i = 1:N
    k1(i)= f(t(i),w(i));
    k2(i)= f(t(i)+h/2,w(i)+k1(i)*h/2);
    k3(i)= f(t(i)+h/2,w(i)+k2(i)*h/2);
    k4(i)= f(t(i+1),w(i)+h*k3(i));
    w(i+1) = w(i)+(k1(i)+2*k2(i)+2*k3(i)+k4(i))*(h/6);
end
% %================
A = zeros(N,7);
disp('      t(i)       w(i)       k1       k2       k3       k4       w(i+1)');
for i = 1:N
    A(i,1) = t(i);
    A(i,2) = w(i);
    A(i,3) = k1(i);
    A(i,4) = k2(i);
    A(i,5) = k3(i);
    A(i,6) = k4(i);
    A(i,7) = w(i+1);
end
A
disp('Approx solution');
w
% %================
disp('y Exact');
y = yex(t)
E1 = 0;
for i = 1:N
    E1 = E1 + (y(i)-w(i))^2;
end
E1;
E = double(sqrt(E1));
E
