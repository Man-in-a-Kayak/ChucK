//June 1st, 2026

<<< "C Major Scale Just Intonation" >>>;

SinOsc s => dac;
0.6 => s.gain;

//A - (1/1)
(220 * 1) / 1 => s.freq;
0.5::second => now;

//B - (9/8)
(220 * 9) / 8 => s.freq;
0.5::second => now;

//C# - (5/4)
(220 * 5) / 4 => s.freq;
0.5::second => now;

//D - (4/3)
(220 * 4) / 3 => s.freq;
0.5::second => now;

//E - (3/2)
(220 * 3) / 2 => s.freq;
0.5::second => now;

//F# - (10 / 6)
(220 * 10) / 6 => s.freq;
0.5::second => now;

//G# - (15/8)
(220 * 15) / 8 => s.freq;
0.5::second => now;

//A - (2/1)
(220 * 2) / 1 => s.freq;
0.5::second => now;
