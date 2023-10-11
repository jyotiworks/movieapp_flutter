import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widgets/text.dart';
class Description extends StatelessWidget {
  final String name;
  final  String description;
  final String bannerurl;
  final String posterurl;
  final String launch_on;
  final String vote;

   Description({super.key,
     required this.name,
   required this.description,
   required this.bannerurl,
   required this.launch_on,
   required this.posterurl,
   required this.vote});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: ListView(
            children: [

              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerurl,fit: BoxFit.cover,),
                    )),
                    Positioned(
                      bottom: 10,
                        child: ModifiedText(text: ' ✰ Average Rating - '+vote,
                    color: Colors.white,
                    size: 25,)),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(10),
                child: ModifiedText(
                  text: name !=null ? name: 'Name Loaded',
                  size: 25,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: ModifiedText(
                  text: 'Releasing On - '+launch_on,size: 15,color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 200,
                    width: 100,
                    child: Image.network(posterurl),
                  ),
                  Flexible(
                    child: Container(
                      child: ModifiedText(
                        text: description,size: 20,color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
