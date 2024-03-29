import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/help_center/presentation/view/widgets/what_can_we_help_widget.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'custom_help_center_info.dart';

class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(
            homePath,
            extra: 4,
          ),
          title: StringsEn.helpCenter,
          trailingWidget: Container(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //What can we help?
        const WhatCanWeHelpWidget(),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //CustomHelpCenterInfo
        const CustomHelpCenterInfo(),
      ],
    );
  }
}
