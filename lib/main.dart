import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/home/business_logic/cubits/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/home/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/home/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/home/presentation/screens/third_screen.dart';

/*Reference: https://dhruvnakum.xyz/flutter-bloc-a-complete-guide*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          "/": (_) => BlocProvider.value(
                value: _counterCubit,
                child: HomeScreen(title: "Home Screen"),
              ),
          "/second": (_) => BlocProvider.value(
                value: _counterCubit,
                child: SecondScreen(title: "Second Screen"),
              ),
          "/third": (_) => BlocProvider.value(
                value: _counterCubit,
                child: ThirdScreen(title: "Third Screen"),
              )
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
