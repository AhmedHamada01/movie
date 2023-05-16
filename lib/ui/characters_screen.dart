import 'package:breaking_bad/bloc/cubit.dart';
import 'package:breaking_bad/constans/my_colors.dart';
import 'package:breaking_bad/data/api.dart';
import 'package:breaking_bad/data/models/model.dart';
import 'package:breaking_bad/data/repo.dart';
import 'package:breaking_bad/widgets/charcter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/state.dart';

class CharactersScreen extends StatefulWidget {

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

  late List<CharacterModel> allCharacters;
  late List<CharacterModel> searchedForCharacters ;
  bool _isSearching = false ;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField ()
  {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColos.MyGrey,
      decoration: InputDecoration(
        hintText: "Find a character...",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColos.MyGrey,
          fontSize: 18.0.sp,

        ),
      ),
      style: TextStyle(
        color: MyColos.MyGrey,
        fontSize: 18.0.sp,

      ),
      onChanged: (searchedCharacter){
        addSearchedForItemsToSearchedlist(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedlist(String searchedCharacter ){
    searchedForCharacters = allCharacters.where((CharacterModel) =>
        CharacterModel.title!.toLowerCase().startsWith(searchedCharacter)).toList();
    setState(() {

    });
  }

  List<Widget> _buildAppBarActions ()
  {
    if(_isSearching){
      return [
        IconButton(
            onPressed: (){
              _clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: MyColos.MyGrey,
            ),
        ),
      ];
    }else{
      return [
        IconButton(
            onPressed: _startSearch,
            icon: Icon(
              Icons.search,
              color: MyColos.MyGrey,
            ),
        ),
      ];
    }
  }

  void _startSearch (){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching(){
    _clearSearch();
    setState(() {
      _isSearching =false ;
    });
  }

  void _clearSearch (){
    setState(() {
      _searchTextController.clear();
    });
  }
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }


  Widget buildBlocWidget(){
    return BlocBuilder<CharacterCubit,CharacterState>(
        builder: (context , state){
          if(state is CharactersLoaded){
            allCharacters = state.characters;
            return buildLoadedListWidget();
          }else{
            return Center(
                child: CircularProgressIndicator(
                  color: MyColos.MyYellow,
                ));
          }
        },
    );
  }
  Widget buildLoadedListWidget (){
    return SingleChildScrollView(
      child: Container(
        color: MyColos.MyGrey,
        child: Column(
          children: [
            buildCharactersList (),
          ],
        ),
      ),
    );
  }
  Widget buildCharactersList(){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 1.w,
          mainAxisSpacing: 1.h,
        ),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: _searchTextController.text.isEmpty ? allCharacters.length : searchedForCharacters.length,
        itemBuilder:(context,index){
          return CharacterItem(
            character: _searchTextController.text.isEmpty ?allCharacters[index]:searchedForCharacters[index],
          );
        } ,
    );
  }

  Widget _buildAppBarTitle(){
    return Text(
      "Characters",
      style: TextStyle(
        color: MyColos.MyGrey,
      ),
    );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColos.MyGrey,
      appBar: AppBar(
        backgroundColor: MyColos.MyYellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
        leading: _isSearching ? const BackButton(color: MyColos.MyGrey,) : Container() ,
      ),
      body: buildBlocWidget(),
    );
  }
}
