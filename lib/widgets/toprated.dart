import 'package:flutter/material.dart';
import 'package:brewapp/utils/text.dart';


class TopRatedMovies extends StatelessWidget {
  final List toprated;

  TopRatedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,


      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            modified_text(text: 'Top Rated Movies', color: Colors.white, size: 20),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black26, width: 2),
                          color: Colors.black12
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        toprated[index]['poster_path']),
                              ),
                            ),
                            height: 200,
                          ),
                          SizedBox(height: 15),
                          Container(
                              child: modified_text(
                                  text: toprated[index]['title'] != null
                                      ? toprated[index]['title']
                                      : 'Loading',
                                  color: Colors.black,
                                  size: 25)),
                          SizedBox(height: 10),
                          Container(
                              child: modified_text(
                                  text: toprated[index]['overview'] != null
                                      ? toprated[index]['overview']
                                      : 'Loading',
                                  color: Colors.white,
                                  size: 15)),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
