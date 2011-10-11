
function waveletphase(d)
  assert(d>-0.55);
  assert(d<0.55);
  X=sinc((-5:20)+d);
  [X,K,L]=wavelet(sinc(-10+d:503+d));
  [B,A]=pade(L,7,7);  
  U=filter(B,[1;A],[1 zeros(1,256)]); # apply pade approximant
#  sound(U*5);
#  U=[U(1:end) zeros(1,6)]; # shift and pad with zeros
  V=L;
  shift=d+128-4;
  [X,X,W]=wavelet(H=sinc(-256+d:255+d));
  size(W)
  size(U) 
  plot([U;V;W_=[W(round(shift):256) zeros(1,round(shift))]]');
# U lacks some in the lowest frequencies
  pause;
#  W=-(((1:128))*d*0.1*pi);
#  W=127:-1:0;
#  W=(((W.*d)/128)-1).*pi;
  plot([angle(fft(U)(1:128));
	angle(fft(V)(1:128));
	angle(fft(W_)(1:128))]');
  