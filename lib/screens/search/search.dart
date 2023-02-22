import 'package:flutter/material.dart';
import 'package:twitter_clone/data/topics.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  CustomScrollView _body(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[_trendingTopicAppBar(), _trendingTopicList(context)],
    );
  }

  SliverAppBar _trendingTopicAppBar() {
    return const SliverAppBar(
      pinned: true,
      leading: SizedBox(),
      leadingWidth: 0,
      title: Text("Trending Topics"),
    );
  }

  SliverList _trendingTopicList(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(List.generate(
            TrendingTopic.trendingTopics.length,
            (index) => _trendingTopicItem(index, context))));
  }

  ListTile _trendingTopicItem(int index, BuildContext context) {
    return ListTile(
      title: Text(
        TrendingTopic.trendingTopics[index].location,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(TrendingTopic.trendingTopics[index].title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5)),
          ),
          Text(
            TrendingTopic.trendingTopics[index].tweetCount,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
      trailing: const Icon(
        Icons.more_vert,
        color: Colors.grey,
      ),
    );
  }
}
