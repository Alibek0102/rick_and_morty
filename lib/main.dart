import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/clients/dio_client.dart';
import 'package:rick_and_morty/core/constants/app_colors.dart';
import 'package:rick_and_morty/feature/actors/domain/repositories/actors_repository_impl.dart';
import 'package:rick_and_morty/feature/actors/presentation/bloc/actors_bloc.dart';
import 'package:rick_and_morty/shared/routes/app_routes.dart';

void main() {
  runApp(RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  RickAndMorty({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => DioClient()),
        RepositoryProvider(
            create: (context) => ActorsRepositoryImpl(
                client: RepositoryProvider.of<DioClient>(context).instance))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ActorsBloc(
                  actorsRepository:
                      RepositoryProvider.of<ActorsRepositoryImpl>(context)))
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: AppColors.lightGray),
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}
