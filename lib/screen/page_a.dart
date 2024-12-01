import 'package:flutter/material.dart';
import 'package:state_management_with_stream/core/constant.dart';
import 'package:state_management_with_stream/core/bloc.dart';
import 'package:state_management_with_stream/main_bloc.dart';

class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    MainBloc bloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page A'),
      ),
       body: Center(
        child: Column(
          children: [
            const Text('Change Theme'),
            Switch(
              value: Constant.lightTheme,
              onChanged: (bool value) {
                setState(() {
                  Constant.lightTheme = value;
                });
                bloc.add(ToggleThemeEvent(isLight: value));
              },
            ),
          ],
        ),
      ),
    );
  }
}
