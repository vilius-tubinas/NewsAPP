import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'card.dart';

Widget buildCards(BuildContext context, List<Article>? headlines) {
  if (headlines == null) {
    return const Center(
      child: Text("Loading..."),
    );
  } else {
    return ListView.builder(
      itemCount: headlines.length,
      itemBuilder: (context, index) => cardCustom(context, headlines[index]),
    );
  }
}
