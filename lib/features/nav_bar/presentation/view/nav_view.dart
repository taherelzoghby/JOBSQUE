import 'package:flutter/material.dart';
import 'package:jobsque/features/applied/presentation/view/applied_view.dart';
import 'package:jobsque/features/home/presentation/view/home_view.dart';
import 'package:jobsque/features/messages/presentation/view/messages_view.dart';
import 'package:jobsque/features/nav_bar/presentation/view/widgets/bottom_nav_bar_body.dart';
import 'package:jobsque/features/saved/presentation/view/saved_view.dart';

import '../../../profile/presentation/view/profile_view.dart';

class NavView extends StatefulWidget {
  const NavView({super.key, this.currentPage = 0});

  final int currentPage;

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  late int currentIndex;

  List<Widget> screens = [
    const HomeView(), //0
    const MessagesView(), //1
    const AppliedView(), //2
    const SavedView(), //3
    const ProfileView(), //4
  ];

  @override
  void initState() {
    currentIndex = widget.currentPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: bottomNavBarBody(
        currentIndex: currentIndex,
        onTap: (int indexPage) => setState(() => currentIndex = indexPage),
      ),
    );
  }
}
