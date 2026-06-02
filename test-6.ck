//June 1st, 2026

<<< "Happy Birthday Song" >>>;

//Notes
220 => float tonic;
tonic * ( 1.0 / 1.0)    => float c;
tonic * ( 9.0 / 8.0)    => float d;
tonic * ( 5.0 / 4.0)    => float e;
tonic * ( 4.0 / 3.0)    => float f;
tonic * ( 3.0 / 2.0)    => float g;
tonic * ( 5.0 / 3.0)    => float a;
tonic * (16.0 / 9.0)    => float b_flat;
tonic * ( 2.0 / 1.0)    => float c2;

//Tempo
80 => float beats_per_minute;
(60.0 / beats_per_minute)::second   => dur beat;
beat / 4.0 => dur sixteenth_note;
beat / 2.0  => dur eigth_note;
beat        => dur quarter_note;
beat * 2.0  => dur half_note;

//Initialization stuff
TriOsc s => dac;
0.6 => float on_gain;
0.0 => float off_gain;
on_gain => s.gain;

//Happy
c => s.freq;
eigth_note => now;
eigth_note => now;

//Birth-
d => s.freq;
quarter_note => now;

//-day
c => s.freq;
quarter_note => now;

//To
f => s.freq;
quarter_note => now;

//You
e => s.freq;
half_note => now;

//Happy
c => s.freq;
eigth_note => now;
eigth_note => now;

//Birth-
d => s.freq;
quarter_note => now;

//-day
c => s.freq;
quarter_note => now;

//To
g => s.freq;
quarter_note => now;

//You
f => s.freq;
half_note => now;

//Happy
c => s.freq;
eigth_note => now;
eigth_note => now;

//Birth-
c2 => s.freq;
quarter_note => now;

//-day
a => s.freq;
quarter_note => now;

//Dear
f => s.freq;
quarter_note => now;

//User-
e => s.freq;
quarter_note => now;

//-name
d => s.freq;
quarter_note => now;

//Happy
b_flat => s.freq;
eigth_note => now;
eigth_note => now;

//Birth-
a => s.freq;
quarter_note => now;

//-day
f => s.freq;
quarter_note => now;

//To
g => s.freq;
quarter_note => now;

//You
f => s.freq;
half_note => now;
