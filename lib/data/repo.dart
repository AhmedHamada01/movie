import 'package:breaking_bad/data/api.dart';
import 'package:breaking_bad/data/models/model.dart';
import 'package:breaking_bad/data/models/quote.dart';

class CharacterRepo {
  final CharacterApi characterApi ;

  CharacterRepo(this.characterApi);

  Future<List<CharacterModel>> getAllCharacters () async
  {
    final characters = await characterApi.getAllCharacters();

    return characters.map((character) => CharacterModel.fromJson(character)).toList();

  }

  Future<List<Quotes>> getAllQuotes (String quoteName) async
  {
    final quotes = await characterApi.getAllQuotes(quoteName);

    return quotes.map((quoteName) => Quotes.fromJson(quoteName)).toList();

  }
}