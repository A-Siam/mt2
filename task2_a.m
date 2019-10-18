pkg load symbolic % import symbolic package in octave remove this line if you are using matlab
function result = energy (signal,var,start,ending)
  pkg load symbolic
  result = double(int(abs(signal)^2,var,start,ending));
endfunction

syms t

x = [1,1]; %unit step function
y = [1,-1]; %square function

energyX = energy(x(1,1),t,0,1)+energy(x(1,2),t,1,2); % get the energy of unit step function from 0 to 2
energyY = energy(y(1,1),t,0,1) + energy(y(1,2),t,1,2); % get the energy of square function from 0 to 2

energyXPlusY = energy(x(1,1)+y(1,1),t,0,1) + energy(x(1,2)+y(1,2),t,1,2);
energyXMinusY = energy(x(1,1)-y(1,1),t,0,1) + energy(x(1,2)-y(1,2),t,1,2);

if (energyXPlusY == energyXMinusY)
  printf("E(x+y) equals E(x-y)\n")
endif

 