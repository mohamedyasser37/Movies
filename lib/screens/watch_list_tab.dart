import 'package:flutter/material.dart';
import 'package:movies/screens/popular_item.dart';
import 'package:movies/screens/add_to_watch.dart';

import '../models/Results.dart';
import '../models2/Results2.dart';

class WatchListTab extends StatefulWidget {
  Results results;
  Results2 results2;
  WatchListTab(this.results,this.results2);

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 29, 30, 29),
        title: Text('Watch list',style: TextStyle(color: Colors.amber),),
      ),
      body: Container(
        color: Color.fromARGB(255, 29, 30, 29),
        child: AddToWatch(widget.results),


      ),
    );


  }
}
