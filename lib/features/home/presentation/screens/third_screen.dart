import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/features/home/business_logic/cubits/counter_state.dart';
import 'package:flutter_bloc_concepts/features/home/business_logic/cubits/counter_cubit.dart';
import 'package:flutter_bloc_concepts/features/home/presentation/screens/second_screen.dart';

/**
 * @Author: Sanakhatun Shaikh
 * @Date: 9/28/2022
 */

class ThirdScreen extends StatefulWidget {
  final String title;

  const ThirdScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body:
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Counter Value: ${state.counterValue}",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/second");
                    },
                    child: Text(
                      "Back to Second Screen",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  )
                ]),
          );
        }),
      ),
    );
  }
}
