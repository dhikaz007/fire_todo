part of 'shared.dart';

class ModularConsumer<B extends BlocBase<S>, S> extends StatelessWidget {
  final void Function(BuildContext context, S state) listener;
  final Widget Function(BuildContext context, S state) builder;
  final BlocListenerCondition<S>? listenWhen;
  final BlocBuilderCondition<S>? buildWhen;
  const ModularConsumer({
    super.key,
    required this.listener,
    required this.builder,
    this.listenWhen,
    this.buildWhen,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<B>();
    return BlocConsumer<B, S>(
      bloc: bloc,
      listener: listener,
      builder: builder,
      listenWhen: listenWhen,
      buildWhen: buildWhen,
    );
  }
}
