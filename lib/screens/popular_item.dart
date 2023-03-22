import 'package:flutter/material.dart';
import 'package:movies/models/Popular_movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/models/Results.dart';
import 'package:http/http.dart' as http;
import 'package:movies/screens/movie_detilse.dart';
import 'package:movies/screens/add_to_watch.dart';

import 'package:movies/screens/show_movie.dart';

class PopularItem extends StatefulWidget {
  Results results;

  PopularItem(this.results);

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool x = false;
 static List<Results>items=[];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.36,
              //width: double.infinity,
              child: Stack(
                children: [
                  Container(

                    //height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width,

                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:
                          'http://image.tmdb.org/t/p/w400${widget.results.backdropPath}' ??
                              '',
                      width: double.infinity,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        width: MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18)),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MovieDetail.routeName,
                                arguments: widget.results);
                          },
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    'http://image.tmdb.org/t/p/w500${widget.results.posterPath}' ??
                                        '',
                                // height: 170,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              InkWell(
                                onLongPress: () {
                                  x = false;
                                  setState(() {});
                                },
                                child: IconButton(
                                  padding: EdgeInsets.all(2),
                                  alignment: Alignment.topLeft,
                                  style: ButtonStyle(),
                                  onPressed: () {
                                    x = true;
                                    //items.add(widget.results);

                                    AddToWatch.added1(widget.results);
                                    setState(() {});
                                  },
                                  icon: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 81, 79, 79),
                                      radius: 15,
                                      child: x == false
                                          ? Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            )),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(
                            flex: 28,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Text(
                              widget.results.title ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),


                          Spacer(),
                          Text(
                            widget.results.releaseDate ?? '',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          Spacer(),
                        ],
                      )
                    ],
                  ),

                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {Navigator.pushNamed(context, ShowMovie.routeName,
                    arguments: widget.results);},
                icon: Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: 60,
                )),
          ],
        ),
      ],
    );
  }

  print1(String res) {
    var x = print(res);
    return x;
  }
}
