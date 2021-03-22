import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:interintel/views/design.dart';
import 'package:interintel/views/dictionary.dart';
import 'package:interintel/views/info.dart';
import 'package:interintel/views/response.dart';

class BottomMenuSelector extends StatefulWidget {
  @override
  _BottomMenuSelectorState createState() => _BottomMenuSelectorState();
}

class _BottomMenuSelectorState extends State<BottomMenuSelector> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Info(),
    Design(),
    Response(),
    Dictionary()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: GNav(
                tabBackgroundGradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xfffbb448), Color(0xfff7892b)]),
                rippleColor: Colors.grey[300],
                hoverColor: Colors.blue[100],
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 300),
                tabs: [
                  GButton(
                    icon: Icons.app_registration,
                    text: 'Info',
                  ),
                  GButton(
                    icon: Icons.design_services,
                    text: 'Design',
                  ),
                  GButton(
                    icon: Icons.api,
                    text: 'Response',
                  ),
                  GButton(
                    icon: Icons.sort,
                    text: 'Dictionary',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
