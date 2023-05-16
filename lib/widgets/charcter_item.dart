import 'package:breaking_bad/constans/my_colors.dart';
import 'package:breaking_bad/constans/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/models/model.dart';

class CharacterItem extends StatelessWidget {

  final CharacterModel character ;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8.w, 8.w, 8.w, 8.w),
      padding: EdgeInsetsDirectional.all(4.h),
      decoration: BoxDecoration(
        color: MyColos.MyWhite,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context,characterDetailsScreen,arguments: character);
        },
        child: GridTile(
            child: Hero(
              tag: "${character.id}",
              child: Container(
                color: MyColos.MyGrey,
                child: character.image!.isNotEmpty ?
                FadeInImage.assetNetwork(
                  width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: "assets/loading3.gif",
                    image: "${character.image}",
                ): Image.asset("assets/Icon.png"),
              ),
            ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10).h,
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.title}',
              style: TextStyle(
                height: 1.3.h,
                fontSize: 16.0.sp,
                color: MyColos.MyWhite,
                fontWeight: FontWeight.bold,
              ),
              // this if the name is too long this complete the name with ...
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
