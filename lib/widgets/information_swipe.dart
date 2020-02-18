import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tour_app/utils/repo.dart';

import 'listing_image.dart';

class HeaderSection extends StatelessWidget {
  final List<String> data;
  final List<String> title;
  HeaderSection({@required this.data, this.title});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Swiper(
      autoplayDisableOnInteraction: false,
      autoplay: false,
      loop: false,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Text(title[index],style: TextStyle(color: Utils.baseColr,fontWeight: FontWeight.bold,fontSize: screen?w*.05:h*.05),),
            Expanded(
              child: HomeImage(
                borderRadius: BorderRadius.circular(0),
                image: data[index],
              ),
            ),
          ],
        );
      },
      itemCount: data?.length ?? 0,
//      control: new SwiperControl(
//        color: Util.baseColor,
//        disableColor: Colors.transparent,
//        padding: EdgeInsets.only(top: h*.9, right: 40, left: 40)
//      ),
      pagination: new SwiperPagination(
          margin: new EdgeInsets.all(5.0),
          builder: new DotSwiperPaginationBuilder(
              color: Colors.grey, activeColor: Utils.baseColr)),
    );
  }
}
