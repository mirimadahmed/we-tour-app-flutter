import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tour_app/utils/repo.dart';

class HeaderSection extends StatelessWidget {
  final List<Widget> data;
  HeaderSection({@required this.data});
  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoplayDisableOnInteraction: false,
      autoplay: false,
      loop: false,
      itemBuilder: (context, index) {
        return data[index];
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
              color: Colors.white, activeColor: Utils.baseColr)),
    );
  }
}
