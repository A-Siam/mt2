  warning("off")
pkg load symbolic
% this function is  deprecated as it is too slow 
% --------------------DEPRECATED----------------------
%function result = generate_sawtooth_no_for_loop(a0,T,time,n_ending)
%  syms n
%  result = 0.5*a0;
%  result = result + (-a0/pi)*symsum((-1).^(n-1).*(1/n).*sin(2*n*pi*time/(T/2)),1,n_ending);
%  result = double(result);
%endfunction
%

% generate_sawtooth wave with amplutude of A using fourier series
% using the previously known parameters source: 
% no need to enter an or bn because there because there are already known
function result = generate_sawtooth(A,T,time,n_ending)
  result = 0.5;
  for n = 1:n_ending
    result = result - (-1/pi)*(-1).^(n-1).*(1/n)*sin(2*n*time/(T/2));
  endfor
  result = A* result
endfunction

% example:
x = -4:0.01:4;
r = generate_sawtooth(2,2,x,100);
plot(x,r);
