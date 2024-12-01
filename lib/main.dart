import 'package:flutter/material.dart';
import 'package:state_management_with_stream/core/bloc.dart';
import 'package:state_management_with_stream/main_bloc.dart';
import 'screen/home/home.dart';

void main() {
  runApp(BlocProvider(bloc: MainBloc(), child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<MainBloc>(context),
      builder: (context, state) {
        ThemeData? themeData;
        if(state is ThemeState) themeData =  state.themeData;
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeData ?? ThemeData.light(),  // Sử dụng ThemeData từ ThemeBloc
          home: const MyHomePage(title: 'Demo App',),
        );
      },
    );
  }
}


