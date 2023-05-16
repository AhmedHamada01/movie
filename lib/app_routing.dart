import 'package:breaking_bad/bloc/cubit.dart';
import 'package:breaking_bad/constans/strings.dart';
import 'package:breaking_bad/data/api.dart';
import 'package:breaking_bad/data/models/model.dart';
import 'package:breaking_bad/data/repo.dart';
import 'package:breaking_bad/ui/character_details.dart';
import 'package:breaking_bad/ui/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  late CharacterCubit characterCubit;

  AppRouter() {
    characterRepo = CharacterRepo(CharacterApi());
    characterCubit = CharacterCubit(characterRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // this / refeare to main screen
      case characterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => characterCubit,
                  child: CharactersScreen(),
                ));

      case characterDetailsScreen:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => CharacterCubit(characterRepo),
                child: CharacterDetails(
                  character: character,
                )));
    }
  }
}
