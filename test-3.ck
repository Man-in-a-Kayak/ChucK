//June 1st, 2026

<<< "Different Sound Waves + variables" >>>;

TriOsc s => dac;
0.6 => s.gain;

220 => int tonic;

//A - (1/1)
(tonic * 1) / 1 => s.freq;
0.5::second => now;

//B - (9/8)
(tonic * 9) / 8 => s.freq;
0.5::second => now;

//C# - (5/4)
(tonic * 5) / 4 => s.freq;
0.5::second => now;

//D - (4/3)
(tonic * 4) / 3 => s.freq;
0.5::second => now;

//E - (3/2)
(tonic * 3) / 2 => s.freq;
0.5::second => now;

//F# - (10 / 6)
(tonic * 10) / 6 => s.freq;
0.5::second => now;

//G# - (15/8)
(tonic * 15) / 8 => s.freq;
0.5::second => now;

//A - (2/1)
(tonic * 2) / 1 => s.freq;
0.5::second => now;
