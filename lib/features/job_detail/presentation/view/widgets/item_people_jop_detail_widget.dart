import 'package:flutter/material.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';

class ItemPeopleDetailJobWidget extends StatelessWidget {
  const ItemPeopleDetailJobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.allPadding8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(StringsEn.personImage),
          //name-position
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringsEn.personName,
                style: AppConsts.style14.copyWith(
                  color: AppConsts.neutral900,
                ),
              ),
              Text(
                StringsEn.personPosition,
                style: AppConsts.style12.copyWith(
                  color: AppConsts.neutral500,
                ),
              ),
            ],
          ),
          //work-during
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                StringsEn.workDuring,
                style: AppConsts.style12.copyWith(
                  color: AppConsts.neutral500,
                ),
              ),
              Text(
                '4 Years',
                style: AppConsts.style12.copyWith(
                  color: AppConsts.primary500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
