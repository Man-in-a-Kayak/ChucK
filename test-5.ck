//June 1st, 2026

<<< "Printing note frequencies" >>>;

TriOsc s => dac;
0.6 => s.gain;

220 => float tonic;
tonic => float temp_frequency;

//A - (1/1)
tonic => temp_frequency;
1 *=> temp_frequency;
1 /=> temp_frequency;
temp_frequency => s.freq;
<<< temp_frequency >>>;
0.5::second => now;


//B - (9/8)
tonic => temp_frequency;
9 *=> temp_frequency;
8 /=> temp_frequency;
temp_frequency => s.freq;
<<< temp_frequency >>>;
0.5::second => now;

//C# - (5/4)
tonic => temp_frequency;
5 *=> temp_frequency;
4 /=> temp_frequency;
temp_frequency => s.freq;
<<< temp_frequency >>>;
0.5::second => now;

//D - (4/3)
tonic => temp_frequency;
4 *=> temp_frequency;
3 /=> temp_frequency;
temp_frequency => s.freq;
<<< temp_frequency >>>;
0.5::second => now;

//E - (3/2)
tonic => temp_frequency;
3 *=> temp_frequency;
2 /=> temp_frequency;
temp_frequency => s.freq;
<<< temp_frequency >>>;
0.5::second => now;

//F# - (10 / 6)
tonic => temp_frequency;
10 *=> temp_frequency;
6 /=> temp_frequency;
temp_frequency => s.freq;
<<< temp_frequency >>>;
0.5::second => now;

//G# - (15/8)
tonic => temp_frequency;
15 *=> temp_frequency;
8 /=> temp_frequency;
temp_frequency => s.freq;
<<< temp_frequency >>>;
0.5::second => now;

//A - (2/1)
tonic => temp_frequency;
2 *=> temp_frequency;
1 /=> temp_frequency;
temp_frequency => s.freq;
<<< temp_frequency >>>;
0.5::second => now;
