
function [AA,BB]=explorepade 
  AA=[];
  BB=[];
  for d=-0.5+pi/20:-0.1:-3.6
    X=sinc(d:2:50)-sinc(d-1:2:49);
    [A,B]=pade(X,6,6);

    Y=filter(A,[1;B],[1 zeros(1,size(X,2)-1)]);
#    plot([X;Y;filter(1,[1 -1],abs(X-Y))]');
#pause;
    [z,p,g]=tf2zp(A,[1;B]');
    z
    p
    zplane(z,p);
    pause;
    printf("d: %f\tRMS: %f\n",d,sum((X-Y).^2))
    AA=[AA,A];
    BB=[BB,B];
  endfor