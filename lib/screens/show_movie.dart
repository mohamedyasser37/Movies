import 'package:flutter/material.dart';

import 'package:movies/screens/vid.dart';

import '../models/Results.dart';
import '../models/api_manager.dart';

class ShowMovie extends StatelessWidget {
  static const routeName='ShowMovie';

  @override
  Widget build(BuildContext context) {
    Results results = ModalRoute.of(context)!.settings.arguments as Results;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 29, 30, 29),
        title: Text('Movie',style: TextStyle(color: Colors.amber),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: ApiManager.getVideo(results.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {

                return Center(child: CircularProgressIndicator(color: Colors.amber,));
              }
              if (snapshot.hasError) {
                return Center(
                    child:
                    Text('Erorrrrr55${snapshot.error}'));
              }
              if(snapshot.hasData){

                print('${snapshot.data?.results}');
              }
              var tab=snapshot.data?.results;
              return  Video(tab![1]);
            },),
        ],
      ),
    );
  }
}
