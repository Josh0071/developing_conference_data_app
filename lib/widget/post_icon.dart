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
          List<Comment> list = snapshot.data;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              Comment data = list[index];
              return SecondPage(
                title: data.name,
                body: data.location,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context,Comment comment) => SecondPageIcon(data: comment)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
