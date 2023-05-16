import 'package:breaking_bad/app_routing.dart';
import 'package:breaking_bad/ui/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp( Movie(appRouter: AppRouter(),));
}

class Movie extends StatelessWidget {

  final AppRouter appRouter ;

  Movie({required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false ,
          // To Navigate Between Screens
          onGenerateRoute:appRouter.generateRoute ,
        );
      },
    );
  }
}