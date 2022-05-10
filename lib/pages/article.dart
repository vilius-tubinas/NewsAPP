import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final Article? article;

  const ArticlePage({Key? key, @required this.article}) : super(key: key);

  _launchURL() async {
    final Uri url = Uri.parse(article!.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Read article'),
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article!.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: 30, right: 30, bottom: 10),
            child: Text(
              article!.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: Text(
              "Author: " + article!.author,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 30, right: 30, bottom: 10),
            child: Text(article!.description),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 30, right: 30, bottom: 10),
            child: ElevatedButton(
              onPressed: _launchURL,
              child: const Text('OPEN IN BROWSER'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
