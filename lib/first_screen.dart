import 'package:flutter/material.dart';
import 'package:test_magang2/second_screen.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/background 1.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(right: 30, left: 30),
            child: Column(      
              children: [
                const SizedBox(height: 200,),
                Image.asset(
                  'images/ic_photo.png',
                ),
                const SizedBox(height: 60,),
                TextField(
                  controller: nameController, 
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.grey
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255), // Background color
                  ),
                ),
                const SizedBox(height: 30,),
                TextField(
                  controller: sentenceController, 
                  decoration: InputDecoration(
                    labelText: 'Sentence',
                    labelStyle: TextStyle(
                      color: Colors.grey
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255), // Background color
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => checkPalindrome(context), 
                    child: Text(
                      'CHECK',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2B637B), // Background color
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(nameFromFirstScreen: nameController.text), // Pass the name from the first screen
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2B637B), // Background color
                  ),
                  child: Text(
                    'NEXT',
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkPalindrome(BuildContext context) {
    String sentence = sentenceController.text.toLowerCase().replaceAll(' ', '');
    bool isPalindrome = sentence == sentence.split('').reversed.join('');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Palindrome Check'),
          content: Text(isPalindrome ? 'isPalindrome' : 'not palindrome'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}