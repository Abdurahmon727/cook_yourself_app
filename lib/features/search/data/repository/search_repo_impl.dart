import '../../../../core/data/either.dart';
import '../../../../core/data/network_info.dart';
import '../../../../core/error/exeptions.dart';
import '../../../../core/error/failure.dart';
import '../../../home/data/models/converter.dart';
import '../../../home/domain/entity/recipe.dart';
import '../../domain/repository/search_repo.dart';
import '../data_source/remote_data_source.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSourceImpl _remoteDataSource =
      SearchRemoteDataSourceImpl();
  final NetworkInfo _networkInfo = const NetworkInfoImpl();
  @override
  Future<Either<Failure, List<String>>> getSuggestion(String query) async {
    if (await _networkInfo.connected) {
      try {
        final data = await _remoteDataSource.getSuggests(query);
        return Right(data);
      } on ServerException {
        rethrow;
      } catch (e) {
        return Left(ServerFailure(
          errorMessage: e.toString(),
        ));
      }
    } else {
      return Left(const ServerFailure(errorMessage: 'No Internet'));
    }
  }

  @override
  Future<Either<Failure, List<RecipeEntity>>> getResults(String query) async {
    if (await _networkInfo.connected) {
      try {
        final data = await _remoteDataSource.getResults(query);
        return Right(Converter.recipeModelToEntity(data));
      } on ServerException {
        rethrow;
      } catch (e) {
        return Left(ServerFailure(
          errorMessage: e.toString(),
        ));
      }
    } else {
      return Left(const ServerFailure(errorMessage: 'No Internet'));
    }
  }
}
