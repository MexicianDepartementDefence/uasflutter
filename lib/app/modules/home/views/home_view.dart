import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class HomeController extends GetxController {}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  static const List<Color> _backgroundColors = [
    Colors.blue, // Home
    Colors.green, // Tasks
    Colors.yellow, // Add
    Colors.orange, // Services
    Colors.purple, // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _backgroundColors[_selectedIndex],
        elevation: 0,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black, // Set background color to black
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // User Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/profile.jpg'), // Add your profile image asset
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Online Absence',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Change text color to white
                        ),
                      ),
                      // Text(
                      //   'UI/UX Designer',
                      //   style: TextStyle(
                      //       color: Colors.white), // Change text color to white
                      // ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Working Time Card
              Card(
                color: Colors.grey[900], // Dark background for card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('10 Sep 2023',
                              style: TextStyle(color: Colors.white)),
                          Text('02:45 PM',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        '00:04:20 HRS',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text('General 10:00 AM to 06:00 PM',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Work time'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Check out'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Today's Working Hours
              Card(
                color: Colors.grey[900], // Dark background for card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today working hour',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.timer, color: Colors.white),
                              SizedBox(height: 5),
                              Text('09:30:50',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.access_time, color: Colors.white),
                              SizedBox(height: 5),
                              Text('00:40:20',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.timer_off, color: Colors.white),
                              SizedBox(height: 5),
                              Text('04:25:50',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Your Activity
              Card(
                color: Colors.grey[900], // Dark background for card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Activity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        leading: Icon(Icons.login, color: Colors.white),
                        title: Text('Check In',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('10:00 am',
                            style: TextStyle(color: Colors.white)),
                        trailing: Text('On Time',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Divider(color: Colors.white),
                      ListTile(
                        leading:
                            Icon(Icons.breakfast_dining, color: Colors.white),
                        title: Text('Break In',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('12:30 pm',
                            style: TextStyle(color: Colors.white)),
                        trailing: Text('On Time',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
