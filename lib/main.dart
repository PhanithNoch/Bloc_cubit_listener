import 'package:bloc_flutter_youtube/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: BlocListener<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.wasIncrememted == true) {
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Increment'),
                    duration: Duration(milliseconds: 2000)));
              }
              else{
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Decrement'),
                    duration: Duration(milliseconds: 500)));
              }
            },
            child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.counterValue.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 100),
                        FloatingActionButton(
                          onPressed: () {
                            context.bloc<CounterCubit>().increment();
                          },
                          tooltip: 'Increment',
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            // BlocProvider.of<CounterCubit>(context).decrement();
                            context.bloc<CounterCubit>().decrement();
                          },
                          tooltip: 'Increment',
                          child: Icon(Icons.remove),
                        ),
                      ],
                    )
                  ]);
            }),
          ),
        ));
  }
}
