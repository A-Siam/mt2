pkg load signal
 
ft = 1000; % sampling frequency
duration = (-4:1/ft:4-1/ft); % signal duration

s_t= 5/2*(sawtooth(pi*duration,0)+1);
s =1+square(0.5*pi*duration);
wave2 = s_t .* s;

N = length(duration); % Number of samples

Fabs=abs(fft(wave2));
Fshift = fftshift(Fabs);

n = -[-N/2:N/2-1]*(ft/2);
 
plot(n,2*Fshift/N,'LineWidth',2);
grid on
