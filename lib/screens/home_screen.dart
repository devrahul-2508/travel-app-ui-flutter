import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/widgets/destination_carousel.dart';
import 'package:travel_app_ui/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  Widget buildIcon(int index) {
    return GestureDetector(
      onTap: () => setState(() {
        selectedIndex = index;
        print(selectedIndex);
      }),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          icons[index],
          size: 25.0,
          color: selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              "What would you like to find?",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIcon(0),
              buildIcon(1),
              buildIcon(2),
              buildIcon(3),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          DestinationCarousel(),
          SizedBox(
            height: 20.0,
          ),
          HotelCarousel()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _currentTab = value;
            });
          },
          currentIndex: _currentTab,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_pizza,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 15.0,
                  backgroundImage:
                      NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
                ),
                label: "")
          ]),
    );
  }
}
