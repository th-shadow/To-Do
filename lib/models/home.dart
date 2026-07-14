import 'package:flutter/material.dart';

import 'package:todo/widgets/header_widget.dart';
import 'package:todo/widgets/tabs_widget.dart';
import 'package:todo/widgets/card_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final isChanged = await Navigator.pushNamed(context, "/new_task");
          if (isChanged == true) {
            setState(() {});
          }
        },
        shape: CircleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigoAccent,
        child: Text(
          '+',
          style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w400),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(9.0),
          child: Column(
            children: [
              // Home header
              HomeHeader(),

              SizedBox(height: 15.0),

              // Home Tabs
              HomeTabs(
                tabIndex: tabIndex,
                onTabChanged: (index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
              ),

              SizedBox(height: 15.0),

              // Cards
              Cards(
                tabIndex: tabIndex,
                onChanged: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
