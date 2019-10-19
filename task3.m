  warning("off")
pkg load symbolic
% no need to enter an or bn because there alue 
function result = generate_sawtooth_no_for_loop(a0,T,time,n_ending)
  syms n
  result = 0.5*a0;
  result = result + (-a0/pi)*symsum((-1).^n.*(1/n).*sin(2*n*pi*time/(T/2)),1,n_ending);
  result = double(result);
endfunction

function result = generate_sawtooth_with_for_loop(a0,T,time,n_ending)
  result = 0.5*a0;
  for n = 1:n_ending
    result = result + (-a0/pi)*(-1).^n.*(1/n)*sin(2*n*time/(T/2));
  endfor
endfunction


x = -4:0.01:4;
r = generate_sawtooth_with_for_loop(1,2,x,50);
plot(x,r);