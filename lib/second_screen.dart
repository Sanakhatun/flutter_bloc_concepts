import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/counter_cubit.dart';

/**
 * @Author: Sanakhatun Shaikh
 * @Date: 9/28/2022
 */

class SecondScreen extends StatefulWidget {
  final String title;

  const SecondScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
            return Text(
              "Counter Value: ${state.counterValue}",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1),
            );
          }),
        ),
      ),
    );
  }
}
