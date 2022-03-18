import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:learn_bloc/constant/enum.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/internet_cubit.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text('Wifi');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return Text('Mobile');
                } else {
                  return Text('Disconnect');
                }
              },
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Incremendted!'),
                    duration: Duration(milliseconds: 100),
                  ));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 100),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, Negative ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YaaaY ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'Hmmm, Number ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            Builder(
              builder: (context) {
                final internetState = context.watch<InternetCubit>().state;
                final counterState = context.watch<CounterCubit>().state;

                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.wifi) {
                  return Text(
                    'Counter: ${counterState.counterValue} & Internet: Wifi',
                  );
                } else if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.mobile) {
                  return Text(
                    'Counter: ${counterState.counterValue} & Internet: Mobile',
                  );
                }
                return Text('Counter: ${counterState.counterValue}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
