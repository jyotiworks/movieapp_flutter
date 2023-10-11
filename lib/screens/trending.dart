import 'package:flutter/material.dart';
import 'package:movie_app_flutter/screens/description_page.dart';
import 'package:movie_app_flutter/widgets/text.dart';
class TrendingMovies extends StatelessWidget {
 final List trending;

 TrendingMovies({required this.trending});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Trending Movies', color: Colors.white, size: 26),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index){
              return InkWell(
                onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context) => Description(
    name: trending[index]['title'],
    description: trending[index]['overview'],
    bannerurl:  'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
    launch_on: trending[index]['release_date'],
    posterurl:  'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
    vote: trending[index]['vote_average'].toString())));
                },
                child: trending[index]['title'] != null ?
                Container(
                  width: 140,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        height:200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']

                            )
                          )
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ModifiedText(
                            text: trending[index]['title'] != null?
                                trending[index]['title']: 'Loading..'
                            ,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ):Container(),
              );
                }),
          )
        ],
      ),
    );
  }
}
