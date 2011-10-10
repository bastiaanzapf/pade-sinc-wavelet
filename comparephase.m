
function comparephase(d)
  assert(d>-0.55);
  assert(d<0.55);
  X=sinc((-5:20)+d);

  T=sinc(-5+d:250+d);
  [B,A]=pade(X,7,7);  
  [b,a]=thiran(5+d,5);
  U=shift(filter(B,[1;A],[1 zeros(1,255)]),-5);
  V=shift(filter(b,a,[1 zeros(1,255)]),-5);
  plot(fftshift([U;V;shift(T,-5)]',1)(100:180,:));
  pause;
#  W=-(((1:128))*d*0.1*pi);
  W=0:127;
  W=((W.*d)/128).*pi;
  plot([-angle(fft(U)(1:128));
	angle(fft(V)(1:128));
	-W]');