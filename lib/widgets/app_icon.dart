import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? size;
  final double? iconSize;
  const AppIcon(
      {Key? key, required this.icon, this.bgColor, this.iconColor, this.size, this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 40,
      height: size ?? 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(890),
        color: bgColor ?? const Color(0xfffcf4e4),
      ),
      child: Icon(
        icon,
        color: iconColor ?? const Color(0xff756d54),
        size:iconSize?? 16.w,
      ),
    );
  }
}
