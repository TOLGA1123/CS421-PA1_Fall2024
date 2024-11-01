% 4th octave
%    C	    C#	    D	    Eb	    E	    F	    F#	    G	    G#	    A	    Bb	    B
% 	261.6	277.2	293.7	311.1	329.6	349.2	370.0	392.0	415.3	440.0	466.2	493.9
fs = 8000;  %sampling frequency
amplitude = 1;  %amplitude
phase = 0;      %phase
t = 0:1/fs:1-1/fs; %time vector 1 second    start = 0, 1/fs - 1-1/fs
frequencies = [277, 330, 415];  %last digit = 1 --> C# E G#
%Generate Sinusoidals   matlab arrays --> 1-indexed
C_sharp = amplitude * cos(2 * pi * frequencies(1) * t + phase);
E = amplitude * cos(2 * pi * frequencies(2) * t + phase);
G_sharp = amplitude * cos(2 * pi * frequencies(3) * t + phase);

%sound individual notes + Chord
sound(C_sharp, fs);
pause(3);

sound(E, fs);
pause(3);

sound(G_sharp, fs);
pause(3);

Chord = C_sharp + E + G_sharp;
Original_Chord = C_sharp + E + G_sharp;     %stored for later use since harmonics will be added to Chord
sound(Chord, fs);
pause(3);

%Plot individual notes + Chord
figure;     %open different window
subplot(4,1,1);         %4 row 1 column, index = 1 etc.
plot(t(1:500), C_sharp(1:500));
title('C# Note (277 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(t(1:500), E(1:500));
title('E Note (330 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t(1:500), G_sharp(1:500));
title('G# Note (415 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
plot(t(1:500), Chord(1:500));
title('C#m (Chord) (C# + E + G#)');
xlabel('Time (s)');
ylabel('Amplitude');

%amplitudes A1 = 0 -> 1, A2 = 6, A3 = 1
%phases p1 = 030 --> 30, p2 = 306, p3 = 061 --> 61
A1 = 1; A2 = 6; A3 = 1;
p1 = 30 * pi / 180;
p2 = 306 * pi / 180;
p3 = 61 * pi / 180;
C_sharp_v2 = A1 * cos(2 * pi * frequencies(1) * t + p1);
E_v2 = A2 * cos(2 * pi * frequencies(2) * t + p2);
G_sharp_v2 = A3 * cos(2 * pi * frequencies(3) * t + p3);
Chord_v2 = C_sharp_v2 + E_v2 + G_sharp_v2;
sound(Chord_v2, fs);
pause(3);

figure;     %open different window
subplot(4,1,1);         %4 row 1 column, index = 1 etc.
plot(t(1:500), C_sharp_v2(1:500));
title('C# Note (277 Hz) version 2');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(t(1:500), E_v2(1:500));
title('E Note (330 Hz) version 2');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t(1:500), G_sharp_v2(1:500));
title('G# Note (415 Hz) version 2');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
plot(t(1:500), Chord_v2(1:500));
title('C#m (Chord) (C#_v2 + E_v2 + G#_v2) version 2');
xlabel('Time (s)');
ylabel('Amplitude');

%part 3
amplitudes = [9, 6, 3];
%second harmonics
C_sharp_h2 = amplitudes(1) * cos(2 * pi *  2 * frequencies(1) * t + phase);
E_h2 = amplitudes(1) * cos(2 * pi * 2 * frequencies(2) * t + phase);
G_sharp_h2 = amplitudes(1) * cos(2 * pi * 2 * frequencies(3) * t + phase);
%third harmonics
C_sharp_h3 = amplitudes(2) * cos(2 * pi * 3 * frequencies(1) * t + phase);
E_h3 = amplitudes(2) * cos(2 * pi * 3 * frequencies(2) * t + phase);
G_sharp_h3 = amplitudes(2) * cos(2 * pi * 3 * frequencies(3) * t + phase);
%fourth harmonics
C_sharp_h4 = amplitudes(3) * cos(2 * pi * 4 * frequencies(1) * t + phase);
E_h4 = amplitudes(3) * cos(2 * pi * 4 * frequencies(2) * t + phase);
G_sharp_h4 = amplitudes(3) * cos(2 * pi * 4 * frequencies(3) * t + phase);
%diminishing weights --> higher harmonics have lower amplitudes
Chord = Chord + C_sharp_h2 + E_h2 + G_sharp_h2;
Chord = Chord + C_sharp_h3 + E_h3 + G_sharp_h3;
Chord = Chord + C_sharp_h4 + E_h4 + G_sharp_h4;
sound(Chord, fs);
pause(3);

%plot the harmonics and the resulting signal
figure;
% 5 row 2 col. --> 10 plot
%C# harmonics
subplot(5, 2, 1);
plot(t(1:200), C_sharp_h2(1:200));
title('C# Second Harmonic');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 2, 3);
plot(t(1:200), C_sharp_h3(1:200));
title('C# Third Harmonic');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 2, 5);
plot(t(1:200), C_sharp_h4(1:200));
title('C# Fourth Harmonic');
xlabel('Time (s)');
ylabel('Amplitude');

%E harmonics
subplot(5, 2, 2);
plot(t(1:200), E_h2(1:200));
title('E Second Harmonic');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 2, 4);
plot(t(1:200), E_h3(1:200));
title('E Third Harmonic');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 2, 6);
plot(t(1:200), E_h4(1:200));
title('E Fourth Harmonic');
xlabel('Time (s)');
ylabel('Amplitude');

