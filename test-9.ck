//June 1st, 2026

<<< "Actual (better?) music!" >>>;

//Gloabls
TriOsc g_s => dac;
0.0 => /*const*/ float g_off_volume;
0.6 => /*const*/ float g_on_volume;
60 => /*const*/ int g_tempo;
55.0 => /*const*/ float g_starting_pitch; //A1

//Returns corresponding note duration given bpm and note length
// 4 = quarter note, 2 = half, etc.
fun float get_note_length(/*const*/ float duration) {
    return ((60.0 / g_tempo)) / duration;
}

//Fills arr[] with TTET notes starting from starting_pitch
fun void fill_chromatic(float arr[], /*const*/ float starting_pitch) {
    for (0 => int i; i < arr.size(); ++i) {
        starting_pitch * Math.exp2(i / 12.0) => float note;
        note => arr[i];
    }
}

//Fills arr[] with the chromatic indexes for a major scale
fun void fill_major(int arr[], /*const*/ int starting_chromatic_index) {
    if (arr.size() != 7) {
        <<< "fill_major() error: passed array != 7" >>>;
    }

    1 => /*const*/ int minor_second;
    2 => /*const*/ int major_second;

    starting_chromatic_index      => arr[0]; //C
    major_second + arr[0] => arr[1]; //D
    major_second + arr[1] => arr[2]; //E
    minor_second + arr[2] => arr[3]; //F
    major_second + arr[3] => arr[4]; //G
    major_second + arr[4] => arr[5]; //A
    major_second + arr[5] => arr[6]; //B
}

fun void play_arpeggio(/*const*/ int arpeggio_root,
                       /*const*/ int major_scale[],
                       /*const*/ float chromatic_scale[]) {
    for (0 => int i; i < 3; ++i) {
        arpeggio_root + (i * 2) => /*const*/ int note;

        if (note <= 6) {
            g_on_volume => g_s.gain;
            chromatic_scale[major_scale[note]] => g_s.freq;
            get_note_length(4)::second => now;
        }
        else {
            g_on_volume => g_s.gain;
            chromatic_scale[major_scale[note % major_scale.size()] + 12] => g_s.freq;
            get_note_length(4)::second => now;
        }
    }
}

//Takes note length as a parameter
fun void rest(/*const*/ int duration) {
    g_off_volume => g_s.gain;
    get_note_length(duration)::second => now;
    g_on_volume => g_s.gain;
}

fun int main() {
    4 => /*const*/ int octave_count;
    (octave_count * 12) + 1 => /*const*/ int note_range; //+1 to bring scale to complete octave

    float chromatic_scale[note_range];
    fill_chromatic(chromatic_scale, g_starting_pitch);

    24 => /*const*/ int major_scale_tonic; //Holds a chromatic scale index
    if (major_scale_tonic + 24 >= chromatic_scale.size()) {
        <<< "Warning! major_scale's tonic cannot extend 2 octaves" >>>;
    }

    int major_scale[7];
    fill_major(major_scale, major_scale_tonic);

    for (0 => int i; i < 4; ++i) {
        <<< i >>>;
        Math.random2(0, 6) => int arpeggio_root;

        while((arpeggio_root % major_scale.size()) != 0) {
            play_arpeggio(arpeggio_root, major_scale, chromatic_scale);
            ((arpeggio_root + 3) % 7) => arpeggio_root; //Move chord root down a 4th
        }
        play_arpeggio(arpeggio_root, major_scale, chromatic_scale);
        rest(2);
    }
    return 0;
}

main();
