import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModularListener<B extends BlocBase<S>, S> extends StatelessWidget {
  final void Function(BuildContext context, S state) listener;
  final BlocListenerCondition<S>? listenWhen;
  final Widget child;
  const ModularListener({
    super.key,
    required this.listener,
    this.listenWhen,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.tryGet<B>();
    return BlocListener<B, S>(
      bloc: bloc,
      listener: listener,
      listenWhen: listenWhen,
      child: child,
    );
  }
}
