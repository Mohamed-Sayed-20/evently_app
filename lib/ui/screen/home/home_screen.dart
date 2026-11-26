import 'package:evently_app/ui/screen/home/taps/favorite/favorite_tap.dart';
import 'package:evently_app/ui/screen/home/taps/home/home_tap.dart';
import 'package:evently_app/ui/screen/home/taps/profile/profile_tap.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/size_utils.dart';
import '../../../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tapsList = [HomeTap(), FavoriteTap(), ProfileTap()];

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          _buildBottomNavigationItem(
            selectedIcon: Icon(Icons.home_rounded),
            unSelectedIcon: Icon(Icons.home_outlined),
            isSelected: selectedIndex == 0,
            label: AppLocalizations.of(context)!.home,
          ),
          _buildBottomNavigationItem(
            selectedIcon: Icon(Icons.favorite),
            unSelectedIcon: Icon(Icons.favorite_border_outlined),
            isSelected: selectedIndex == 1,
            label: AppLocalizations.of(context)!.favorite,
          ),
          _buildBottomNavigationItem(
            selectedIcon: Icon(Icons.person),
            unSelectedIcon: Icon(Icons.person_2_outlined),
            isSelected: selectedIndex == 2,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: tapsList[selectedIndex],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo: Navigate to add event screen
          Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
        },
        child: Icon(Icons.add, color: AppColors.whiteColor, size: 25),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationItem({
    required Widget selectedIcon,
    required Widget unSelectedIcon,
    required bool isSelected,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: isSelected ? selectedIcon : unSelectedIcon,
      label: label,
    );
  }
}
