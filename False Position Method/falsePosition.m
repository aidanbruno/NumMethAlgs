%%  False Position Algorithm
% Created by: Aidan Bruno
% Created on: 3/02/19
% Professor: Dr. Bechara

function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%This function calculates the root of a function using the false position
%method
%Input;
% func = the function being evaluated
%xl,xu = lower and upper guesses
%es = approximate relative error (default = .0001%)
%maxiter = maximum allowable iterations (default is 200)

%output:
%root = real root
%fx = function value at root
%ea = approximate relative error (%)
%iter = number of iterations
iter = 0;   %Starting from 0 and counting up
ea = 100;   %So I can multiply by 100 to get result
xR = xl;  
if nargin<3
    error('Please input more than 3 arguments!!')
end
if  isempty(es)    %Checks to see if there is no desired error, default to .0001%
    es = .0001;
end
if isempty(maxiter)||maxiter<3  %Checks if there are specified iteration #, or defalut to 200
    maxiter = 200;
end
while ea>es || iter<maxiter
    lastxR = xR;
    xR = xu-((func(xu).*(xl-xu))/(func(xl)-func(xu)));     %Use false position formula
    iter = iter+1;
    if xR >0 || xR < 0
        ea = abs((xR - lastxR)/xR)*100; %Realative Error
        IncCheck = func(xl)*func(xR);  %Checks to see if there is a sign change on new intervals
        if IncCheck>0
            xl=xR;
        elseif IncCheck<0       %This if statement decides which interval to change with xR
            xu=xR;
        else
            ea=0;
        end
        if iter>=maxiter||ea<=es      %If iterations is above maxiter or 
            break                     %Relative error is below desired, end while loop
        end
    end
end
x = xR;                         
fx = feval(func,x);             %This gets values in correct places to be shown to user
root = xR;

    
    fprintf('Root : %7.5f\n',root)
    fprintf('Fx at root : %7.5f\n',fx)
    fprintf('Approximate Relative Error : %7.5f\n',ea)
    fprintf('Amount of iterations Completed : %7.5f\n',iter)   
end


