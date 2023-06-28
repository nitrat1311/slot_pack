import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const_colors.dart';

class GlowingButton extends StatefulWidget {
  final Widget child;

  const GlowingButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  GlowingButtonState createState() => GlowingButtonState();
}

class GlowingButtonState extends State<GlowingButton> {
  var glowing = false;
  var scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: AppColors.randomPadding / 10),
      // width: MediaQuery.of(context).size.width / 1.5,
      // height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 12),
        borderRadius: const BorderRadius.horizontal(
            left: Radius.elliptical(13, 80), right: Radius.elliptical(80, 13)),
        gradient: const LinearGradient(
          colors: [
            AppColors.backColor,
            AppColors.frontColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.solid,
            offset: const Offset(0, 7.0),
            blurRadius: 26,
            color: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.3),
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
            child: widget.child),
      ]),
    );
  }
}
