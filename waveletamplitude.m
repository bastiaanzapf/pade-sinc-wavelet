
function waveletamplitude(d)
  assert(d>-0.55);
  assert(d<0.55);
  X=sinc((-5:20)+d);
  [X,K,L]=wavelet(sinc(-10+d:503+d));
#  plot(L);die();
  [B,A]=pade(L,7,7);  
#  [b,a]=thiran(5+d,5);
  U=shift(filter(B,[1;A],[1 zeros(1,256)]),-5);
  V=shift(L,-5);
  plot([U;V]');
  pause;
#  W=-(((1:128))*d*0.1*pi);
  W=zeros(1,128);
#  W=((W.*d)/128).*pi;
  plot([log(abs(fft(U)(1:128)));
	log(abs(fft(V)(1:128)));
	-W]');
