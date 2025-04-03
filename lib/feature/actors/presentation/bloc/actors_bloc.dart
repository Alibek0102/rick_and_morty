import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/actors/data/models/actors_model.dart';
import 'package:rick_and_morty/feature/actors/data/repositories/actors_repository.dart';

part 'actors_bloc_event.dart';
part 'actors_bloc_state.dart';

class ActorsBloc extends Bloc<ActorsBlocEvent, ActorsBlocState> {
  final ActorsRepository actorsRepository;

  ActorsBloc({required this.actorsRepository}) : super(ActorsBlocState()) {
    on<ActorsFetched>((event, emit) async {
      try {
        List<ActorsModel> actorsList =
            await actorsRepository.getActors(page: 1);

        emit(state.copyWith(actors: actorsList, status: Status.success));
      } catch (error) {
        emit(state.copyWith(status: Status.failure));
      }
    });

    on<ActorsMoreFetched>((event, emit) async {
      if (state.hasReachedMax || state.nextPageLoader) return;

      try {
        emit(state.copyWith(nextPageLoader: true));
        final int nextPage = state.page + 1;
        List<ActorsModel> nextList =
            await actorsRepository.getActors(page: nextPage);

        if (nextList.isEmpty) {
          return emit(state.copyWith(hasReachedMax: true));
        }

        emit(state.copyWith(
            status: Status.success,
            actors: [...state.actors, ...nextList],
            page: nextPage,
            nextPageLoader: false));
      } catch (_) {
        emit(state.copyWith(status: Status.failure));
      }
    });
  }
}
