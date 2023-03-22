import 'package:flutter/material.dart';
import 'package:movies/screens/list_item.dart';
import 'package:movies/screens/popular_item.dart';

import '../models/Results.dart';
import '../models2/Results2.dart';

class AddToWatch extends StatelessWidget {
 // PopularItem popularItem;
  Results results;


  AddToWatch(this.results,);
 static List<Results>list=[];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListItem(list[index]);
                }, itemCount:
            list.length
              // ,
            ),
          ),

        ],
      ),


    );
  }

 static added1(Results value){
   var x= list.add(value);
return x;
  }

}
