import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/home/business_logic/cubits/counter_state.dart';
import 'package:flutter_bloc_concepts/home/business_logic/cubits/counter_cubit.dart';
import 'package:flutter_bloc_concepts/home/presentation/screens/second_screen.dart';

/**
 * @Author: Sanakhatun Shaikh
 * @Date: 9/28/2022
 */

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///
  /// BlocProvider:
  /// BlocProvider widget provides a bloc to its children (i.e Widgets).
  // BlocProvider is used as dependency injection (DI) widget
  // so that a single instance of a bloc can be provided to multiple widgets within a subtree.
  ///
  /// Key difference between BlocBuilder & BlocListener is
  /// BlocBuilder: This builder function may be called Multiple Times Per State(due to Flutter Engine)
  /// Re-builds the UI for every new state coming form the bloc
  ///
  ///
  /// BlocListener: This listener function is called only once per state(Not including the initial state)
  /// and The whole idea of BlocListener is - It is not responsible for building/updating the widget
  /// like BlocBuilder does.
  // It only listens to the state changes and performs some operation. The operation could be
  // (Navigating to other screens when state changes, Showing Snackbar on a particular state, etc).
  ///
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              //
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Increment button pressed")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Decrement button pressed")));
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      if (state.counterValue > 0) {
                        return Text(
                          'POSITIVE NUMBER: ${state.counterValue.toString()}',
                          style: Theme.of(context).textTheme.headline4,
                        );
                      } else {
                        return Text(
                          'NEGATIVE NUMBER: ${state.counterValue.toString()}',
                          style: Theme.of(context).textTheme.headline4,
                        );
                      }
                    },
                  );
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    /*BlocProvider: Creates & Provides the only instance of a bloc to the subtree*/
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: '+',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: '-',
                  child: const Icon(Icons.remove),
                ),
              ]),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            child: SecondScreen(title: "Second Screen"),
                            value: BlocProvider.of<CounterCubit>(context),
                          )));
                },
                child: Text(
                  "Go to Second Screen",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              )
            ],
          ),
        ));
  }
}
