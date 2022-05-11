clc
clear all
format short

%2a)
syms y t
f =@(t,y) sin(y)
h = 0.25;
a = 0;
b = 1;
N = (b-a)/h;
w(1) = 1;
% yex(t) = t^2*(exp(t)-exp(1));
% %================
% Generate t
t = a:h:b;
% %================
for i = 1:N
    w(i+1) = w(i) + h*f(t(i),w(i));
end
% %================
A = zeros(3,N+1);
for i = 1:N+1
    A(1,i) = i-1;
    A(2,i) = t(i);
    A(3,i) = w(i);
end
A
disp('Approx solution');
w
% %================
% disp('y Exact');
% y = yex(t1)
% E1 = 0;
% for j = 1:N+1
%     E1 = E1 + (w(j)-y(j))^2;
% end
% E1;
% E = sqrt(E1);
% E