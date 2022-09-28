import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/home/business_logic/cubits/counter_state.dart';
import 'package:flutter_bloc_concepts/home/business_logic/cubits/counter_cubit.dart';
import 'package:flutter_bloc_concepts/home/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/home/presentation/screens/third_screen.dart';

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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                                child: ThirdScreen(title: "Third Screen"),
                                value: BlocProvider.of<CounterCubit>(context),
                              )));
                    },
                    child: Text(
                      "Go to Third Screen",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                                child: HomeScreen(title: "Home Screen"),
                                value: BlocProvider.of<CounterCubit>(context),
                              )));
                    },
                    child: Text(
                      "Back to Home Screen",
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
