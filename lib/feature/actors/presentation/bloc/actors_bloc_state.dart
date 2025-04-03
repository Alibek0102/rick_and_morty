part of 'actors_bloc.dart';

enum Status { initital, success, failure }

class ActorsBlocState {
  final Status status;
  final List<ActorsModel> actors;
  final bool hasReachedMax;

  ActorsBlocState(
      {this.status = Status.initital,
      this.actors = const <ActorsModel>[],
      this.hasReachedMax = false});

  ActorsBlocState copyWith(
      {List<ActorsModel>? actors, bool? hasReachedMax, Status? status}) {
    return ActorsBlocState(
        actors: actors ?? this.actors,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        status: status ?? this.status);
  }
}
