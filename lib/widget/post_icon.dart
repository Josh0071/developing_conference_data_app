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
        title: const Text(
          'Conferences',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: fetchList(),
        initialData: [],
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('에러가 발생했습니다');
          }

          if (!snapshot.hasData) {
            return Text('데이터가 없습니다');
          }
          List<Comment> list = snapshot.data;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              Comment data = list[index];
              return PostIconContents(
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
