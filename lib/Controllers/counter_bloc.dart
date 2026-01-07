import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(panjang: 0, lebar: 0, hasil: 0)) {
    on<PanjangChanged>((event, emit) {
      emit(state.copyWith(panjang: event.panjang));
    });

    on<LebarChanged>((event, emit) {
      emit(state.copyWith(lebar: event.lebar));
    });

    on<HitungKeliling>((event, emit) {
      final keliling = 2 * (state.panjang + state.lebar);
      emit(state.copyWith(hasil: keliling));
    });

    on<HitungLuas>((event, emit) {
      final luas = state.panjang * state.lebar;
      emit(state.copyWith(hasil: luas));
    });

    on<Reset>((event, emit) {
      emit(CounterState(panjang: 0, lebar: 0, hasil: 0));
    });
  }
}
