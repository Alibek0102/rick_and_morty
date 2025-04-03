import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/actors/data/models/actors_model.dart';
import 'package:rick_and_morty/feature/actors/data/repositories/actors_repository.dart';

class ActorsRepositoryImpl extends ActorsRepository {
  final Dio _client;
  final String endpoint = '/character';

  ActorsRepositoryImpl({required Dio client}) : _client = client;

  @override
  Future<List<ActorsModel>> getActors({required int page}) async {
    try {
      Response response =
          await _client.get(endpoint, queryParameters: {'page': page});
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['results'] as List<dynamic>;
        return jsonList
            .map((element) => ActorsModel.fromJson(element))
            .toList();
      } else {
        throw ErrorDescription('Не удалось загрузить!');
      }
    } catch (error) {
      throw ErrorDescription('Не удалось загрузить!');
    }
  }
}
