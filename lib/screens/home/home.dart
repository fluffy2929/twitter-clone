import 'package:flutter/material.dart';

import 'package:twitter_clone/data/tweets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141d26),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (BuildContext context, int index) {
          return tweets[index];
        },
      ),
    );
  }
}
