import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/home/business_logic/cubits/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/home/presentation/screens/home_screen.dart';

/*Reference: https://dhruvnakum.xyz/flutter-bloc-a-complete-guide*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(title: 'Home Screen'),
      ),
    );
  }
}
