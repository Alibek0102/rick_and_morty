part of 'actors_bloc.dart';

enum Status { initital, success, failure }

class ActorsBlocState {
  final Status status;
  final List<ActorsModel> actors;
  final bool hasReachedMax;
  final int page;
  final bool nextPageLoader;

  ActorsBlocState(
      {this.status = Status.initital,
      this.actors = const <ActorsModel>[],
      this.hasReachedMax = false,
      this.page = 1,
      this.nextPageLoader = false});

  ActorsBlocState copyWith(
      {List<ActorsModel>? actors,
      bool? hasReachedMax,
      Status? status,
      int? page,
      bool? nextPageLoader}) {
    return ActorsBlocState(
        actors: actors ?? this.actors,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        status: status ?? this.status,
        page: page ?? this.page,
        nextPageLoader: nextPageLoader ?? this.nextPageLoader);
  }
}
