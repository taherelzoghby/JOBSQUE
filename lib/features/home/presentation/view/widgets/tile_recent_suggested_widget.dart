
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class TileRecentOrSuggested extends StatelessWidget {
  const TileRecentOrSuggested({
    super.key,
    required this.label,
    required this.onTapViewAll,
  });

  final String label;
  final void Function() onTapViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, right: 15.h, left: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppConsts.style32.copyWith(fontSize: 18),
          ),
          TextButton(
            onPressed: onTapViewAll,
            child: Text(
              StringsEn.viewAll,
              style: AppConsts.style14.copyWith(
                color: AppConsts.primary500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
