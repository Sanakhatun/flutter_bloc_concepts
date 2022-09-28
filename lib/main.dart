import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///
  /// Key difference between BlocBuilder & BlocListener is
  /// BlocBuilder: This builder function may be called Multiple Times Per State(due to Flutter Engine)
  /// BlocListener: This listener function is called only once per state(Not including the initial state)
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.wasIncremented == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Increment button pressed")));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Decrement button pressed")));
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                //BlocBuilder:Re-builds the UI for every new state coming form the bloc
                BlocBuilder<CounterCubit, CounterState>(
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
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          /*BlocProvider: Creates & Provides the only instance of a bloc to the subtree*/
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        tooltip: '+',
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).decrement();
                        },
                        tooltip: '-',
                        child: const Icon(Icons.remove),
                      ),
                    ]),
              ],
            ),
          )),
    );
  }
}
