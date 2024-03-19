%builtins output

func main(output_ptr: felt*) -> (output_ptr: felt*) {
    let (m) = _main();
    m = [output_ptr];

    [ap] = output_ptr + 1, ap++;
    ret;
}

func _main() -> (m: felt) {
    [ap + 0] = 257, ap++;
    [ap + 0] = [ap + (-1)] * 257, ap++;
    [ap + 0] = [ap + (-1)] * 257, ap++;
    [ap + 0] = [ap + (-1)] * [ap + (-1)], ap++;
    [ap + 0] = [ap + (-1)] * [ap + (-2)], ap++;
    ret;
}
