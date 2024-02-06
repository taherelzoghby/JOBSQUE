import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.leadingOnTap,
    required this.title,
    this.trailingOnTap,
    this.trailingWidget,
    this.image,
    this.color = AppConsts.neutral900,
  });

  final void Function()? leadingOnTap;
  final String title;
  final void Function()? trailingOnTap;
  final Widget? trailingWidget;
  final String? image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(4.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///arrow back
          leadingOnTap == null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image!,
                    height: size.height * .075.h,
                  ),
                )
              : Row(
                  children: [
                    IconButton(
                      onPressed: leadingOnTap,
                      icon: Icon(Icons.arrow_back, color: color),
                    ),
                    // SizedBox(width: size.width * .25.w),
                  ],
                ),

          Text(
            title,
            style: AppConsts.style20.copyWith(
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          //const Spacer(),

          ///reset
          trailingWidget == null
              ? Container()
              : TextButton(
                  onPressed: trailingOnTap,
                  child: trailingWidget!,
                ),
        ],
      ),
    );
  }
}
