
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/screens/top_movies.dart';
import 'package:movie_app_flutter/screens/tv_shows.dart';
import 'package:movie_app_flutter/widgets/text.dart';
import 'package:movie_app_flutter/screens/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List trendingmovies = [];
  List topgmovies = [];
  List tvshows = [];

  final String apikey = '753547462f2439a298ea18789fd86f37';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTM1NDc0NjJmMjQzOWEyOThlYTE4Nzg5ZmQ4NmYzNyIsInN1YiI6IjYzZTRkZDExOTBmY2EzMDBmYWM5MTgxYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zMQSYHCnQJ7R-nfMSRSvs4_0TFZIL0NkibyHFvloHJ4';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }


  loadmovies()async{
    TMDB tmdbwithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));
    Map trendingresult = await tmdbwithCustomLogs.v3.trending.getTrending();
    Map topgmoviesresult = await tmdbwithCustomLogs.v3.movies.getTopRated();
    Map tvshowsresult = await tmdbwithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topgmovies = topgmoviesresult['results'];
      tvshows = tvshowsresult['results'];
    });
    print(trendingmovies);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(text:"Flutter Movie App  ❤️",color: Colors.white,
          size: 20
          ,),
      ),
      body: ListView(
          children: [
            TrendingMovies(trending: trendingmovies,),
            TopRatedMovies(toprated: topgmovies,),
            TVShows(tvShows: tvshows,)
          ],
      ),
    );
  }
}

