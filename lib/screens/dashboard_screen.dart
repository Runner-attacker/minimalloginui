import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginui/screens/login_screen.dart';

import 'package:loginui/screens/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var username = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.person,
                  size: 100,
                ),
                Text((username?.email ?? ""))
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(Icons.home),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "H O M E",
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SettingScreen();
                },
              ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(Icons.settings),
                  SizedBox(
                    width: 50,
                  ),
                  Text("S E T T I N G S")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 300,
          ),
          InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) {
                  return false;
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 53.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Icon(Icons.logout),
                  SizedBox(
                    width: 50,
                  ),
                  Text("L O G O U T")
                ],
              ),
            ),
          ),
        ],
      )),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "H O M E",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
