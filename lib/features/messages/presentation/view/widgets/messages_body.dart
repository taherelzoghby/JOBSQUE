import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/section_filter_messages.dart';
import 'package:jobsque/features/messages/presentation/view/widgets/section_messages.dart';
import '../../../../../core/consts/routesPage.dart';
import 'package:jobsque/core/consts/style.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),

        //custom appBar
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pushReplacement(
            homePath,
            extra: 0,
          ),
          title: StringsEn.messages,
          trailingWidget: Container(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        const SectionFilteringMessages(),
        const AspectRatio(aspectRatio: AppConsts.aspect40on1),
        //messages
        const SectionMessages(),
      ],
    );
  }
}
