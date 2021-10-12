import 'package:flutter/material.dart';

import 'list_members.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Icon(
                Icons.flutter_dash,
                size: 50,
              ),
            ),
            ListTile(
              title: const Text('Members'),
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ListMember()));
              },
            ),
            ListTile(
              title: const Text('Timekeeping'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
