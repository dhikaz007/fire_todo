import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModularSelector<B extends BlocBase<S>, S, T> extends StatelessWidget {
  final T Function(S state) selector;
  final Widget Function(BuildContext context, T selectedState) builder;
  const ModularSelector({
    super.key,
    required this.selector,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = inject<B>();
    return BlocSelector<B, S, T>(
      bloc: bloc,
      selector: selector,
      builder: builder,
    );
  }
}
