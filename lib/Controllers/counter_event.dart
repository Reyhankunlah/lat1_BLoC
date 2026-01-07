abstract class CounterEvent {}

class PanjangChanged extends CounterEvent {
  final int panjang;
  PanjangChanged(this.panjang);
}

class LebarChanged extends CounterEvent {
  final int lebar;
  LebarChanged(this.lebar);
}

class HitungKeliling extends CounterEvent {}

class HitungLuas extends CounterEvent {}

class Reset extends CounterEvent {}
