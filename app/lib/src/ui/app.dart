import 'package:app/src/ui/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'list_members.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Container MyArticles(String imgVal, String Heading, String subHeading) {
    return Container(
      width: 300,
      child: Card(
        child: Wrap(
          children: [
            Image.network(imgVal),
            ListTile(
              title: Text(Heading),
              subtitle: Text(subHeading),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [],
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
              TextButton.icon(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  icon: Icon(Icons.logout),
                  label: const Text("Logout"))
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  MyArticles(
                      "https://bizweb.dktcdn.net/thumb/1024x1024/100/350/935/articles/shop-si-quan-ao.jpg?v=1575430102287",
                      "Heading",
                      "subHeading"),
                  MyArticles(
                      "https://bizweb.dktcdn.net/thumb/1024x1024/100/350/935/articles/shop-si-quan-ao.jpg?v=1575430102287",
                      "Heading",
                      "subHeading"),
                  MyArticles(
                      "https://bizweb.dktcdn.net/thumb/1024x1024/100/350/935/articles/shop-si-quan-ao.jpg?v=1575430102287",
                      "Heading",
                      "subHeading"),
                  MyArticles(
                      "https://bizweb.dktcdn.net/thumb/1024x1024/100/350/935/articles/shop-si-quan-ao.jpg?v=1575430102287",
                      "Heading",
                      "subHeading"),
                  MyArticles(
                      "https://bizweb.dktcdn.net/thumb/1024x1024/100/350/935/articles/shop-si-quan-ao.jpg?v=1575430102287",
                      "Heading",
                      "subHeading")
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 30,
                            childAspectRatio: 1 / 1),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text("aloo"),
                      );
                    }))
          ],
        ));
  }
}
