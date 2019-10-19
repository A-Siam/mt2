pkg load signal

function result = sq(A,t, period)
  result = square(2*pi.*t/period);
endfunction

function result = co(A,t, period)
  result = cos(2*pi.*t/period);
endfunction
fs = 1000;
t = -4:1/fs:4;
multi = sq(1,t,1) .* co(1,t,1);
%plot(t,multi);
N=length(multi);
x=-(-N/2:(N/2)-1)*(fs/N);
multi_ft=fft(multi);
multi_ft_abs= abs(multi_ft);
multi_ft_abs_shift = fftshift(multi_ft_abs/(N/2));
plot(x,multi_ft_abs_shift);
