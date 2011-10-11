
function comparemethods(d,order)

  n1=52;
  to=order;
  
  assert(d*2<=order+1);
  assert(d*2>=order-1);
  assert(mod(n1,4)==0);
  assert(mod(order,2)==0);

  wo=order/2;
  n2=n1/2;

  s=sinc((-n1/2-d):(n1/2-d));

  wd1=floor(d/2);
#  wd2=(d/2-wd1)
  x0=n1/2-wd1*2+3;
  x1=n1/2-wd1*2+wo*4+4;
#  x0
#  x1
  [X,L,H]=wavelet(s(x0:x1));
#  plot(X);die();
#  size(H)
#  plot(X);die();
#  U=H((n2/2-wo):(n2/2+wo));
#  V=L((n2/2-wo):(n2/2+wo));
#  plot([L;H]');die();

#  plot(H);die();
  Stim=[1 zeros(1,127)];
  [B,A]=pade(H,wo,wo);
  size(B)
#  B
#A
  H_=filter(B,[1;A],Stim);
  
B
[1;A]
#  plot(H_);die();

  L_=filter(L,[1],Stim); # no processing
#  plot(L_);die();
#  clf;
#  B
#  A
#  die();
#  clf;
#  hold on
#  plot([H_;L_]');
#  plot([H;L]'+2);
#  hold off
#  die()
#  [U,K,L]=wavelet(s);

  V1=reconstruct(L_,H_);
  V1=rot90(V1);

  td=d*2;
  z=0;
  while (td<to-0.5)
    td++;
    z++;
  endwhile
  printf("Thiran delay: %f+%i order: %i\n",td,z,to);
  [b,a]=thiran(td,to);

  V2=filter(b,a,[1 zeros(1,255)]);
#  plot(V2);die()
  
  # align results by zero padding

  pad=wo-1;
#  V1=[zeros(1,pad*2),V1(1:end-pad*2)];

#  plot(angle(fft(shift(V2,-to))));die();

  size(V1)
  size(V2)
#  plot([V2]');die();
#  V1=shift(V1,0);
#  V2=shift(V2,0);
  n1
  size(s(n1/2-order:end))  
  sh=-3;
  V2=shift(V2,sh);
  V3=sinc(-d-3:(255-d-3));
  size(V3)
  plot([V1;V2;V3]'(1:50,:));#die();
  pause;
  plot(log(abs(rot90([fft(V1);fft(V2);fft(V3)]))));
  pause;
  plot(angle(rot90([fft(V1);fft(V2);fft(V3)])));
  pause;
