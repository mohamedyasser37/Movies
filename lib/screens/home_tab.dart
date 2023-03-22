import 'package:flutter/material.dart';
import 'package:movies/models/Popular_movie.dart';
import 'package:movies/models/Results.dart';
import 'package:movies/models/api_manager.dart';
// import 'package:movies/models/top_rated.dart';
import 'package:movies/screens/popular_item.dart';
import 'package:movies/screens/top_rated_item.dart';

class HomeTab extends StatelessWidget {
  //const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    centerTitle: true,
    backgroundColor: Color.fromARGB(255, 29, 30, 29),
    title: Text('Movie',style: TextStyle(color: Colors.amber),),
    ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: ApiManager.getPopular(),
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
                  child: Column(
                    children: [
                  Expanded(
                  child: ListView.builder(
                  // physics: ScrollPhysics(parent: ),
                  scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return PopularItem(tab![index]);
                      }, itemCount:
                  tab?.length??0
                    // ,
                  ),
                  ),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('Recomended ',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),

                      FutureBuilder(
                        future: ApiManager.getTopRated(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator(color: Colors.black,));
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
                                      child: TopRatedItem(tab![index]));
                                }, itemCount:
                            tab?.length??0
                              // ,
                            ),
                          );
                        },),


                    ],
                  ),
                );
            },),


          ],
        ),
      ),
    );
  }
}
