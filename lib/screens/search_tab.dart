import 'package:flutter/material.dart';
import 'package:movies/models/Popular_movie.dart';
import 'package:movies/models/Results.dart';
import 'package:movies/screens/popular_item.dart';

import '../models/api_manager.dart';

class SearchTab extends StatefulWidget {
  static const routeName = 'Search';

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var controller = TextEditingController();
  String query = "";
  List<Results> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 29, 30, 29),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 81, 79, 79),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Container(
          height: 40,
          // width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          // margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: controller,
            onChanged: (String? value) {
              setState(() {
                query = value!;
              });
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.white)),
                filled: true,
                fillColor: Color.fromARGB(255, 81, 79, 79),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.white)),
                contentPadding: EdgeInsets.only(top: 22),
                hintText: '  search movie',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      query="";
                      list.clear();
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )),
          ),
        ),
      ),
      body: query==""
          ? Center(
            child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Icon material-local-movies.png'),

                Text(
                'No movies found',
                style: TextStyle(color: Colors.grey),
                  ),
              ],
            ),
          )
          : ListView.builder(padding: EdgeInsets.all(8),
              itemBuilder: (context, index) => Container(
                  //  color: Colors.cyan,
                  //width: double.infinity,
                  child: PopularItem(search().elementAt(index))),
              itemCount: search().length,
            ),
    );
  }

  List search() {
    ApiManager.SearchMovie(query: query).then((PopularMovie) {
      list = PopularMovie.results ?? [];
    }).catchError((error) {
      debugPrint('errooooor');
    });
    return list;
  }
}

// import 'package:flutter/material.dart';
//
// class SearchTab extends StatelessWidget {
//
//  // const SearchTab({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green,
//     );
//   }
// }
