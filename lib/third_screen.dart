import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_magang2/model/user.dart';

class ThirdScreen extends StatefulWidget {
  final Function(String) updateSelectedUserName;

  ThirdScreen({required this.updateSelectedUserName});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> userList = [];
  int currentPage = 1;
  int perPage = 10;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$currentPage&per_page=$perPage'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> usersData = data['data'];

      setState(() {
        userList.addAll(usersData.map((user) => User.fromJson(user)).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Third Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        )
      ),
      body: userList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                currentPage++;
                userList.clear();
                await fetchData();
              },
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  User user = userList[index];
                  return ListTile(
                    title: Text('${user.first_name} ${user.last_name}'),
                    subtitle: Text(user.email),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    onTap: () {
                      // Update the Selected User Name on the Second Screen
                      widget.updateSelectedUserName(user.first_name);
                      Navigator.pop(context); // Close the ThirdScreen
                    },
                  );
                },
              ),
            ),
    );
  }
}