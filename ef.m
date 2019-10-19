pkg load signal
%generate very efficient sawtooth wave
fs = 1/2; %width of the single teeth
t = -4:1/1000:4; %time
d = -4:2:4;   %offset
x = [0 1]; %function values
y = pulstran(t,d,x,fs); %result

plot(t,y)