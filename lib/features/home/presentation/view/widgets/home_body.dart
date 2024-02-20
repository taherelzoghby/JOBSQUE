import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/home/presentation/view/widgets/recent_jop_section.dart';
import 'package:jobsque/features/home/presentation/view/widgets/suggested_jop_section.dart';
import 'package:jobsque/features/home/presentation/view_models/home_bloc/home_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/widgets/footer_smart_refresh.dart';
import '../../../../../core/widgets/header_smart_refresh.dart';
import 'home_top_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.name});

  final String name;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void _onRefresh() async {
    // monitor network fetch
    BlocProvider.of<HomeBloc>(context).add(GetJobsEvent());
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      header: const HeaderSmartRefresh(),
      footer: const FooterSmartRefresh(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///Home top section
          HomeTopSection(name: widget.name),

          ///if apply jop
          //SectionAppliedJop(),

          ///suggested jop section
          const SuggestedJopSection(),

          ///recent jop section
          const RecentJopSection(),
        ],
      ),
    );
  }
}
