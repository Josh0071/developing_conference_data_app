import 'package:flutter/material.dart';
import 'package:project/fetch_list.dart';
import 'package:project/model/comment.dart';
import 'package:project/page/second_page.dart';
import 'package:project/page/second_page_icon.dart';

class PostIcon extends StatelessWidget {
  const PostIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conferences'),
      ),
      body: FutureBuilder<List<Comment>>(
        future: fetchList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('no data'));
          }

          List<Comment> list = snapshot.data;
          return ListView.separated(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              Comment data = list[index];
              return SecondPage(
                title: data.name,
                body: data.location,
                onTap: () {
                  openDetailScreen(context, data);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          );
        },
      ),
    );
  }

  void openDetailScreen(BuildContext context, Comment conference) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SecondPageIcon(data: conference)),
    );
  }
}
