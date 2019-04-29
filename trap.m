function I = trap(func,a,b,n,varargin)
% trap : composit trapazoidal Rule 
% Input : func = function entered
% a,b = integration limits
% n = number of segments
%
% output: I = integral estimate

if nargin<3,error('at least 3 input arguments required');
end
if ~(b>a),error('upper bound must be greater than the lower bound!!');
end
if nargin<4|isempty(n),n=100;end
x = a; h = (b-a)/n;
s = func(a,varargin{:});
for i = 1:n-1
    x = x+h;
    s = s+2*func(x,varargin{:});
end
s = s+func(b,varargin{:});
I = (b-a)*s/(2*n);
end
