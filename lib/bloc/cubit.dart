import 'package:breaking_bad/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/model.dart';
import '../data/models/quote.dart';
import '../data/repo.dart';

class CharacterCubit extends Cubit<CharacterState> {
  List<CharacterModel> characters=[];
  final CharacterRepo characterRepo;
  CharacterCubit(this.characterRepo) : super(CharacterInitail());

  List<CharacterModel> getAllCharacters() {
    characterRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }


  void getAllQuotes (String quoteName){
    characterRepo.getAllQuotes(quoteName).then((quote){
      emit(QuotesLoaded(quote));
    });
  }
}
