//June 1st, 2026

<<< "Random noises + functions + loops" >>>;

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

    4 => int octave_count;

    (octave_count * 12) + 1 => int note_range;

    float arr[note_range];
    fill_array(arr);

    120 => int tempo;

    for (0 => int i; i < 100; ++i) {
        arr[Math.random2(0, arr.size() - 1)] => s.freq;
        get_note_length(tempo, 8)::second => now;
    }

    return 0;
}

main();

