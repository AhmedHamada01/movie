

import 'package:breaking_bad/data/models/model.dart';
import 'package:breaking_bad/data/models/quote.dart';

abstract class CharacterState {}

class CharacterInitail extends CharacterState{}

class CharactersLoaded extends CharacterState{

  final List<CharacterModel> characters ;
  CharactersLoaded(this.characters);
}
class QuotesLoaded extends CharacterState{

  final List<Quotes> quotes ;
  QuotesLoaded(this.quotes);
}
