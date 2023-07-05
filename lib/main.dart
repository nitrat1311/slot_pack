import 'package:flutter/material.dart';
import 'package:slot_package/screens/article.dart';
import 'package:slot_package/screens/explore.dart';
import 'package:slot_package/screens/home.dart';
import 'package:slot_package/screens/interest.dart';
import 'package:slot_package/screens/match-detail.dart';
import 'package:slot_package/screens/profile.dart';
import 'package:slot_package/screens/splash.dart';
import 'package:slot_package/theme/index.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: "Sport App",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: getTheme(),
      routes: {
        "/": (_) => const SplashScreen(),
        "/interest": (_) => InterestScreen(),
        "/home": (_) => HomeScreen(),
        '/match': (_) => MatchDetailScreen(),
        '/explore': (_) => ExploreScreen(),
        '/profile': (_) => ProfileScreen(),
        '/article': (_) => ArticleDetail()
      },
      initialRoute: "/",
    ));
  }
}
