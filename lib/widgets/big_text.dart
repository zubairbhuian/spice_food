import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final TextOverflow textOverflow;
  const BigText(
      {Key? key,
      this.color,
      required this.text,
      this.size,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: color ?? const Color(0xff332d2b),
              fontSize: size?? 20.sp,
              fontWeight: FontWeight.w400)),
    );
  }
}
