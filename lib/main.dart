import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/home/business_logic/cubits/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/home/business_logic/cubits/internet_cubit.dart';
import 'package:flutter_bloc_concepts/routings/app_routes.dart';

/*Reference: https://dhruvnakum.xyz/flutter-bloc-a-complete-guide*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final AppRoutes _appRoutes = AppRoutes();
  final Connectivity _connectivity = Connectivity();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<InternetCubit>(
          create: (context) =>
              InternetCubit(connectivity: widget._connectivity),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: widget._appRoutes.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
