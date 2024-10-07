import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(const DetailState(0)) {
    on<CounterIncrementPressed>((event, emit) {
      emit(DetailState(state.count + 1));
    });
    on<CounterDecrementPressed>((event, emit) {
      if (state.count > 0) {
        emit(DetailState(state.count - 1));
      }
    });
  }
}
