%%%%%%%%%%%%%%%%%%%%%%    Mert Emrem - 250203015    %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%    CE301 - Assignment #3     %%%%%%%%%%%%%%%%%%%%%%

clc; clear all;

syms f(x) y

f(x) = 0.5*(1+x)*y^2;

[domain_l, domain_u, h] = deal(0, 0.2, 0.0001);

x = 0:h:domain_u;
y = [2];

segment_no = (domain_u-domain_l)/h;

for i = 1:segment_no
        
    y_p_next = y(i) + h*(x(i)^2 + y(i)^2);
    y_c_next = y(i) + 0.5*h*((x(i)^2+y(i)^2) + (x(i+1)^2+y_p_next^2));
    y = [y y_c_next];

end

plot(x,y)
title('Modified Euler values of y versus x')
xlabel('x') 
ylabel('y')     