import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import 'package:jobsque/features/splash/presentation/view/widgets/splash_body.dart';

import '../../../../core/consts/strings.dart';
import '../../../../core/helper/cache_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToBoarding();
    super.initState();
  }

  ///navigate to board
  navigateToBoarding() {
    Future.delayed(
      Duration(seconds: 3),
      () => GoRouter.of(context).pushReplacement(
        checkLoggedIn() ? homePath : onBoardingPath,
        extra: 0,
      ),
    );
  }

  ///check log in or not
  checkLoggedIn() {
    String? token = CacheHelper.getData(key: StringsEn.token);
    return token == null ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SplashBody(),
      ),
    );
  }
}
