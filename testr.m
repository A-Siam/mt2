pkg load symbolic
warning("off")
function result = fos(a0,an,bn,T,t)
  an_terms = 0;
  for  n = 1:length(an)
    an_terms = an_terms + an(n) * cos(pi*n*t/T);
  endfor
  bn_terms = 0;
  for n = 1:length(bn)
    bn_terms = bn_terms + bn(n) .* sin(pi*n*t/T);
  endfor
  result =double( a0/2 + an_terms + bn_terms);
endfunction

syms t
A=1;
T=4;
w=2*pi/T;
n=1:10;
a0=(1/T)*int(1,t,0,2);
an=(2/T)*int(cos(n*w*t),t,0,2);
bn=(2/T)*int(sin(n*w*t),t,0,2);
time = -2 :0.1:1.9;
re = fos(a0,an,bn,T,time);

plot(time,re);
