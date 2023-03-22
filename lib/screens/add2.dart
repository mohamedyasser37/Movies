import 'package:flutter/material.dart';
import 'package:movies/screens/list_item.dart';
import 'package:movies/screens/popular_item.dart';

import '../models/Results.dart';
import '../models2/Results2.dart';

class AddToWatch2 extends StatelessWidget {
  // PopularItem popularItem;
  Results2 results2;


  AddToWatch2(this.results2,);
  static List<Results>list2=[];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListItem(list2[index]);
                }, itemCount:
            list2.length
              // ,
            ),
          ),

        ],
      ),


    );
  }


  static added2(Results value2){
    var y= list2.add(value2);
    return y;
  }
}
