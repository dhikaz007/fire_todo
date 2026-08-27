import '../../domain/repositories/i_home_repository.dart';

/// Placeholder implementation of [IHomeRepository].
///
/// Currently the Home feature does not have its own data layer,
/// as it aggregates data from Todo and Profile features via their cubits.
class HomeRepositoryImpl implements IHomeRepository {
  HomeRepositoryImpl();
}
