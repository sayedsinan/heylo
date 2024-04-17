import 'package:chat_app/view/account/account.dart';
import 'package:chat_app/view/home/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';



class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _page = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 50.0,
        items: <Widget>  [
          Icon(Icons.home, size: 30),
          
          Icon(Icons.settings, size: 30),
        ],
        color: Color(0xFF00C3FD),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: buildBody()


    );
  }

    Widget buildBody() {
    switch (_page) {
      case 0:
        return HomePage();
      case 1:
        return MyDetailsScreen();
      
      default:
        return Container();
    }
  }

}
