import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  /*state.counterValue returns current state o the variable of counterValue*/
  void increment() => emit(CounterState(counterValue: state.counterValue + 1));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}