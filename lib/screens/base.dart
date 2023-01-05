import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/screens/bookmarks/bookmark.dart';
import 'package:projectx/screens/dashboard/dashboard.dart';
import 'package:projectx/screens/profile/account.dart';
import 'package:projectx/screens/project/project.dart';
import 'package:projectx/screens/search/search.dart';

class BaseScreen extends StatefulWidget {
  static const String route = '/basescreen';
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const DashboardScreen(),
    const SearchScreen(),
    const BookmarkScreen(),
    const ProjectScreen(),
    const AccountScreen(),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        iconSize: 22,
        selectedItemColor: AppColor.blackColor,
        unselectedItemColor: AppColor.greyColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
        items: [
          BottomNavigationBarItem(
            icon: BottomIcon(
              icon: Iconsax.home_15,
              isActive: _selectedIndex == 0 ? true : false,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(
              icon: FeatherIcons.search,
              isActive: _selectedIndex == 1 ? true : false,
            ),
            label: 'Gift card',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(
              icon: Icons.bookmark_outline_rounded,
              isActive: _selectedIndex == 3 ? true : false,
            ),
            label: 'settings',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(
              icon: Iconsax.bookmark,
              isActive: _selectedIndex == 2 ? true : false,
            ),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(
              icon: Iconsax.user,
              isActive: _selectedIndex == 3 ? true : false,
            ),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  const BottomIcon({Key? key, required this.icon, this.isActive = false})
      : super(key: key);
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 24,
        ),
        Divider(
          thickness: 2,
          indent: 45,
          endIndent: 45,
          color: isActive ? Colors.white : Colors.transparent,
        )
      ],
    );
  }
}
