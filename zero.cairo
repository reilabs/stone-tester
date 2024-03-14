func _main() -> (m: felt) {
	[ap + 0] = 257, ap++;
	[ap + 0] = [ap + -1] * 257, ap++;
	[ap + 0] = [ap + -1] * 257, ap++;
	[ap + 0] = [ap + -1] * [ap + -1], ap++;
	[ap + 0] = [ap + -1] * [ap + -2], ap++;
    ret;
}

func main() {
    _main();
	ret;
}
