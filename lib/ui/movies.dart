import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_app/api/get_api_data.dart';
import 'package:tmdb_app/custom_icons/nav_bar_icons_icons.dart';
import 'package:tmdb_app/models/pop_movies.dart';
import 'package:tmdb_app/provider/auth_provider.dart';
import 'package:tmdb_app/provider/provider_crud.dart';

// Functions

void addElementToFirebase(
    BuildContext context, imagePath, overview, filmTitle, date, voteAverage) {
  Provider.of<CrudProvider>(context, listen: false)
      .addElement(imagePath, overview, filmTitle, date, voteAverage);
}

// Functions

class Movies extends StatefulWidget {
  Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    final getApiProvider = Provider.of<GetApiData>(context);

    return Scaffold(
        backgroundColor: const Color.fromRGBO(228, 255, 255, 1),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            const TopNavBar(),
            Padding(
                padding: const EdgeInsets.only(
                  right: 23,
                  left: 23,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(111, 187, 192, 1)),
                              onPressed: () {
                                Provider.of<FirebaseAuthProvider>(context,
                                        listen: false)
                                    .signOut(context);
                                Navigator.pushNamed(context, '/');
                              },
                              child: Text(AppLocalizations.of(context)!.log_out,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(1, 69, 73, 1),
                                      fontSize: 16,
                                      fontFamily: 'Handjet')))),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromRGBO(111, 187, 192, 1)),
                            onPressed: () {
                              getApiProvider.parsePopularMovies();
                            },
                            child: Text(AppLocalizations.of(context)!.reload,
                                style: const TextStyle(
                                    color: Color.fromRGBO(1, 69, 73, 1),
                                    fontSize: 16,
                                    fontFamily: 'Handjet')))),
                  ],
                )),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: getApiProvider.moviesList.length,
                itemBuilder: (context, index) {
                  return MovieListSender(
                      index: index,
                      movies: getApiProvider.moviesList,
                      child: const ContainerWithContent());
                }),
            const SizedBox(
              height: 25,
            )
          ]),
        ));
  }
}

// Content Widget

class ContainerWithContent extends StatefulWidget {
  const ContainerWithContent({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerWithContent> createState() => _ContainerWithContentState();
}

class _ContainerWithContentState extends State<ContainerWithContent> {
  @override
  Widget build(BuildContext context) {
    // get data from inherit

    List<PopMovies> popMovies =
        context.dependOnInheritedWidgetOfExactType<MovieListSender>()!.movies;
    int index =
        context.dependOnInheritedWidgetOfExactType<MovieListSender>()!.index;

    // get data from inherit

    // ----------------------

    // film info data

    String imagePath = 'https://image.tmdb.org/t/p/original' +
        popMovies[index].backdropPath.toString();
    String filmTitle = popMovies[index].originalTitle.toString();
    String? date = popMovies[index].releaseDate.toString();
    String voteAverage = popMovies[index].voteAverage.toString();
    String overview = popMovies[index].overview.toString();

    // film info data

    return Padding(
      padding: const EdgeInsets.only(top: 33, left: 23, right: 23),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
            border: Border.all(
                color: const Color.fromRGBO(111, 187, 192, 1), width: 3),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25)),
                          border: Border.all(
                              color: const Color.fromRGBO(190, 239, 255, 1),
                              width: 2)),
                      width: 77,
                      height: 92,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25)),
                          child: Image.network(
                            imagePath,
                          )),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      voteAverage,
                      style: const TextStyle(
                          color: Color.fromRGBO(116, 178, 145, 1),
                          fontSize: 24,
                          fontFamily: 'Handjet'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      date.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(15, 36, 77, 1),
                          fontSize: 16,
                          fontFamily: 'Handjet'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 210,
                            child: Text(filmTitle,
                                style: const TextStyle(
                                    color: Color.fromRGBO(15, 36, 77, 1),
                                    fontFamily: 'Handjet',
                                    fontSize: 28))),
                        LikeButton(
                            imagePath: imagePath,
                            overview: overview,
                            filmTitle: filmTitle,
                            date: date,
                            voteAverage: voteAverage)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width - 180,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(overview,
                                    style: const TextStyle(
                                        color: Color.fromRGBO(15, 36, 77, 1),
                                        fontFamily: 'Handjet',
                                        fontSize: 14)),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

// Content Widget

// ----------------------

// Like Button

class LikeButton extends StatelessWidget {
  const LikeButton({
    Key? key,
    required this.imagePath,
    required this.overview,
    required this.filmTitle,
    required this.date,
    required this.voteAverage,
  }) : super(key: key);

  final String imagePath;
  final String overview;
  final String filmTitle;
  final String? date;
  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => addElementToFirebase(
          context, imagePath, overview, filmTitle, date, voteAverage),
      icon: const Icon(
        NavBarIcons.heart,
        color: Colors.redAccent,
      ),
      splashRadius: 20,
      splashColor: Colors.redAccent.shade100,
    );
  }
}

// Like Button

// ----------------------

// Dividers

class VerticalDividerByMyself extends StatelessWidget {
  const VerticalDividerByMyself({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromRGBO(142, 235, 255, 1),
        ));
  }
}

// Dividers

// ----------------------

// TopNavBarRealization

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Image(
            image: AssetImage('assets/imgs/logo.png'),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 3 - 120),
        Stack(children: [
          Text(
            AppLocalizations.of(context)!.movies,
            style: const TextStyle(
                fontFamily: 'Handjet',
                fontSize: 38,
                color: Color.fromRGBO(136, 221, 243, 1)),
          ),
          Text(
            AppLocalizations.of(context)!.movies,
            style: TextStyle(
                fontFamily: 'Handjet',
                fontSize: 38,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.5
                  ..color = const Color.fromRGBO(23, 160, 199, 1)),
          )
        ])
      ],
    );
  }
}

// TopNavBarRealization

// ----------------------

// Inherites

class MovieListSender extends InheritedWidget {
  const MovieListSender(
      {Key? key,
      required this.child,
      required this.movies,
      required this.index})
      : super(key: key, child: child);

  final Widget child;
  final List<PopMovies> movies;
  final int index;

  static MovieListSender? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MovieListSender>();
  }

  @override
  bool updateShouldNotify(MovieListSender oldWidget) {
    return movies != oldWidget.movies && index != oldWidget.index;
  }
}

// Inherites