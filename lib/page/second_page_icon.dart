import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/model/comment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class SecondPageIcon extends StatelessWidget {
  final Comment data;
  SecondPageIcon({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.location,
                  style: TextStyle(fontSize: 45),
                ),
                const SizedBox(height: 16),
                Text(_getDateRange(),
                  style: TextStyle(
                      fontSize: 18
                  ),),
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10 ,right: 10),
                  child: Card(
                    color: Colors.grey,
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Container(
                      height: 42,
                      width: 280,
                      child: TextButton(
                        onPressed: _launchUrl,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          'Go to official website',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getDateRange() {
    DateFormat dateFormat = DateFormat('yMMMd');
    String startDate = dateFormat.format(DateTime.parse(data.start));
    String endDate = dateFormat.format(DateTime.parse(data.end));

    return (startDate != endDate) ? '$startDate ~ $endDate' : startDate;
  }

  void _launchUrl() async {
    await canLaunch(data.link);
  }
}
