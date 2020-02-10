import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  final VoidCallback onTap;
  final Color color1;
  final Color color2;
  final double w;
  final double h;
  final double sizeIcon;
  final IconData arrow;
  BackArrow({this.onTap, this.color1, this.color2, this.w, this.h, this.arrow,this.sizeIcon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w ?? 25,
      height: h ?? 25,
      decoration: BoxDecoration(
        color: color1 ?? Colors.black,
        borderRadius: BorderRadius.circular(100),
      ),
      child: RawMaterialButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Center(child: Icon(arrow ?? Icons.arrow_back_ios, color: color2 ?? Colors.white,size: sizeIcon ?? 16,)),
      ),
    );
  }
}
