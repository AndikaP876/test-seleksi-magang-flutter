import 'package:flutter/material.dart';
import 'package:test_magang2/third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String nameFromFirstScreen;

  SecondScreen({required this.nameFromFirstScreen});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = "Selected User Name";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Text('Welcome'),
            Text(
              '${widget.nameFromFirstScreen}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 100,),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '$selectedUserName',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30, right: 10, left: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdScreen(updateSelectedUserName: _updateSelectedUserName),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF2B637B), // Background color of the button
                      minimumSize: Size(double.infinity, 50), // Set width to fit horizontally
                    ),
                    child: Text(
                      'Choose a User',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateSelectedUserName(String userName) {
    setState(() {
      selectedUserName = userName;
    });
  }
}