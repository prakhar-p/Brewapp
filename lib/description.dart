import 'package:flutter/material.dart';
import 'package:brewapp/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Container(

        child: ListView(children: [
          Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


                Positioned(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black54,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: modified_text(text:'⭐ Average Rating - ' + vote, color: Colors.white,size: 25,),
                        ),
                        SizedBox(height: 200),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: modified_text(
                                text: name != null ? name : 'Not Loaded',color: Colors.white, size: 24)),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child:
                            modified_text(text: 'Releasing On - ' + launch_on,color: Colors.white, size: 14)),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Container(
                              height: 200,
                              width: 100,
                              child: Image.network(posterurl),
                            ),
                            Flexible(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: modified_text(text: description, color:Colors.white,size: 18)),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ])),

        ]),
      ),
    );
  }
}
