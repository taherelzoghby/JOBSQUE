import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/component_empty.dart';

class CustomLoadingRecentJob extends StatelessWidget {
  const CustomLoadingRecentJob({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: AspectRatio(
        aspectRatio: AppConsts.aspect13on5,
        child: Container(
          decoration: AppConsts.decorationNeutral300border16,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: size.height * .025.h,
                      backgroundColor: AppConsts.neutral400,
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ComponentEmpty(
                          width: size.width * .4.w,
                          height: size.height * .01.h,
                        ),
                        SizedBox(height: size.height * .01.h),
                        ComponentEmpty(
                          width: size.width * .4.w,
                          height: size.height * .01.h,
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ComponentEmpty(height: size.height * .03.h),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ComponentEmpty(height: size.height * .03.h),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ComponentEmpty(height: size.height * .03.h),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}