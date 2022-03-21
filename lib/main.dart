import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/internet_cubit.dart';
import 'package:learn_bloc/cubit/setting_cubit.dart';
import 'package:learn_bloc/presentation/router/app_router.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(
      connectivity: Connectivity(),
    )),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<SettingCubit>(
          create: (context) => SettingCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
