fn main() {
    _main();
}

fn _main() -> felt252 {
    let x = 257;
    let y = x * x * x; // 16 974 593
    let z = y * y * y; // 4 891 005 035 897 482 905 857
    z
}
