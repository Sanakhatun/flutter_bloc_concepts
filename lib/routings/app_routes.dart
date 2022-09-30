import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/constants/routes.dart';
import 'package:flutter_bloc_concepts/features/home/business_logic/cubits/counter_cubit.dart';
import 'package:flutter_bloc_concepts/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/features/home/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/features/home/presentation/screens/third_screen.dart';

/**
 * @Author: Sanakhatun Shaikh
 * @Date: 9/28/2022
 */
class AppRoutes {
  final _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(
              title: "Home Screen",
            ),
          ),
        );
      case Routes.SECOND:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(
              title: "Second Screen",
            ),
          ),
        );
      case Routes.THIRD:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdScreen(
              title: "Third Screen",
            ),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
