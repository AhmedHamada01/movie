import 'package:breaking_bad/constans/strings.dart';
import 'package:breaking_bad/data/models/model.dart';
import 'package:dio/dio.dart';

class CharacterApi
{
  late Dio dio ;

  CharacterApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20) ,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters () async
  {
    try{
      Response response = await dio.get("MostPopularMovies/k_flg83fzy");
      print(response.data.toString());
      return response.data["items"];
    }catch(e) {
      print(e.toString());
      return[];
  }
  }


  Future<List<dynamic>> getAllQuotes (String quoteName) async
  {
    try{
      Response response = await dio.get(
          "quotes",
          queryParameters: {"category" : quoteName},
      );
      print(response.data.toString());
      return response.data;
    }catch(e) {
      print(e.toString());
      return[];
    }
  }
}