%G# harmonics
subplot(5, 2, 7);
plot(t(1:200), G_sharp_h2(1:200));
title('G# Second Harmonic');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 2, 8);
plot(t(1:200), G_sharp_h3(1:200));
title('G# Third Harmonic');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 2, 9);
plot(t(1:200), G_sharp_h4(1:200));
title('G# Fourth Harmonic');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the resulting chord signal with harmonics
subplot(5, 2, 10); 
plot(t(1:200), Chord(1:200));
title('Resulting Chord Signal with Harmonics');
xlabel('Time (s)');
ylabel('Amplitude');

%Fourier Transform
Fourier = fft(Chord);
% Compute the Fourier Transform of the chord signal with harmonics
Magnitudes = abs(Fourier);
freq = (0:length(Fourier)-1)*fs/length(Fourier);    %frequency domain

% Plot the magnitude spectrum
%277 330 415 554 660 830 990 1108 1245 1320 1660
%symmetric 0-fs/2 and fs/2-fs       0-4000 and 4000-8000
figure;
subplot(1,1,1);
plot(freq, Magnitudes);
title('Frequency Spectrum with Harmonics');
xlabel('Frequency (Hz)');
ylabel('Magnitude');


%part 5
%highest freq in the original chord = 415, Nyquist rate = 830
fs2 = 500;
t2 = 0:1/fs2:1-1/fs2;       %use t2 to create notes and respective harmonics
C_sharp = amplitude * cos(2 * pi * frequencies(1) * t2 + phase);
E = amplitude * cos(2 * pi * frequencies(2) * t2 + phase);
G_sharp = amplitude * cos(2 * pi * frequencies(3) * t2 + phase);
Chord_aliased = C_sharp + E + G_sharp;
%new harmonics with t2
%second harmonics
C_sharp_h2_2 = amplitudes(1) * cos(2 * pi *  2 * frequencies(1) * t2 + phase);
E_h2_2 = amplitudes(1) * cos(2 * pi * 2 * frequencies(2) * t2 + phase);
G_sharp_h2_2 = amplitudes(1) * cos(2 * pi * 2 * frequencies(3) * t2 + phase);
%third harmonics
C_sharp_h3_2 = amplitudes(2) * cos(2 * pi * 3 * frequencies(1) * t2 + phase);
E_h3_2 = amplitudes(2) * cos(2 * pi * 3 * frequencies(2) * t2 + phase);
G_sharp_h3_2 = amplitudes(2) * cos(2 * pi * 3 * frequencies(3) * t2 + phase);
%fourth harmonics
C_sharp_h4_2 = amplitudes(3) * cos(2 * pi * 4 * frequencies(1) * t2 + phase);
E_h4_2 = amplitudes(3) * cos(2 * pi * 4 * frequencies(2) * t2 + phase);
G_sharp_h4_2 = amplitudes(3) * cos(2 * pi * 4 * frequencies(3) * t2 + phase);

sound(Chord_aliased, fs);       %wont play since aliasing
%interp1 for upsampling and sound again
Upsampled_Chord = interp1(t2, Chord_aliased, t, "linear");      %default method is linear
sound(Original_Chord, fs);  %nonaliased chord
pause(3);
sound(Upsampled_Chord, fs); %aliased chord
pause(3);
%add new harmonics and sound again
Chord_aliased = Chord_aliased + C_sharp_h2_2 + E_h2_2 + G_sharp_h2_2;
Chord_aliased = Chord_aliased + C_sharp_h3_2 + E_h3_2 + G_sharp_h3_2;
Chord_aliased = Chord_aliased + C_sharp_h4_2 + E_h4_2 + G_sharp_h4_2;
Upsampled_Chord = interp1(t2, Chord_aliased, t, "linear");
sound(Chord, fs);       %original harmonics
pause(3);
sound(Upsampled_Chord, fs);     %upsampled aliased harmonics
pause(3);
%Plot the chords frequency spectrum using the “fft” function. Also plot the
%??????????????????????????????
%frequency spectrum of the chord with the harmonics added.
Chord_aliased_original = C_sharp + E + G_sharp;
Upsampled_Chord_original = interp1(t2, Chord_aliased_original, t, "linear");      %default method is linear
Fourier_original = fft(Original_Chord);      Fourier_aliased = fft(Chord_aliased_original);
Fourier_harmonics = fft(Chord);              Fourier_harmonics_aliased = fft(Chord_aliased);

Magnitudes_original = abs(Fourier_original);
Magnitudes_aliased = abs(Fourier_aliased);
Magnitudes_harmonics = abs(Fourier_harmonics);
Magnitudes_harmonics_aliased = abs(Fourier_harmonics_aliased);

freq1 = (0:length(Fourier_original)-1)*fs/length(Fourier_original);
freq2 = (0:length(Fourier_aliased)-1)*fs/length(Fourier_aliased);
freq3 = (0:length(Fourier_harmonics)-1)*fs/length(Fourier_harmonics);
freq4 = (0:length(Fourier_harmonics_aliased)-1)*fs/length(Fourier_harmonics_aliased);

figure;
subplot(4, 1, 1);
plot(freq1, Magnitudes_original);
title('Frequency Spectrum of Original Chord');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(4, 1, 2);
plot(freq2, Magnitudes_aliased);
title('Frequency Spectrum of Aliased Chord');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(4, 1, 3);
plot(freq3, Magnitudes_harmonics);
title('Frequency Spectrum of Chord with Harmonics');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(4, 1, 4);
plot(freq4, Magnitudes_harmonics_aliased);
title('Frequency Spectrum of Aliased Chord with Harmonics');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
