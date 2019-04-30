%% Simpsons 1/3 Rule Matlab Algorithim
% Created by Aidan Bruno
% Created on 04-16-19


function I = Simpson(x,y)
% This function numerically evaluates the integral of the vector 
% of function values ?y? with respect to ?x?
%
% Inputs:
% x - independent variable
% y - dependent variable
%
% Outputs: 
% I - Value of the integral

l = length(y);
k = length(x);

if l~=k             % Checks to see if Inputs are equal in length
    error('Inputs must have the same length!')  
end
I = 0;
a = x(1);
b = x(k);  %This checks to see if x values are spaced right
n = k-1;
h = (b-a)/n;
w = linspace(a,b,length(x));
spacing = isequal(x,w);

if spacing == 0  %This checks to see if x values are spaced right
    error('Make sure your x values are equally spaced')
end

interval_val = k-1;
int_ev_odd = rem(interval_val,2);       %Checks to see if even intervals

if int_ev_odd ~= 0
    disp('ALERT: The trapazoidal rule must be used for the last interval')
    I = (x(k)-x(k-1))*(y(k)+y(k-1))/2;
    k = k-1;        % This is trapazoidal Rule on last interval when it is needed
end

I = I + (h/3)*(y(1)+y(k));  %These are the end values for 1/3 Rule
O = 2;
P = 3;

while P<=k-2
    I = I +((2*h/3)*y(P));  % Even Values for 1/3 Rule
    P=P+2;
end

while  O<=k-1
    I = I+((4*h/3)*y(O));   % Odd Values for 1/3 Rule
    O = O+2;
end


        
    
    
    

