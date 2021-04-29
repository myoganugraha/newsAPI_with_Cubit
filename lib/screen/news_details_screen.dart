import 'package:flutter/material.dart';
import 'package:news_api_with_cubit/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsModel newsModel;
  NewsDetailsScreen({Key key, @required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        actions: [
          IconButton(
              onPressed: () {
                _launchURL(newsModel.url);
              },
              icon: Icon(Icons.open_in_browser))
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image(image: NetworkImage(newsModel.urlToImage)),
            ),
            SizedBox(height: 12),
            Text(
              newsModel.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Text("${newsModel.author} - ${newsModel.source.name}"),
            SizedBox(height: 20),
            Text(newsModel.content ?? '')
          ],
        ),
      ),
    );
  }

  _launchURL(String urlTarget) async {
    String url = urlTarget;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
