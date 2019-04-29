function [x,fx,ea,iter] = goldmin(f,xl,xu,es,maxit,varargin)
% goldmin: minimization golden section search
%[x,fx,ea,iter] = goldmin(f,xl,xu,es,maxit) 
%       uses golden section search to find the minimumn
%Input:
% f = name of function
%   xl,xu = lower and upper guesses
%   es = desired relative error (default = .0001%)
%   maxit = maximum allowable iterations (default is 50)
%   p1,p2.... = additional parameters for func)
%output:
%   x = location of minimum
%   fx = function value at minimum
%   ea = approximate relative error (%)
%   iter = number of iterations

if nargin < 3
    error('At least 3 input arguments are required!!')
end
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 50;
end
phi = (1+sqrt(5))/2;
iter = 0;
d = (phi - 1)*(xu-xl);
x1=xl+d;
x2=xu-d;
f1 = f(x1,varargin{:});
f2 = f(x2,varargin{:});
while(1)
    xint = xu-xl;
    if f1<f2
        xopt = x1;
        xl = x2;
        x2=x1;
        f2=f1;
        x1=xl+(phi-1)*(xu-xl);
        f2=f(x2,varargin{:});
    else
        xopt = x2;
        xu=x1;
        x1=x2;
        f1=f2;
        x2=xu-(phi-1)*(xu-xl);
        f2=f(x2,varargin{:});
    end
    iter=iter+1;
    if xopt~=0
        ea = (2-phi)*abs(xint/xopt);
        if ea<=es || iter>=maxit
            break
        end
    end
end

        x = xopt;
        fx = f(xopt,varargin{:});
        disp(ea)
        