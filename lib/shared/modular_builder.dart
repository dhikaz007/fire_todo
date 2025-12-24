part of 'shared.dart';

class ModularBuilder<B extends BlocBase<S>, S> extends StatelessWidget {
  final BlocBuilderCondition<S>? buildWhen;
  final Widget Function(BuildContext context, S state) builder;
  const ModularBuilder({super.key, this.buildWhen, required this.builder});

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.tryGet<B>();
    return BlocBuilder<B, S>(
      bloc: bloc,
      buildWhen: buildWhen,
      builder: builder,
    );
  }
}
