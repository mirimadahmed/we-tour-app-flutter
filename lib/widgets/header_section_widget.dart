import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tour_app/utils/repo.dart';

import 'listing_image.dart';

class HeaderSection extends StatelessWidget {
  final List<String> imageList;
  final List<String> title;
  HeaderSection({@required this.imageList, this.title});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Swiper(
      autoplay: imageList.length > 1 ? true : false,
      loop: imageList.length > 1 ? true : false,
      itemBuilder: (context, index){
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            HomeImage(
              borderRadius: BorderRadius.circular(0),
              image: imageList[index],
            ),
            Positioned(
              bottom: 35,
              child: Container(
                padding: EdgeInsets.only(bottom: 5,top: 5,left: 13),
                width: w,
                color: Colors.black54,
                child: Text(title[index], style: TextStyle(fontSize: screen?w*.04:h*.04,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),
          ],
        );
      },
      itemCount: imageList.length,
      pagination: new SwiperPagination(
          builder: new DotSwiperPaginationBuilder(
              color: Colors.grey, activeColor: Utils.baseColr)
      ),
    );
  }
}