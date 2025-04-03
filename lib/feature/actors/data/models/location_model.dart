import 'package:rick_and_morty/feature/actors/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({required super.name, required super.url});

  LocationModel.fromJson(Map<String, dynamic> json)
      : super(url: json['url'], name: json['name']);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'name': name, 'url': url};
  }
}
