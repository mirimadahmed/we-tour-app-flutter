import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


class HomeImage extends StatelessWidget {
  final String image, name;
  final double w;
  final double h;
  final VoidCallback onTap;
  final BorderRadius borderRadius;
  HomeImage({this.image,this.name, this.w, this.h, this.onTap, this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14)
          ),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://picsum.photos/250?image=9',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
