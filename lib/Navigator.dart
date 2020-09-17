import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 1;
  Color _selectedColor = Colors.white;
  static Color _unselectedColor = Colors.black;

  List<Widget> items = [
    NavigationItem(
      iconData: Icons.home,
      color: _unselectedColor,
    ),
    NavigationItem(
      iconData: Icons.add_alert,
      color: _unselectedColor,
    ),
    NavigationItem(
      iconData: Icons.favorite_border,
      color: _unselectedColor,
    )
  ];

  Widget makeNavigationItem(NavigationItem widget, int index) {
    if (index == _selectedIndex) {
      return SelectedNavigator(
          widget: NavigationItem(
        color: _selectedColor,
        iconData: widget.iconData,
      ));
    } else {
      return GestureDetector(
        onTap: (){
          setState(() {
            _selectedIndex = index;
          });
        },
        child: widget,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.125,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(items.length,
                  (index) => makeNavigationItem(items[index], index))),
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  Color color;
  IconData iconData;
  NavigationItem({this.iconData, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(iconData, color: color, size: 25),
    );
  }
}

class SelectedNavigator extends StatelessWidget {
  final Widget widget;
  const SelectedNavigator({this.widget});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      transform: Matrix4.translationValues(0, -40, 0),
      child: Container(
        child: widget,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.red],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                blurRadius: 16.0,
                color: Colors.blue.withAlpha(60),
                spreadRadius: 16.0,
                offset: Offset(0.0, 0.3)
              ),
            ]),
      ),
    );
  }
}
