import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/main/pages/home/view/home_page.dart';
import 'package:flutter_app/presentation/main/pages/notifications/view/notififcations_page.dart';
import 'package:flutter_app/presentation/main/pages/search/view/search_page.dart';
import 'package:flutter_app/presentation/main/pages/settings/view/settings_page.dart';
import 'package:flutter_app/presentation/resources/other_managers/color_manager.dart';
import 'package:flutter_app/presentation/resources/other_managers/strings_manager.dart';
import 'package:flutter_app/presentation/resources/values_manager/app_size.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const NotificationsPage(),
    const SettingsPage()
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.notifications,
    AppStrings.settings,
  ];

  var _title = AppStrings.home;
  var _currentIndex = 0;
  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            _title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightGrey,
                spreadRadius: AppSize.s1,
              ),
            ],
          ),
          child: BottomNavigationBar(
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: ColorManager.grey,
            currentIndex: _currentIndex,
            onTap: onTap,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: AppStrings.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: AppStrings.search,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: AppStrings.notifications,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppStrings.settings,
              ),
            ],
          ),
        ),
        body: pages[_currentIndex],
      );
    });
  }
}
