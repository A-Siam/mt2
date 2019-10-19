positive_duration = 0.5;
%generate very efficient square wave
t = 0 : 0.01 : 1; %time
v = ones(length(t));
v(t-floor(t)>=positive_duration) = -1;
plot(t,v);