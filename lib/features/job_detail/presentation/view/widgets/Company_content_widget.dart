import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/item_contact_us_widget.dart';

class CompanyContentWidget extends StatelessWidget {
  const CompanyContentWidget({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(aspectRatio:AppConsts.aspect16on1),

          //contact us
          Text(
            StringsEn.contactUs,
            style: AppConsts.style14.copyWith(
              color: AppConsts.neutral900,
            ),
          ),
          const AspectRatio(aspectRatio:AppConsts.aspect40on1),
          Row(
            children: [
              Expanded(
                child: ItemContactUsWidget(
                  keyT: StringsEn.email,
                  value: job.compEmail!,
                ),
              ),
              SizedBox(width: size.width * .02.w),
              Expanded(
                child: ItemContactUsWidget(
                  keyT: StringsEn.website,
                  value: job.compWebsite!,
                ),
              ),
            ],
          ),
          const AspectRatio(aspectRatio:AppConsts.aspect16on1),
          //about company
          Text(
            StringsEn.aboutCompany,
            style: AppConsts.style14.copyWith(
              color: AppConsts.neutral900,
            ),
          ),
          const AspectRatio(aspectRatio:AppConsts.aspect40on1),

          Text(job.aboutComp!, style: AppConsts.style12),
        ],
      ),
    );
  }
}
