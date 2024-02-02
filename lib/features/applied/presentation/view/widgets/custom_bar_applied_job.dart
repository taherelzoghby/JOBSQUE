import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/bar_component.dart';
import 'package:jobsque/features/applied/presentation/view_models/applied_job_cubit/applied_job_cubit.dart';

import '../../../../../../core/consts/style.dart';

class CustomBarAppliedJob extends StatefulWidget {
  const CustomBarAppliedJob({super.key});

  @override
  State<CustomBarAppliedJob> createState() => _CustomBarAppliedJobState();
}

class _CustomBarAppliedJobState extends State<CustomBarAppliedJob> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<AppliedJobCubit>(context);
    return Container(
      height: size.height * .06.h,
      width: size.width * .85.w,
      decoration: AppConsts.barDecoration,
      child: Row(
        children: [
          Expanded(
            child: BarComponent(
              title: StringsEn.active,
              color: currentPage == 0
                  ? AppConsts.primary900
                  : AppConsts.neutral200,
              onTap: () {
                setState(() => currentPage = 0);
                bloc.getActiveJobs();
              },
            ),
          ),
          Expanded(
            child: BarComponent(
              title: StringsEn.rejected,
              color: currentPage == 1
                  ? AppConsts.primary900
                  : AppConsts.neutral200,
              onTap: () {
                setState(() => currentPage = 1);
                bloc.getRejectedJobs();
              },
            ),
          ),
        ],
      ),
    );
  }
}
