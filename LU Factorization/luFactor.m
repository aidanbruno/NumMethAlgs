%% Created By Aidan Bruno 04/1/19
%
% [L,U,P] = luFactor(A)
%
% LU Decomposition with partial pivoting
%
% Input: 
%   A -- Coefficient Matrix
%
% Outputs:
%   L -- Lower Triangular Matrix
%   U -- Upper Triangular Matrix
%   P -- The Pivot Matrix
%
% When User inputs a sqaure matrix A, this function will decompose
% A into L and U matricies, that when multiplied by the calculated 
% P matrix, will return the user to the original A matrix




function[L,U,P]=luFactor(A)

b=length(A);    %Because A should be square, the length of A is equal to size(A)
L = eye(b);     %Creates an Identity Matrix to begin with
U = A;          % U must equal A, and then new values will replace the old
P = eye(b);     %P must begin as Identity Matrix, and then we will pivot

[y,y1] = size(A);       %Prevents an uneven matrix with incorrect dimensions
if y~=y1
    error('Matrix must be square!!!')
elseif y&&y1==1
    error('Please enter more rows and columns in your matrix')
end

for h = 1:b
    [Pivot_Values f] = max(abs(U(h:b,h)));   %Find Max abs value in all columns, and tracks which columns and rows it is switching (Row 1 and 3) 
    f = f+h-1;
    if f~=h
       pivot_p = P(h,:);    
       P(h,:) = P(f,:);
       P(f,:) = pivot_p;     %Pivot Rows in P
       
        pivot_u = U(h,:);
        U(h,:) = U(f,:);
        U(f,:) = pivot_u;    %Pivot Rows in U
       
        if h>=2
            pvt = L(h,1:h-1);
            L(h,1:h-1) = L(f,1:h-1);    %This pivots the L matrix if a pivot is 
            L(f,1:h-1) = pvt;               %needed in a column beyond the 1st
        end
    end
    for w = h+1:b          % For all values in respective places 1 through b
        L(w,h) = U(w,h)/U(h,h);        %Enters Values of L into Matrix in Correct Places
        U(w,:) = U(w,:)-L(w,h)*U(h,:); %Enters values of U into Matrix in Correct Places
          
    end
   
end

disp('Thank you for using this function, I hope you have a great day!')
    beep         % This algorithim was hard, gotta have some fun with it!
        

           
       
    
    
