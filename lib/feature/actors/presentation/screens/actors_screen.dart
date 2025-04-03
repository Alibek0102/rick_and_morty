import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/actors/presentation/bloc/actors_bloc.dart';
import 'package:rick_and_morty/feature/actors/presentation/widgets/actor_card.dart';
import 'package:rick_and_morty/shared/widgets/base_header.dart';

@RoutePage()
class ActorsScreen extends StatefulWidget {
  const ActorsScreen({super.key});

  @override
  State<ActorsScreen> createState() => _ActorsScreenState();
}

class _ActorsScreenState extends State<ActorsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_loadMore);
    BlocProvider.of<ActorsBloc>(context).add(ActorsFetched());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      BlocProvider.of<ActorsBloc>(context).add(ActorsMoreFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BaseHeader(title: 'Персонажи'),
        body: BlocBuilder<ActorsBloc, ActorsBlocState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.failure:
                return const Center(
                  child: Text('Failed'),
                );
              case Status.initital:
                return const Center(child: CircularProgressIndicator());
              case Status.success:
                if (state.actors.isEmpty) {
                  return const Center(
                    child: Text('Не найдено'),
                  );
                }
                return GridView.builder(
                  controller: _scrollController,
                  itemCount: state.actors.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, int index) {
                    return ActorCard(
                      imageURL: state.actors[index].image,
                      actorName: state.actors[index].name,
                      actorLocation: state.actors[index].location.name,
                    );
                  },
                );
            }
          },
        ));
  }
}
