import 'package:flutter/material.dart';

import 'bloc.dart';

class BlocBuilder<B extends BaseBloc> extends StatelessWidget {
  final Widget Function(BuildContext context, BaseState state) builder;
  final bool Function(BaseState olds, BaseState news)? buildWhen;
  final B bloc;

  const BlocBuilder({super.key, required this.builder, required this.bloc, this.buildWhen});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BaseState>(
      stream: bloc.stateStream,
      builder: (context, snapshot) {
        final olds = bloc.currentState;
        final news = snapshot.data ?? olds;
        if (buildWhen != null && news != null && olds != null) {
          if (!buildWhen!(olds, news)) {
            return builder(context, news);
          }
        }
        return builder(context, olds ?? InitialState());
      },
    );
  }
}