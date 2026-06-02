//June 2nd, 2026

<<< "Neo-Riemannian Transformations" >>>;

fun void fill_triad(int arr[], /*const*/ string chord_type) {
    if (arr.size() != 3) {
        <<< "fill_triad() error: array passed is not size 3" >>>;
    }

    0 => arr[0]; //Root
    7 => arr[2]; //Perfect 5th

    if (chord_type == "major") {
        4 => arr[1]; //major 3rd
    }
    else if (chord_type == "minor") {
        3 => arr[1]; //minor 3rd
    }
    else {
        <<< "fill_triad() error: string passed is not \"major\" or \"minor\"" >>>;
    }
}

fun void make_chord(int permutation) {

    TriOsc chord[3];
    0.6 => /*const*/ float volume;
    for (0 => int i; i < chord.size(); ++i) {
        chord[i] => dac;
        volume / chord.size() => chord[i].gain();
    }

    // 0 => int unison;
    // 3 => int minor_3rd;
    // 4 => int major_3rd;
    // 7 => int perfect_5th;

    110.0 => /*const*/ float starting_pitch;

    {
        int root;
    }

    if ((permutation % 2) == 0) {
        //Major
        int major_triad[3];
        fill_triad(major_triad, "major");

        starting_pitch * Math.exp2((permutation + unison) / 12.0)       => float note;
        starting_pitch * Math.exp2((permutation + major_3rd) / 12.0)    => float note;
        starting_pitch * Math.exp2((permutation + perfect_5th) / 12.0)  => float note;
    }
    else {
        //minor

    }
}

fun int main() {
    for (0 => int i; i < 3; ++i) {
        //do plr things
        //pitch(i)
        make_chord(i);
    }
    return 0;
}

main();
