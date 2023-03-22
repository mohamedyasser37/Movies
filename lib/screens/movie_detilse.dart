import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/Results.dart';
import '../models/api_manager.dart';
import 'like_this.dart';
// import 'package:movies/models/Results.dart';
// import 'package:movies/models2/Results2.dart';
// import 'package:movies/screens/like_this.dart';
// import 'package:movies/screens/popular_item.dart';
// import 'package:movies/screens/top_rated_item.dart';
//
// import '../models/api_manager.dart';
// //import '../mov_det/Result3.dart';

class MovieDetail extends StatelessWidget {
  static const routeName = 'MovieDetail';

//MovieDetail(this.results);
  @override
  Widget build(BuildContext context) {
    Results results = ModalRoute.of(context)!.settings.arguments as Results;
   //Results2 results2=ModalRoute.of(context)!.settings.arguments as Results2;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 29, 30, 29),
        title: Text('${results.title}'),
      ),
      body: Container(
        color:Color.fromARGB(255, 29, 30, 29),

        //Color.fromARGB(255, 18, 19, 18),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.26,
              width: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl:
                    'http://image.tmdb.org/t/p/w500${results.backdropPath}' ?? '',
                // height: 170,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${results.title}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '${results.releaseDate}',
                style: TextStyle(fontSize: 18,color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
            // color: Colors.cyan,
              height: MediaQuery.of(context).size.height*0.22,
              child: Row(
                children: [
                  CachedNetworkImage(
                    width: MediaQuery.of(context).size.width*0.3,
                    fit: BoxFit.fill,
                    imageUrl:
                    'http://image.tmdb.org/t/p/w500${results.posterPath}' ??
                        '',
                    // height: 170,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                  Spacer(),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.amber,
                              size: 28,),
                            Text('${results.voteAverage}',style:
                            TextStyle(color: Colors.white,
                                fontSize: 18
                            )

                              ,),
                          ],
                        ),
                        Container(
                         // color: Colors.red,
                          width: MediaQuery.of(context).size.width*0.55,
                          child: Text('${results.overview}',style:
                             TextStyle(

                             overflow: TextOverflow.clip,color: Colors.white)

                            ,),
                        ),

                      ],
                    ),
                  ),
                  Spacer(),
                  Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'More Like This',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            FutureBuilder(
              future: ApiManager.getMovieDetail(results.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(color: Colors.amber,));
                }
                if (snapshot.hasError) {
                  return Center(
                      child:
                      Text('Erorrrrr${snapshot.error.toString()}'));
                }
                var tab=snapshot.data?.results;
                return Expanded(
                  child: ListView.builder(
                    // padding: EdgeInsets.symmetric(horizontal: 50),
                    // physics: ScrollPhysics(parent: ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            // width: 100,
                            color: Color.fromARGB(255, 40, 42, 40),
                            child: LikeThis(tab![index]));
                      }, itemCount:3

                  //tab?.length??0

                    // ,
                  ),
                );
              },),

          ],
        ),
      ),
    );
  }
}
