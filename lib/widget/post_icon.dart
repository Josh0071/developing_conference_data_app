import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/fetch_list.dart';
import 'package:project/model/comment.dart';
import 'package:project/page/second_page.dart';
import 'package:project/page/second_page_icon.dart';

class PostIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conferences',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
      ),
      body: FutureBuilder<List<Comment>>(
        future: fetchList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          List<Comment> list = snapshot.data;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              Comment data = list[index];
              return SecondPage(
                title: data.name,
                body: data.location,
                onTap: () {
                 final Comment comment = data;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPageIcon(data: comment)),
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
