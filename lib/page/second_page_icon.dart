
import 'package:flutter/material.dart';
import 'package:project/model/comment.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPageIcon extends StatelessWidget {
  final Comment data;
  SecondPageIcon({this.data});

  @over
  }

  String _getDateRange() {
    DateFormat dateFormat = DateFormat('yMMMd');
    String startDate = dateFormat.format(DateTime.parse(data.start));
    String endDate = dateFormat.format(DateTime.parse(data.end));

    return (startDate != endDate) ? '$startDate ~ $endDate' : startDate;
  }

  void _launchUrl() async {
    if (data.link == null) return;

    await canLaunch(data.link)
        ? await launch(data.link)
        : throw Exception('Could not launch ${data.link}');
  }
}
