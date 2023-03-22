import 'package:flutter/material.dart';

import '../models2/Results2.dart';
import 'add_to_watch.dart';
import 'movie_details2.dart';
import 'movie_detilse.dart';


class TopRatedItem extends StatefulWidget {
  //const top({Key? key}) : super(key: key);
  Results2 results2;
  TopRatedItem(this.results2);

  @override
  State<TopRatedItem> createState() => _TopRatedItemState();
}

class _TopRatedItemState extends State<TopRatedItem> {
  bool x=false;

  @override
  Widget build(BuildContext context) {
    return
    InkWell(
      onTap: (){
        Navigator.pushNamed(context, MovieDetail2.routeName,
            arguments: widget.results2);

      },
      child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
           // color: Colors.cyan,
           // height: 150,
           // height: MediaQuery.of(context).size.height*0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Stack(
                  children: [
                    Container(

                      height:MediaQuery.of(context).size.height*0.34,
                     // 270,
                     // #343534
                      color:
                      Color.fromARGB(255, 52, 53, 52),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Image.network(
                                  fit: BoxFit.fitWidth,
                                  //width: double.infinity,
                                    //width: MediaQuery.of(context).size.width*0.1,
                                  height: MediaQuery.of(context).size.height*0.2,

                                    'http://image.tmdb.org/t/p/w500${widget.results2.posterPath}' ?? ''),

                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,),
                              SizedBox(
                                width: 5,
                              ),
                              Text('${widget.results2.voteAverage}',style: TextStyle(fontSize: 16,color: Colors.white),),
                            ],
                          ),

                          Spacer(),
                          Text('${widget.results2.title!.substring(0,8)}',style: TextStyle(fontSize: 16,color: Colors.white),),

                          Spacer(),
                          Text('${widget.results2.releaseDate}',style: TextStyle(fontSize: 14,color: Colors.grey),),
                          Spacer(),

                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),

      ),
    );
  }
}
