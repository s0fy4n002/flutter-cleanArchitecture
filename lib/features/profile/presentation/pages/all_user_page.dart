import 'package:flutter/material.dart';

class AllUserPage extends StatelessWidget {
  const AllUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All User')),
      body: ListView.builder(
        itemCount: 10, // Replace with your actual user count
        itemBuilder: (context, index) {
          return Text("User $index"); // Replace with your actual user data
        },
      ),
    );
  }
}
