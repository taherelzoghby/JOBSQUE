import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/consts/style.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({
    super.key,
    required this.flag,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final String flag;
  final String label;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.all(5.sp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25.sp),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? AppConsts.primary500.withOpacity(.15)
                : AppConsts.neutral200.withOpacity(.15),
            borderRadius: BorderRadius.circular(25.sp),
            border: Border.all(
              color: isSelected ? AppConsts.primary500 : AppConsts.neutral300,
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 7.w,vertical: 5.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  flag,
                  height: size.height * .04.h,
                ),
                Text(
                  label,
                  style: AppConsts.style16.copyWith(
                    color: AppConsts.neutral900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
