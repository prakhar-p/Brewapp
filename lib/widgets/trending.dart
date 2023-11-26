import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brewapp/utils/text.dart';

import '../description.dart';
import '../main.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(

        children: [
          modified_text(text: 'Movies', color: Colors.white, size: 26),

          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: trending[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    description: trending[index]['overview'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                    launch_on: trending[index]
                                        ['release_date'],
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      //width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black26,width: 2),
                        color: Colors.black12
                      ),
                      child: Column(

                        children: [
                          Container(
                            height:200,
                            width: 300,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path']),
                              ),
                            ),

                          ),
                          SizedBox(height: 10),
                          Container(

                              child: modified_text(
                                  text: trending[index]['title']!=null? trending[index]['title']:'Loading',
                                  color: Colors.black,
                                  size: 25
                              )
                          ),
                          SizedBox(height: 10),
                          Container(

                              child: modified_text(
                                  text: trending[index]['overview']!=null? trending[index]['overview']:'Loading',
                                  color: Colors.white,
                                  size: 15
                              )
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    /*ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path']),
                          ),
                        ),
                        height: 200,
                      ),
                      title: modified_text(
                          text: trending[index]['title']!=null? trending[index]['title']:'Loading',
                          color: Colors.white,
                          size: 15
                      ),
                      subtitle: modified_text(
                          text: trending[index]['description']!=null? trending[index]['description']:'Loading',
                          color: Colors.white,
                          size: 10
                      ),
                      Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                                child: modified_text(
                                    text: trending[index]['title']!=null? trending[index]['title']:'Loading',
                                    color: Colors.white,
                                    size: 15
                                )
                            )
                          ],
                        ),
                      ),*/

                  );
                }),
          )
        ],
      ),
    );
  }
}
