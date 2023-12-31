import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/features/home/presentation/view/widgets/apply_jop_widget.dart';
import 'package:jobsque/features/home/presentation/view/widgets/recent_jop_section.dart';
import 'package:jobsque/features/home/presentation/view/widgets/suggested_jop_section.dart';

import 'home_top_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(height: size.height * .03.h),

        ///Home top section
        HomeTopSection(),

        ///if apply jop
        SectionAppliedJop(),

        ///suggested jop section
        SuggestedJopSection(),

        ///recent jop section
        RecentJopSection(),
      ],
    );
  }
}
