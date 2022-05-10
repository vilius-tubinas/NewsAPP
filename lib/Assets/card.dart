import 'package:flutter/material.dart';
import 'package:visma_app/models/article_model.dart';

import '../pages/article.dart';

Widget cardCustom(BuildContext context, Article article) {
  return Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    elevation: 0,
    margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
    child: Column(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
            image: DecorationImage(
              image: NetworkImage(article.urlToImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(top: 20.0, right: 30, left: 30),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              article.title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          subtitle: Text(
            "Author: " + article.author,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.only(bottom: 20.0, right: 30, left: 30),
          trailing: const Icon(
            Icons.favorite,
            size: 35.0,
            color: Colors.black,
          ),
          leading: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticlePage(article: article)),
              );
            },
            child: const Text('READ MORE'),
          ),
        ),
      ],
    ),
  );
}
