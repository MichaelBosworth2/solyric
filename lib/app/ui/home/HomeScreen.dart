import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solyric_app/app/ui/ChordInfo/ChordInformationScreen.dart';
import 'package:solyric_app/app/ui/profile/ProfileScreen.dart';
import 'package:solyric_app/app/ui/search/SearchScreen.dart';
import 'package:solyric_app/app/ui/wall/WallScreen.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screenItems = [
    WallScreen(),
    SearchScreen(),
    ChordInformationScreen(),
    ProfileScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = SwiperController();
    return Scaffold(
      appBar: UIHelper.commonAppBar(context, backButton: false),
      body: Swiper(
        itemBuilder: (context, index) => screenItems[index],
        itemCount: screenItems.length,
        controller: controller,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Resources.IC_EXPLORE, color: Colors.grey),
            title: Text(Resources.EXPLORE),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Resources.IC_SEARCH, color: Colors.grey),
            title: Text(Resources.SEARCH),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Resources.IC_CHORDS, color: Colors.grey),
            title: Text(Resources.CHORDS),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Resources.IC_ACCOUNT, color: Colors.grey),
            title: Text(Resources.ACCOUNT),
          )
        ],
        onTap: (position) => controller.move(position, animation: true),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, RouteNames.HOME),
        child: SvgPicture.asset(Resources.IC_PLUS),
      ),
    );
  }
}
