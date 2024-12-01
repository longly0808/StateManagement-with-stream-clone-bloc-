import 'package:flutter/material.dart';
import 'package:state_management_with_stream/core/bloc.dart';
import 'package:state_management_with_stream/main_bloc.dart';
import 'package:state_management_with_stream/screen/page_a.dart';
import 'package:state_management_with_stream/screen/home/sample_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  SampleBloc? bloc;
  late MainBloc mainBloc;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainBloc = BlocProvider.of<MainBloc>(context);
  }

  saveData(){
  }

  @override
  void initState() {
    bloc = SampleBloc();
    bloc?.stateStream.listen((emit) {
      if(emit is IncrementCounter){
        _counter = emit.count;
      }
      else if(emit is DecrementCounter){
        _counter = emit.count;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  void _goNewPage() {
   Navigator.push(context, MaterialPageRoute(builder: (context)=> const PageA()));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<SampleBloc>(
            bloc: bloc!,
            buildWhen: (olds, news) => news is IncrementCounter || news is DecrementCounter,
            builder: (context,state) {
              return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'push:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 16,),
                      Expanded(child: ElevatedButton(child: const Text('Increment'), onPressed: ()=> bloc?.add(IncrementCountNumberEvent(_counter)),)),
                      const SizedBox(width: 16,),
                      Expanded(child: ElevatedButton(child: const Text('Decrement'), onPressed: ()=>  bloc?.add(DecrementCountNumberEvent(_counter),))),
                      const SizedBox(width: 16,),
                    ],
                  )
                ],
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goNewPage,
        tooltip: 'Increment',
        child: const Icon(Icons.next_plan_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}