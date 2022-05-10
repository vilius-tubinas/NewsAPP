import 'package:flutter/material.dart';

import 'package:visma_app/models/article_model.dart';
import 'package:visma_app/services/news_service.dart';

import 'Assets/card_builder.dart';
import 'Assets/nav_drawer.dart';

/* I would like to give credit to this tutorial that helped me immensly: https://nabendu82.medium.com/flutter-news-app-using-newsapi-2294c2dcf673

The source files are split up into folders:
-pages:
Includes other pages, besides homepage that the app uses
-models:
Basically includes the datatypes borrowed from the tutorial
-assets:
widgets and classes that are used
-services:
handling the different API sevices, in this case just newsAPI
 
The app currently is able to query the API for news, parse that and display the 
elements as cards. In the drawer menu one is able to select the different topics,
which cause a reload of the homepage to only show the requested articles. 
The homepage can also be reloaded with a drag motion or by clicking the floating
button with the arrow icon. 
 
Furthermore, the application is able to display inner pages for all of the articles
and, at least for android, open them in a web browser. 

Overall, I feel like the project worked out quite well, but there is of course
room for improvement. Few things that I did not have time to improve:
- Liked articles feature
- Handling the news entries which do not have a link
- Title of the app change depending on category
- More thorough use of theme styles

Also, I did not test the functionality on IOS devices, only android, but I'm
counting on flutter to do it's thing!

 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsApp',
      theme: ThemeData(
        //General
        brightness: Brightness.light,

        //Colors
        primarySwatch: Colors.amber,
        primaryColor: Colors.black,
        fontFamily: 'Gill Sans',
        scaffoldBackgroundColor: Colors.grey[300],

        //Text
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          subtitle1: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 114, 114, 114)),
        ),
      ),
      home: const MyHomePage(title: 'Articles'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article>? headlines;
  int initialized = 0;
  String? current_category = null;

  Future refreshHeadlines(String? category) async {
    List<Article> newheadlines = await updateHeadlines(category);
    setState(() {
      headlines = newheadlines;
      current_category = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (initialized == 0) {
      //Check if we initialized the articles and if we did not, do it now
      refreshHeadlines(current_category);
      initialized = 1;
    }
    return Scaffold(
      drawer: NavBar(refreshHeadlines),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
      ),

      body: RefreshIndicator(
        onRefresh: () async => await refreshHeadlines(current_category),
        child: buildCards(context, headlines),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async => await refreshHeadlines(current_category),
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
