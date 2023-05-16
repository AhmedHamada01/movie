import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad/bloc/cubit.dart';
import 'package:breaking_bad/bloc/state.dart';
import 'package:breaking_bad/constans/my_colors.dart';
import 'package:breaking_bad/data/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel character;
  const CharacterDetails({Key? key, required this.character}) : super(key: key);

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 500.0.h,
      pinned: true,
      stretch: true,
      backgroundColor: MyColos.MyGrey,
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
        title: Text(
          overflow: TextOverflow.ellipsis,
          "${character.title}",
          style: TextStyle(
            color: MyColos.MyWhite,
            fontSize: 16.0.sp,
          ),
        ),
        centerTitle: true,
        background: Hero(
          tag: "${character.id}",
          child: Image.network(
            "${character.image}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterinfo(String title) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColos.MyWhite,
              fontWeight: FontWeight.bold,
              fontSize: 16.0.sp,
            ),
          ),
          // TextSpan(
          //   text: value,
          //   style: TextStyle(
          //     color: MyColos.MyGrey,
          //     fontSize: 14.0,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColos.MyYellow,
      height: 30.0.sp,
      endIndent: endIndent,
      thickness: 2.h,
    );
  }

  Widget checkIfQuotesAreLoaded(CharacterState state){
    if(state is QuotesLoaded){
      return displayRandomQuoteOrEmptySpace(state);
    }else{
      return Center(child: CircularProgressIndicator(
        color: MyColos.MyYellow,
      ));
    }
  }
  Widget displayRandomQuoteOrEmptySpace(state){
    var quotes = (state).quotes;
    if(quotes.length != 0){
       int randomCodeIndex = Random().nextInt(quotes.length -1);
       return Center();
    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<CharacterCubit>(context).getAllQuotes(character.name!);
    return Scaffold(
      backgroundColor: MyColos.MyGrey,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0).w,
                  padding: EdgeInsets.all(8).h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterinfo(
                        "FullTitle :  ${character.fullTitle} ",
                      ),
                      buildDivider(250.h),
                      characterinfo(
                        "Crew :  ${character.crew} ",
                      ),
                      buildDivider(220.h),
                      characterinfo(
                        "imDbRating :  ${character.imDbRating} ",
                      ),
                      buildDivider(200.h),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DefaultTextStyle(
                 textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    color: MyColos.MyWhite,
                    shadows: [
                      Shadow(
                        blurRadius: 7,
                        color: MyColos.MyYellow,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FlickerAnimatedText("Growth itself contains the germ of happiness"),
                    ],
                  ) ,
                ),
                SizedBox(
                  height: 500.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
