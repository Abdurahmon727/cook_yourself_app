import '../../../../core/error/failure.dart';
import '../../../home/domain/entity/recipe.dart';

import '../../../../core/data/either.dart';

abstract class FavouritesRepository {
  Either<CacheFailure, List<RecipeEntity>> getEntities();
  Either<CacheFailure, void> putEntities(List<RecipeEntity> recipes);
  Either<CacheFailure, void> removeEntity(int id);
}
