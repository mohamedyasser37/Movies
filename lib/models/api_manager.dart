import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/models/Popular_movie.dart';
import 'package:movies/mov_det/Movie_details.dart';
import 'package:movies/screens/movie_detilse.dart';
//import 'package:movies/models/top_rated.dart';

import '../models2/Top_rated.dart';
import '../play_movie/Play_movie.dart';
import '../play_movie/Results.dart';

class ApiManager {
  static Future<PopularMovie> getPopular()async {
   var response=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=1c0afddf7efa0f0717fee2ef026a7fc5'));

    return PopularMovie.fromJson(jsonDecode(response.body));
  }

  static Future<PlayMovie> getVideo(num id)async {
    var response=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/${id}/videos?api_key=1c0afddf7efa0f0717fee2ef026a7fc5&language=en-US'));

    return PlayMovie.fromJson(jsonDecode(response.body));
  }


  static Future<TopRated> getTopRated()async {
    var response=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=1c0afddf7efa0f0717fee2ef026a7fc5&language=en-US'));

    return TopRated.fromJson(jsonDecode(response.body));
  }



  static Future<PopularMovie> getMovieDetail(num x)async {
    var response=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/${x}/similar?api_key=1c0afddf7efa0f0717fee2ef026a7fc5&language=en-US&page=1'));

    return PopularMovie.fromJson(jsonDecode(response.body));
  }

  static Future<PopularMovie> getMovieDetail2(num x)async {
    var response=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/${x}/similar?api_key=1c0afddf7efa0f0717fee2ef026a7fc5&language=en-US&page=1'));

    return PopularMovie.fromJson(jsonDecode(response.body));
  }

  static Future<PopularMovie> Search({required String? query})async {
    var response=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=1c0afddf7efa0f0717fee2ef026a7fc5&query=$query'));

    return PopularMovie.fromJson(jsonDecode(response.body));
  }



  static Future<PopularMovie>SearchMovie({ String? query})async{
    var url=Uri.https('api.themoviedb.org','/3/search/movie',{
      'api_key':'1c0afddf7efa0f0717fee2ef026a7fc5',
      'query':query,
      //'pageSize':'10'
    }
    );
    var response=await http.get(url);
    return PopularMovie.fromJson(jsonDecode(response.body));
  }




}
//var response=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=1c0afddf7efa0f0717fee2ef026a7fc5&language=en-US&page=1'));

// var url = Uri.https('api.developers.themoviedb.org','/3/movie/popular', {
//   'api_key': '1c0afddf7efa0f0717fee2ef026a7fc5',
//   //'category':categoryID,
// });
// var response=await http.get(url);