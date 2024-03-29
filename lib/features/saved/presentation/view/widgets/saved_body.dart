import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/custom_app_bar.dart';
import 'package:jobsque/features/saved/presentation/view/widgets/section_saved_jop_smart_refresh.dart';
import 'package:jobsque/core/consts/style.dart';

class SavedBody extends StatelessWidget {
  const SavedBody({super.key});

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
          title: StringsEn.saved,
          trailingWidget: Container(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspect16on1),
        //saved jops
        Expanded(
          child: const SectionSavedJobsSmartRefresh(),
        ),
      ],
    );
  }
}
