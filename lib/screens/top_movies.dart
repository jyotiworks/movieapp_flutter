import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widgets/text.dart';
class TopRatedMovies extends StatelessWidget {
  final List toprated;

  TopRatedMovies({required this.toprated});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Top Movies', color: Colors.white, size: 26),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){

                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']

                                    )
                                )
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: ModifiedText(
                                text: toprated[index]['title'] != null?
                                toprated[index]['title']: 'Loading..'
                                ,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
