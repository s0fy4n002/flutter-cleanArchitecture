import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllUserPage extends StatelessWidget {
  const AllUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All User')),
      body: ListView.builder(
        itemCount: 10, // Replace with your actual user count
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              // Navigator.of(
              //   context,
              // ).push(MaterialPageRoute(builder: (context) => DetailUserPage()));
              context.pushNamed("detail_user");
            },
            title: Text("User ${index + 1}"),
          );
        },
      ),
    );
  }
}
