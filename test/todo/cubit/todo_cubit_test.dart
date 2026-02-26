import 'package:bloc_test/bloc_test.dart';
import 'package:fire_todo/feature/todo/domain/models/models.dart';
import 'package:fire_todo/feature/todo/domain/repositories/i_todo_repository.dart';
import 'package:fire_todo/feature/todo/presentation/cubit/todo_cubit.dart';
import 'package:fire_todo/shared/local_db/domain/i_hive_repository.dart';
import 'package:fire_todo/shared/models/models.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

enum CallType { success, failed }

class MockTodoCubit extends MockCubit<TodoState> implements TodoCubit {}

class MockTodoState extends Mock implements TodoState {}

class MockTodoRepository extends Mock implements ITodoRepository {}

class MockHiveRepository extends Mock implements IHiveRepository {}

class TestModule extends Module {
  final TodoCubit todoCubit;
  final ITodoRepository todoRepository;
  final IHiveRepository hiveRepository;

  TestModule({
    required this.todoCubit,
    required this.todoRepository,
    required this.hiveRepository,
  });

  @override
  void binds(Injector i) {
    i.addInstance(todoCubit);
    i.addInstance(todoRepository);
    i.addInstance(hiveRepository);
  }
}

void main() {
  late TodoCubit mockTodoCubit;
  late MockTodoRepository mockTodoRepository;
  late MockHiveRepository mockHiveRepository;

  setUpAll(() {
    registerFallbackValue(MockTodoState());
  });

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    mockHiveRepository = MockHiveRepository();
    mockTodoCubit = TodoCubit(iTodoRepository: mockTodoRepository);
    Modular.bindModule(TestModule(
      todoCubit: mockTodoCubit,
      todoRepository: mockTodoRepository,
      hiveRepository: mockHiveRepository,
    ));
  });

  group('TodoCubit Test =>', () {
    blocTest(
      'Initial state',
      build: () => mockTodoCubit,
      expect: () => [],
      tearDown: () => mockTodoCubit.close(),
    );

    blocTest(
      'Load Todo with complete state',
      build: () => mockTodoCubit,
      setUp: () => when(() => mockTodoRepository.fetchListTodo()).thenAnswer(
          (_) async => ResponseAPI.fromValue(const ListTodoModel())),
      act: (bloc) => bloc.loadTodo(),
      expect: () => [
        const TodoState.loading(),
        const TodoState.loaded(response: ListTodoModel()),
      ],
    );
  });
}
