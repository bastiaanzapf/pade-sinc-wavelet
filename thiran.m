function [B,A] = thiran(D,N)
%  [B,A] = thiran(D,N)
%  returns the order N Thiran allpass interpolation filter 
%  for delay D (samples).

A = zeros(1,N+1);
for k=0:N
    Ak = 1;
    for n=0:N
        Ak = Ak * (D-N+n)/(D-N+k+n);
    end
    A(k+1) = (-1)^k * nchoosek(N,k) * Ak;
end

B = A(N+1:-1:1);
