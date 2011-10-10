
function [Y,A,B]=wavelet(X,d=0)
  d_=d-round(d);
  D=round(d);

  order=10;
#  [a,b]=thiran(order-d_/2,order);

#H=[0.6830127, 1.1830127, 0.3169873, -0.1830127]/sqrt(2);
  H =[1 1].*(1/2);
  H_=fliplr(H).*((-1).^(1:2));

  A=filter(H ,[1],X)(1:2:end);
  B=filter(H_,[1],X)(1:2:end);

#  A=filter(b,a,A);
#  B=filter(b,a,B);
#  size([A;B])

#  clf
#  plot(rot90([A;B]));
#  hold on;
#  plot((1:0.5:((length(X)+1)/2)),X,'c1');
#  hold off;
#  die();
  Y=zeros(size(X)); # control
  Y(1:2:end)=A;
  Y(2:2:end)=A;
  Y(1:2:end)+=B;
  Y(2:2:end)-=B;
#  Y=shift(Y);
