class CounterState {
  final int panjang;
  final int lebar;
  final int hasil;

  CounterState({
    required this.panjang,
    required this.lebar,
    required this.hasil,
  });

  CounterState copyWith({int? panjang, int? lebar, int? hasil}) {
    return CounterState(
      hasil: hasil ?? this.hasil,
      panjang: panjang ?? this.panjang,
      lebar: lebar ?? this.lebar,
    );
  }
}
