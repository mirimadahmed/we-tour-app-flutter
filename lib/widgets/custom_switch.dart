
import 'package:flutter/material.dart';
import 'package:tour_app/utils/repo.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final double long;
  final double w1;
  final double h1;
  final double padding;
  final bool setting;
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const CustomSwitch({Key key, this.value, this.onChanged, this.activeColor,this.h1,this.w1,this.long,this.setting = false,this.isChecked = false,this.padding=0.0})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            margin: EdgeInsets.only(top: 1),
            padding: EdgeInsets.all(widget.padding),
            width: widget.w1 ?? w*.06,
            height: widget.h1 ??  h*.02,
            decoration: !widget.setting ? BoxDecoration(
              border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey):BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.0),
//              gradient: LinearGradient(
//                colors: _circleAnimation.value == Alignment.centerRight? [
//                  Color.fromRGBO(184, 126, 254, 0.8),Color.fromRGBO(106, 75, 242, 0.8)]:[
//                  Colors.white, Colors.white
//                ]
//              ),
            color: Color.fromRGBO(196, 196, 196, 1.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _circleAnimation.value == Alignment.centerRight
                    ? Spacer()
                    : Container(),
                Align(
                  alignment: _circleAnimation.value,
                  child: Container(
                    width: widget.long ?? l/60,
                    height: widget.long ?? l/60,
                    decoration: !widget.setting ? BoxDecoration(
                        shape: BoxShape.circle,
                        color:_circleAnimation.value == Alignment.centerRight ? Colors.pinkAccent : Colors.grey,
                    ) : BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                          colors: _circleAnimation.value != Alignment.centerRight ? [
                            Colors.white,Colors.white]:[
                            Utils.baseColr, Utils.baseColr
                          ]
                      ),
                    ),
                  ),
                ),
                _circleAnimation.value == Alignment.centerLeft
                    ? Spacer()
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
