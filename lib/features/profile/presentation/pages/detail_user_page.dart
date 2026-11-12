import 'package:flutter/material.dart';

class DetailUserPage extends StatelessWidget {
  const DetailUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail User')),
      body: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(radius: 30, backgroundColor: Colors.grey),
              Text("ID "),
              Text("FullName"),
              Text("Email"),
            ],
          ),
        ),
      ),
    );
  }
}
