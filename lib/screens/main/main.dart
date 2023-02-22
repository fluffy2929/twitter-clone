import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/auth/service.dart';
import 'package:twitter_clone/screens/auth/signin.dart';
import 'pages.dart';
import 'package:twitter_clone/data/current_user.dart';

import 'package:twitter_clone/screens/search/search.dart';
import 'package:twitter_clone/screens/home/home.dart';
import 'package:twitter_clone/screens/drawer/drawer.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final List<PageItem> pageList = [
    PageItem("Home", const Home(), const Icon(Icons.home_filled),
        const Icon(Icons.home_filled)),
    PageItem("Search", const SearchPage(), const Icon(Icons.search),
        const Icon(Icons.search)),
    PageItem("Notifications", const Home(), const Icon(Icons.notifications),
        const Icon(Icons.notifications_outlined)),
    PageItem("Messages", const Home(), const Icon(Icons.mail),
        const Icon(Icons.mail_outline))
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerPage(),
        backgroundColor: const Color(0xff141d26),
        appBar: AppBar(
          backgroundColor: const Color(0xff141d26),
          elevation: 0,
          leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    image: DecorationImage(
                        image: NetworkImage(User.currentUser.photo),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
          title: Image.asset("assets/twitter.png", height: 20.0),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.logout_outlined,
                  size: 25.0,
                ),
                onPressed: () {
                  AuthenticationService()
                      .signOut()
                      .then((_) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()),
                          ));
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Material(
          elevation: 2,
          color: const Color.fromRGBO(21, 32, 43, 1),
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                border:
                    Border(top: BorderSide(width: 0.1, color: Colors.white))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    pageList.length,
                    (index) => SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 4,
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                            },
                            child: selected == index
                                ? pageList[index].selectedIcon
                                : pageList[index].unselectedIcon,
                          ),
                        ))),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Logout',
          child: const Center(
            child: Icon(CupertinoIcons.add),
          ),
        ),
        body: pageList[selected].body);
  }
}
