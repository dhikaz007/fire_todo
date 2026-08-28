import 'package:bloc/bloc.dart';

import 'app_logger.dart';

/// Global BlocObserver that logs cubit/bloc lifecycle events.
class AppBlocObserver extends BlocObserver {
  final AppLogger _log = AppLogger();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _log.i('🟢 CREATE: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _log.i(
      '🔄 CHANGE: ${bloc.runtimeType}\n'
      '   currentState: ${change.currentState}\n'
      '   nextState:    ${change.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _log.e('🔴 ERROR: ${bloc.runtimeType}\n$error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _log.i('📡 EVENT: ${bloc.runtimeType} → $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _log.i(
      '🔀 TRANSITION: ${bloc.runtimeType}\n'
      '   event:      ${transition.event}\n'
      '   currentState: ${transition.currentState}\n'
      '   nextState:    ${transition.nextState}',
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _log.i('🔴 CLOSE: ${bloc.runtimeType}');
  }
}
