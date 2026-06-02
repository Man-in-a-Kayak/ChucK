//June 2nd, 2026

<<< "Neo-Riemannian Transformations" >>>;

fun int minor_3rd()   { return 3; }
fun int major_3rd()   { return 4; }
fun int perfect_5th() { return 7; }

fun void create_chord(TriOsc chord[]) {
    0.6 => /*const*/ float volume;

    for (0 => int i; i < chord.size(); ++i) {
        chord[i] => dac;
        volume / chord.size() => chord[1].gain;
    }
}

//Returns roots, increasing by alternating thirds
fun int get_root(/*const*/ int i) {
    (i / 2) * 7 => /*const*/ int num;

    if (i % 2) {
        return num + 4; // + major third
    }
    else {
        return num;     // + minor third
    }
}

fun void play(/*const*/ int permutation) {
    TriOsc chord[3];
    create_chord(chord);

    57 => /*const*/ int starting_midi;
    get_root(permutation) % 12 => /*const*/ int root;

    Std.mtof(starting_midi + root) => chord[0].freq;
    Std.mtof(starting_midi + ((root + perfect_5th()) % 12)) => chord[2].freq;

    if (permutation % 2) {
        Std.mtof(starting_midi + ((root + minor_3rd()) % 12)) => chord[1].freq;
    }
    else {
        Std.mtof(starting_midi + ((root + major_3rd()) % 12)) => chord[1].freq;
    }
    1::second => now;
}

fun int main() {
    for (0 => int i; i < 100; ++i) {
        play(i);
    }
    return 0;
}

main();
