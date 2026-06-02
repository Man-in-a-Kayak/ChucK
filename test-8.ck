//June 1st, 2026

<<< "Actual music!" >>>;

fun void fill_array(float arr[]) {
    for (0 => int i; i < arr.size(); ++i) {
        220.0 => float reference_note;

        reference_note 
        * Math.exp2(i / 12.0) 
        => float note;

        note => arr[i];
    }
}

fun float get_note_length(int bpm, float duration) {
    return ((60.0 / bpm)) / duration;
}

fun int main() {
    TriOsc s => dac;
    0.6 => s.gain;

    60 => int tempo;
    2 => int octave_count;

    (octave_count * 12) + 1 => int note_range;

    float chromatic_scale[note_range];
    fill_array(chromatic_scale);

    0 => int root;
    int major_scale[7];
    root + 0 => major_scale[0]; //C
    root + 2 => major_scale[1]; //D
    root + 4 => major_scale[2]; //E
    root + 5 => major_scale[3]; //F
    root + 7 => major_scale[4]; //G
    root + 9 => major_scale[5]; //A
    root + 11 => major_scale[6]; //B

    for (0 => int i; i < 100; ++i) {
        Math.random2(0, 6) => int arpeggio_root;
        <<< arpeggio_root >>>;

        while((arpeggio_root % major_scale.size()) != 0) {
            for (0 => int j; j < 3; ++j) {
                arpeggio_root + (j * 2) => int note;
                if (note <= 6) {
                    chromatic_scale[major_scale[note]] => s.freq;
                    get_note_length(tempo, 4)::second => now;
                }
                else {
                    chromatic_scale[major_scale[(note % major_scale.size())] + 12] => s.freq;
                    get_note_length(tempo, 4)::second => now;
                }
            }
            ((arpeggio_root + 3) % 7) => arpeggio_root;
        }
        <<< arpeggio_root >>>;

        for (0 => int j; j < 3; ++j) {
            arpeggio_root + (j * 2) => int note;
            if (note <= 6) {
                chromatic_scale[major_scale[note]] => s.freq;
                get_note_length(tempo, 4)::second => now;
            }
            else {
                <<< "Semantic error" >>>;
            }
        }
    }
    return 0;
}

main();

