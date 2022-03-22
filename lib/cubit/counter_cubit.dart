import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(
        counterValue: state.counterValue + 1,
        wasIncremented: true,
      ));
  void decrement() => emit(CounterState(
        counterValue: state.counterValue - 1,
        wasIncremented: false,
      ));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    // throw UnimplementedError();
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    // TODO: implement toJson
    // throw UnimplementedError();
    return state.toMap();
  }

  @override
  void onChange(Change<CounterState> change) {
    // TODO: implement onChange
    print(change);
    super.onChange(change);
  }
}
