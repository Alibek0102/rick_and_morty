import 'package:rick_and_morty/feature/actors/data/models/actors_model.dart';

abstract class ActorsRepository {
  Future<List<ActorsModel>> getActors({required int page});
}
