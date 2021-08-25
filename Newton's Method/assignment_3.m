%%%%%%%%%%%%%%%%%%%%%%    Mert Emrem - 250203015    %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%    CE301 - Assignment #3     %%%%%%%%%%%%%%%%%%%%%%

% NOTE: Error (epsilon) is interpreted as absolute error.

clc; clear all;

syms f(x)

f(x) = exp(2*x)*sin(x) - 3*x*cos(2*x);

% Following line executed once externally to save computation load
% Df = diff(f,x);

Df(x) = 6*x*sin(2*x) - 3*cos(2*x) + exp(2*x)*cos(x) + 2*exp(2*x)*sin(x);

err001 = 0.001;
err0001 = 0.0001;
err00001 = 0.00001;
x = 0;
x_err001 = [];
x_err0001 = [];
x_err00001 = [];
maxit = 100;

err = 1;

for i = -5:1:5
    
    iteration = 0;
    x = i;
    
    while err > err001 && iteration <= maxit
    
       iteration = iteration + 1;
       x = x - double(f(x))/double(Df(x));
       
       err = abs(double(f(x)));
    end
    
    x_err001 = [x_err001 x];
    err = 1;
    
end


for i = -5:1:5
    
    iteration = 0;
    x = i;
    
    while err > err0001 && iteration <= maxit
    
       iteration = iteration + 1;
       x = x - double(f(x))/double(Df(x));
       
       err = abs(double(f(x)));
    end
    
    x_err0001 = [x_err0001 x];
    err = 1;
    
end


for i = -5:1:5
    
    iteration = 0;
    x = i;
    
    while err > err00001 && iteration <= maxit
    
       iteration = iteration + 1;
       x = x - double(f(x))/double(Df(x));
       
       err = abs(double(f(x)));
    end
    
    x_err00001 = [x_err00001 x];
    err = 1;
    
end


disp("x values for initial guesses between -5 and 5 w/ step size of 1");



line_1 = ['----> error < 0.001  : ',];
disp(" ");
disp(line_1);
x_err001
disp(" ");
line_1 = ['----> error < 0.0001  : ',];
disp(" ");
disp(line_1);
x_err0001
disp(" ");
line_1 = ['----> error < 0.00001  : ',];
disp(" ");
disp(line_1);
x_err00001

