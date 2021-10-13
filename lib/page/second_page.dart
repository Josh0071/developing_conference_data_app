import 'package:flutter/material.dart';

class PostIconContents extends StatelessWidget {
  final String? title;
  final String? body;
  final Function()? onTap;

  PostIconContents({this.title, this.body, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 5,
            child: Container(
              height: 50,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Text(body!),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
