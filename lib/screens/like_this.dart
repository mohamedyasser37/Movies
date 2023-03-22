import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';



import '../models/Results.dart';
import '../mov_det/Result3.dart';

class LikeThis extends StatelessWidget {
  Results results3;

  LikeThis(this.results3);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  // 270,
                  // #343534
                  color: Color.fromARGB(255, 52, 53, 52),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Image.network(
                                fit: BoxFit.fitWidth,
                                //width: double.infinity,
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                'http://image.tmdb.org/t/p/w500${results3.posterPath}' ??
                                    ''),
                            CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 81, 79, 79),
                              radius: 14,
                              child: IconButton(
                                padding: EdgeInsets.all(2),
                                alignment: Alignment.topLeft,
                                style: ButtonStyle(),
                                onPressed: () {},
                                icon: Icon(Icons.add),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${results3.voteAverage}',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '${results3.title!.substring(0, 8)}',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        '${results3.releaseDate}',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
