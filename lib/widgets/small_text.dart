import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final double height;

  const SmallText(
      {Key? key, this.color, required this.text, this.size, this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: color ?? const Color(0xffccc7c5),
              fontSize: size ?? 12.sp,
              fontWeight: FontWeight.w400,
              height: height)),
    );
  }
}
