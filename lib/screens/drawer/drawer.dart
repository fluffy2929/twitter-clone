import 'package:flutter/material.dart';
import 'package:twitter_clone/data/current_user.dart';
import 'package:twitter_clone/screens/profile/profile.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              _currentUserInfo(context),
              ListTile(
                title: const Text("Profile"),
                leading: const Icon(Icons.person_outline),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ProfilePage()));
                },
              ),
              const ListTile(
                leading: Icon(Icons.topic_outlined),
                title: Text("Topics"),
              ),
              const ListTile(
                leading: Icon(Icons.bookmark_outline),
                title: Text("Bookmarks"),
              ),
              const ListTile(
                leading: Icon(Icons.list_alt),
                title: Text("Lists"),
              ),
              const ListTile(
                leading: Icon(Icons.person_outline),
                title: Text("Twitter Circle"),
              ),
              const Divider(),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.rocket_launch),
                title: Text("Twitter for professionals"),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting and privacy"),
              ),
              const ListTile(
                leading: Icon(Icons.help_outline_sharp),
                title: Text("Help center"),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.dark_mode_outlined),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _currentUserInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()));
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(User.currentUser.photo),
              radius: 24,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(User.currentUser.name,
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(
            height: 8,
          ),
          Text(
            "@${User.currentUser.userName}",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "20 ", style: Theme.of(context).textTheme.subtitle1),
              TextSpan(
                  text: "following",
                  style: Theme.of(context).textTheme.subtitle2),
              TextSpan(
                  text: "   90 ", style: Theme.of(context).textTheme.subtitle1),
              TextSpan(
                  text: "followers",
                  style: Theme.of(context).textTheme.subtitle2)
            ])),
          )
        ],
      ),
    );
  }
}
