clc
clear all
format short

syms y t;
f = @(t,y) 2.*y./t+t.^2.*exp(t);
N = 2;
b = 2;
a = 1;
h = (b-a)/N;
w(1)=0;
yex(t) = t^2*(exp(t)-exp(1))
% %================
% Generate t
t = a:h:b;
% %================
for i = 1:N
    k1(i)= f(t(i),w(i));
    k2(i)= f(t(i+1),w(i)+k1(i)*h);
    w(i+1) = w(i)+(k1(i)+k2(i))*(h/2);
end
% %================
A = zeros(N,5);
disp('      t(i)       w(i)       k1       k2       w(i+1)');
for i = 1:N
    A(i,1) = t(i);
    A(i,2) = w(i);
    A(i,3) = k1(i);
    A(i,4) = k2(i);
    A(i,5) = w(i+1);
end
A
disp('Approx solution');
w
% %================
disp('y Exact');
y = yex(t);
double(y)
E1 = 0;
for i = 1:N+1
    E1 = E1 + (w(i)-y(i))^2;
end
E1;
E = sqrt(E1);
double(E)