import 'package:rick_and_morty/feature/actors/domain/entities/location_entity.dart';

class ActorsEntity {
  final int id;
  final String name;
  final String image;
  final LocationEntity location;

  ActorsEntity(
      {required this.id,
      required this.name,
      required this.image,
      required this.location});
}
