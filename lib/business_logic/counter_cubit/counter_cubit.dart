import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of<CounterCubit>(context);

  int counter = 0;

  void incrementCounter() {
    counter++;
    emit(IncreaseCounterState());
  }

  void decrementCounter() {
    counter--;
    emit(DecreaseCounterState());
  }
}