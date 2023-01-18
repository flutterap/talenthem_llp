import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenthem_llp/screens/home/homeScreen.dart';
import 'package:talenthem_llp/screens/settings/settingsScreen.dart';
import 'package:talenthem_llp/theme/app_theme.dart';
import 'package:talenthem_llp/widgets/drawer.dart';
import '../../widgets/application_app_bar.dart';

class BasicDashboardScreen extends StatefulWidget {
  const BasicDashboardScreen({super.key});

  @override
  State<BasicDashboardScreen> createState() => _BasicDashboardScreenState();
}

class _BasicDashboardScreenState extends State<BasicDashboardScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = <Widget>[
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    SettingsScreen(),
  ];
  List<String> _titles = ["home", "wallet", "add", "chat", "settings"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar(
          context: context,
          appBarTitle: _titles.elementAt(_selectedIndex).tr,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'notification',
              onPressed: () {
                // handle the press
              },
            ),
          ]),
      drawer: DrawerLayout(),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: AppTheme.isLightTheme.value
              ? Color(0xFFF5F5F5)
              : Color(0xFF242831),
          currentIndex: _selectedIndex,
          selectedItemColor: AppTheme.primaryColor,
          unselectedItemColor: AppTheme.textColorDark,
          iconSize: 40,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          elevation: 5,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wallet,
              ),
              label: 'wallet'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: ''.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'message'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings'.tr,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Obx(
          //   () => Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         fit: BoxFit.fill,
          //         image: AppTheme.isLightTheme.value
          //             ? AssetImage('assets/background_light.png')
          //             : AssetImage('assets/background.png'),
          //       ),
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.all(10.r),
              child: Column(
                children: [
                  _pages.elementAt(_selectedIndex),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
