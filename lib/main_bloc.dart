// import 'package:bloc/bloc.dart';

// abstract class CounterEvent {}

// class CounterIncrementPressed extends CounterEvent {}

// class CounterDecrementPressed extends CounterEvent {}

// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0) {
//     on<CounterIncrementPressed>((event, emit) => emit(state + 1));
//     on<CounterDecrementPressed>((event, emit) => emit(state - 1));
//   }

//   // @override
//   // Stream<int> mapEventToState(CounterEvent event) async* {
//   //   switch (event) {
//   //     case CounterEvent.increment:
//   //       yield state + 1;
//   //       break;
//   //     case CounterEvent.decrement:
//   //       yield state - 1;
//   //       break;
//   //   }
//   //   throw UnimplementedError();
//   // }

// }

// void main(List<String> args) {
//   final bloc = CounterBloc();

//    print(bloc.state);
//   bloc.add(CounterIncrementPressed());
//   print(bloc.state);
//   // bloc.add(CounterEvent.increment);
//   // print(bloc.state);
//   // bloc.add(CounterEvent.increment);

//   // print(bloc.state);
//   // bloc.add(CounterEvent.decrement);
//   // print(bloc.state);
//   // bloc.add(CounterEvent.decrement);
//   // print(bloc.state);
//   // bloc.add(CounterEvent.decrement);

//   bloc.close();
// }
