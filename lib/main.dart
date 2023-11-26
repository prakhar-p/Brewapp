import 'package:brewapp/widgets/Searchmovie.dart';
import 'package:flutter/material.dart';
import 'package:brewapp/utils/text.dart';
import 'package:brewapp/widgets/toprated.dart';
import 'package:brewapp/widgets/trending.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tmdb_api/tmdb_api.dart';


void main() => runApp(new MyApp());
List trendingmovies = [];
List topratedmovies = [];

Color top = Colors.grey;
Color trend = Colors.black;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.orangeAccent),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = 'b64f9847b4edd280b5c9f1cd12c1d92b';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjRmOTg0N2I0ZWRkMjgwYjVjOWYxY2QxMmMxZDkyYiIsInN1YiI6IjY1NjA1YmFiYTZjMTA0MDBmZWFmZDVlZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-QPCgb0e49RcyT8i-frsoJJG8VukOfu8wSVrHXqdy6A';

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
    });
  }

  List<Widget> _buildScreens() {
    return [
      TrendingMovies(trending: trendingmovies),
      TopRatedMovies(toprated: topratedmovies),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.movie,
            color: Colors.black,
          ),
          activeColorPrimary: Colors.white70),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.star, color: Colors.black),
          activeColorPrimary: Colors.white70),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: modified_text(
            text: 'Movie App ♣',
            color: Colors.white,
            size: 20,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.search),
            )
          ],
          backgroundColor: Colors.transparent,
        ),
        body: PersistentTabView(
          context,
          screens: _buildScreens(),
          items: _navBarsItems(),
          navBarStyle: NavBarStyle.style7,
          backgroundColor: Colors.orange,
        ));
  }
}
