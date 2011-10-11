
function Y=reconstruct(A,B)
  Y=zeros(size(A,2)*2,1);
  if (size(A)!=[0 0])
    Y(1:2:end-1)=A(:);
    Y(2:2:end  )=A(:);
  else
    Y=zeros(size(B,2)*2,1);
  endif
#  plot(([A;B]')(6000:6200));die();
#plot(Y(10000:10500));die()
#size(B)
#size(Y(:))
#size(B(:))
  if (size(B)!=[0 0])
    Y(1:2:end-1)+=B(:);
    Y(2:2:end  )-=B(:);
  endif

#Y=Y'
