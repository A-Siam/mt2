pkg load symbolic % import symbolic package in octave remove this line if you are using matlab
% finding energy function 
% @parameters:
% signal: the input signal
% start: where to start integration
% ending: where to end
warning("off");
function result = energy (signal,start,ending)
  syms t
  pkg load symbolic
  result = double(int(abs(signal)^2,t,start,ending));
endfunction
%
% print if enegy(signal1+signal2) = enegy(signal1-signal2)
% @parameters:
% x: array of the values of the first signal
% y: array of the values of the second signal
% starting: where these two signals start
% ending: where these two signals end
% time: the time it takes to finish each value of signals
% Normally i will make it return a special value but for the sake of
% simplicity i will let it take an action inside my function
function solveIfEnegyOfXPlusYEqualsEnergyOfXMinusY(x,y,starting,ending,time)
energyXMinusY = 0;
energyXPlusY = 0;

for i = [starting:time:ending-time]
energyXPlusY = energyXPlusY + energy(x(1,int32((i+time)/(time)))+ %row 1 column : ration between time and N*time where N is the index of our desired value same applies to y and minus below
                                        y(1,int32((i+time)/(time))),
                                        i,
                                        (i+time)/(time));
endfor

for i = [0:time:ending-time]
energyXMinusY = energyXMinusY + energy(x(1,
                                          int32((i+time)/(time)))-
                                          y(1,int32((i+time)/(time))),
                                          i,
                                          (i+time)/(time));
endfor
% set a plausible threshold of difference
if (abs(energyXPlusY - energyXMinusY) < 1e-6)
  printf("Energy(x+y) equals Energy(x-y)\n") 
else
    printf("Energy(x+y) is not equal to Energy(x-y)\n")
end
endfunction

printf("for signals (b):\n");
x = [1,1,-1,-1]; %unit step function
y = [1,-1,1,-1]; %square function
 
solveIfEnegyOfXPlusYEqualsEnergyOfXMinusY(x,y,0,2*pi,pi/2);

printf("for signals (c):\n");
x = [1,-1,-1,-1]; %unit step function
y = [1,1,1,1]; %square function
 
solveIfEnegyOfXPlusYEqualsEnergyOfXMinusY(x,y,0,pi,pi/4);