
function [A,B]=pade(C,L,M)
  A=zeros(L,1);
  B=zeros(M,1);
  Cs = [];
  for i=1:M
    Cs = [Cs;C(L+i:-1:i)];
  endfor
  U=-Cs(:,1);
  V=Cs(:,2:end);
  B=V\U;
  for j=1:M
    A(j)=sum(C(j:-1:1).*[1;B(1:j-1)]');
  endfor
  
