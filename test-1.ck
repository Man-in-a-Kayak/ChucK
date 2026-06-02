//June 1st, 2026

<<< "C Major Scale TTET" >>>;

SinOsc s => dac;
0.6 => s.gain;

//A
220.0 => s.freq;
0.5::second => now;

//B
246.9 => s.freq;
0.5::second => now;

//C#
277.2 => s.freq;
0.5::second => now;

//D
293.7 => s.freq;
0.5::second => now;

//E
329.6 => s.freq;
0.5::second => now;

//F#
370.0 => s.freq;
0.5::second => now;

//G#
415.30 => s.freq;
0.5::second => now;

//C
440.0 => s.freq;
0.5::second => now;
