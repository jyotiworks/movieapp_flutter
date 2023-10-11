import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widgets/text.dart';
class TVShows extends StatelessWidget {
  final List tvShows;

  TVShows({required this.tvShows});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Tv Shows', color: Colors.white, size: 26),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvShows.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){

                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                     // height: 140,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            height:140,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+tvShows[index]['backdrop_path']
                                    ),
                                  fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Expanded(
                            child: Container(
                              child: ModifiedText(
                                text: tvShows[index]['original_name'] != null?
                                tvShows[index]['original_name']: 'Loading..'
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
