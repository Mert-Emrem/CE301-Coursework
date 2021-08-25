%%%%%%%%%%%%%%%%%%%%%%    Mert Emrem - 250203015    %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%    CE301 - Assignment #2     %%%%%%%%%%%%%%%%%%%%%%

% NOTE: Error (epsilon) is interpreted as absolute error.

clc; clear all;

% A = [1.6 -4.2  -8][x]   [22]
%     [  2   -9 2.4][y] = [18]  Switch rows 1-3, to make A diag. dominant
%     [7.5 -1.8 2.2][z]   [15]

% A = [7.5 -1.8 2.2][x]   [15]
%     [  2   -9 2.4][y] = [18]
%     [1.6 -4.2  -8][z]   [22]

[x_1, x_2, x_3, y_1, y_2, y_3, z_1, z_2, z_3, b_1, b_2, b_3] ...
    = deal(7.5, 2, 1.6, -1.8, -9, -4.2, 2.2, 2.4, -8, 15, 18, 22);

maxit = 1000;

A = [x_1 y_1 z_1; ...
     x_2 y_2 z_2; ...
     x_3 y_3 z_3];

B = [b_1; b_2; b_3];
 
% Back division (X = A\B) calculation results:

true_x =  1.932664292651343;
true_y = -1.930506096902989;
true_z = -1.349951440595662;

iteration = 0; x = 0; y = 0; z = 0;

% Assign variables var + 1 so that the loop is sure to begin

while 1

    err_goal = 0.01;
    err_x = err_goal + 1; err_y = err_goal + 1; err_z = err_goal + 1;  
    C = err_goal + 1;

    while max(C) > err_goal && iteration <= maxit

        iteration = iteration + 1;

        x = (b_1 - y_1*y - z_1*z)/x_1;
        y = (b_2 - x_2*x - z_2*z)/y_2;
        z = (b_3 - x_3*x - y_3*y)/z_3;

        err_x = abs(x  - true_x);
        err_y = abs(y  - true_y);
        err_z = abs(z  - true_z);

        C = [err_x, err_y, err_z];

    end
    
    if any(isnan(C(:)))
        disp ('---->  Solution is divergent.');
        break
    end
    
    % Assign results and reset variables
    
    x_err01 = x; y_err01 = y; z_err01 = z; 
    iteration = 0; x = 0; y = 0; z = 0;
    err_goal = 0.001;
    err_x = err_goal + 1; err_y = err_goal + 1; err_z = err_goal + 1;  
    C = err_goal + 1;
    

    while max(C) > err_goal && iteration <= maxit

        iteration = iteration + 1;

        x = (b_1 - y_1*y - z_1*z)/x_1;
        y = (b_2 - x_2*x - z_2*z)/y_2;
        z = (b_3 - x_3*x - y_3*y)/z_3;

        err_x = abs(x  - true_x);
        err_y = abs(y  - true_y);
        err_z = abs(z  - true_z);

        C = [err_x, err_y, err_z];

    end
    
    x_err001 = x; y_err001 = y; z_err001 = z; 
    iteration = 0; x = 0; y = 0; z = 0;
    err_goal = 0.0001;
    err_x = err_goal + 1; err_y = err_goal + 1; err_z = err_goal + 1;  
    C = err_goal + 1;
    

    while max(C) > err_goal && iteration <= maxit

        iteration = iteration + 1;

        x = (b_1 - y_1*y - z_1*z)/x_1;
        y = (b_2 - x_2*x - z_2*z)/y_2;
        z = (b_3 - x_3*x - y_3*y)/z_3;

        err_x = abs(x  - true_x);
        err_y = abs(y  - true_y);
        err_z = abs(z  - true_z);

        C = [err_x, err_y, err_z];

    end

    x_err0001 = x; y_err0001 = y; z_err0001 = z; 
    iteration = 0; x = 0; y = 0; z = 0;
    err_goal = 0.001;
    err_x = err_goal + 1; err_y = err_goal + 1; err_z = err_goal + 1;  
    C = err_goal + 1;
    
    disp("x, y, and z values, respectively:");

line_1 = ['----> error < 0.01  : ', num2str(x_err01), ...
', ', num2str(y_err01),', ', num2str(z_err01)];
     
line_2 = ['----> error < 0.001 : ', num2str(x_err001), ...
 ', ',num2str(y_err001),', ', num2str(z_err001)];
     
line_3 = ['----> error < 0.0001: ', num2str(x_err0001), ...
 ', ',num2str(y_err0001),', ', num2str(z_err0001)];

disp(" ");
disp(line_1);
disp(line_2);
disp(line_3);

break
end
    





    


