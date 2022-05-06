import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_app/api/get_api_data.dart';
import 'package:tmdb_app/custom_icons/nav_bar_icons_icons.dart';
import 'package:tmdb_app/provider/auth_provider.dart';
import 'package:tmdb_app/ui/fav_films.dart';
import 'package:tmdb_app/ui/languages.dart';
import 'package:tmdb_app/ui/movies.dart';

class MainScreens extends StatefulWidget {
  MainScreens({Key? key}) : super(key: key);

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(228, 255, 255, 1),
      body: IndexedStack(index: _page, children: [FavMovies(), Movies(), const Languages()]),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        color: const Color.fromRGBO(131, 215, 220, 1),
        backgroundColor: Colors.transparent,
        index: _page,
        items: const [Icon(NavBarIcons.live_tv), Icon(NavBarIcons.heart), Icon(Icons.language_outlined)],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
