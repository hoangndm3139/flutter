import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListMember extends StatefulWidget {
  const ListMember({Key? key}) : super(key: key);

  @override
  _ListMemberState createState() => _ListMemberState();
}

class _ListMemberState extends State<ListMember> {
  List<User> users = [];
  Future fetchUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var jsonData = jsonDecode(response.body);
    for (var u in jsonData) {
      User user = User(
          id: u["id"],
          name: u["name"],
          username: u["username"],
          email: u["email"]);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List member"),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
              future: fetchUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(users[i].name ?? ""),
                          leading: Text('${users[i].id}'),
                        );
                      });
                } else {
                  return const Text("error");
                }
              }),
        ),
      ),
    );
  }
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;

  User({this.id, this.name, this.username, this.email});
}
