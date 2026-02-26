import 'package:flutter_modular/flutter_modular.dart';

import '../feature/todo/presentation/screens/screens.dart';

class TodoModule extends Module {
  @override
  void routes(r) {
    r.child('/create', child: (_) => const CreateTodoScreen());
    r.child('/edit', child: (_) => const EditTodoScreen());
    r.child('/detail', child: (_) => DetailTodoScreen(document: r.args.data));
    r.child('/list', child: (_) => const ListTodoScreen());
  }
}
