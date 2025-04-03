import 'package:rick_and_morty/feature/actors/data/models/location_model.dart';
import 'package:rick_and_morty/feature/actors/domain/entities/actors_entity.dart';

class ActorsModel extends ActorsEntity {
  ActorsModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.location});

  ActorsModel.fromJson(Map<String, dynamic> json)
      : super(
            id: json['id'],
            name: json['name'],
            image: json['image'],
            location: LocationModel.fromJson(json['location']));
}
