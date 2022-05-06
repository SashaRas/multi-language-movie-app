import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_app/provider/provider_crud.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void _deleteMovie(BuildContext context, String id) async {
  await Provider.of<CrudProvider>(context, listen: false).removeElement(id);
}

class FavMovies extends StatefulWidget {
  const FavMovies({Key? key}) : super(key: key);

  @override
  State<FavMovies> createState() => _FavMoviesState();
}

class _FavMoviesState extends State<FavMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(228, 255, 255, 1),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 25,
              ),
              const TopNavBar(),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('All Users')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .collection('Data')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  return !snapshot.hasData
                      ? const Center(
                          child: Text('Choose films :)',
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 36, 77, 1),
                                  fontFamily: 'Handjet',
                                  fontSize: 28)))
                      : ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: snapshot.data!.docs.map((movie) {
                            return DataFromFirebase(
                                id: movie.id,
                                filmTitle: movie.get('Title'),
                                imagePath: movie.get('Image'),
                                overview: movie.get('Overview'),
                                releasedate: movie.get('Release date'),
                                voteAverage: movie.get('Vote average'),
                                child: const ContainerWithContent());
                          }).toList());
                },
              ),
              const SizedBox(
                height: 25,
              )
            ]),
          ),
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

    final String? filmTitle = context
        .dependOnInheritedWidgetOfExactType<DataFromFirebase>()
        ?.filmTitle;
    final String? overview = context
        .dependOnInheritedWidgetOfExactType<DataFromFirebase>()
        ?.overview;
    final String? imagePath = context
        .dependOnInheritedWidgetOfExactType<DataFromFirebase>()
        ?.imagePath;
    final String? releaseDate = context
        .dependOnInheritedWidgetOfExactType<DataFromFirebase>()
        ?.releasedate;
    final String? voteAverage = context
        .dependOnInheritedWidgetOfExactType<DataFromFirebase>()
        ?.voteAverage;
    final String? id =
        context.dependOnInheritedWidgetOfExactType<DataFromFirebase>()?.id;

    // get data from inherit

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
                        child: imagePath != null
                            ? Image.network(
                                imagePath,
                              )
                            : const Center(
                                child: Text('No image',
                                    style: TextStyle(
                                        color: Color.fromRGBO(15, 36, 77, 1),
                                        fontFamily: 'Handjet',
                                        fontSize: 28))),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      voteAverage.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(116, 178, 145, 1),
                          fontSize: 24,
                          fontFamily: 'Handjet'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      releaseDate.toString(),
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
                            child: Text(filmTitle.toString(),
                                style: const TextStyle(
                                    color: Color.fromRGBO(15, 36, 77, 1),
                                    fontFamily: 'Handjet',
                                    fontSize: 28))),
                        RemoveButton(
                          id: id.toString(),
                        ),
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
                                child: Text(overview.toString(),
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

// Remove Button

class RemoveButton extends StatelessWidget {
  RemoveButton({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _deleteMovie(context, id),
      icon: const Icon(
        Icons.delete_outline,
        color: Colors.redAccent,
      ),
      splashRadius: 20,
      splashColor: Colors.redAccent.shade100,
    );
  }
}

// Remove Button

// ----------------------

// Divider

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

// Divider

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
            AppLocalizations.of(context)!.fav_movies,
            style: const TextStyle(
                fontFamily: 'Handjet',
                fontSize: 30,
                color: Color.fromRGBO(136, 221, 243, 1)),
          ),
          Text(
            AppLocalizations.of(context)!.fav_movies,
            style: TextStyle(
                fontFamily: 'Handjet',
                fontSize: 30,
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

// Inherits

class DataFromFirebase extends InheritedWidget {
  const DataFromFirebase(
      {Key? key,
      required this.child,
      required this.filmTitle,
      required this.overview,
      required this.imagePath,
      required this.releasedate,
      required this.voteAverage,
      required this.id})
      : super(key: key, child: child);

  final Widget child;
  final String filmTitle;
  final String overview;
  final String imagePath;
  final String releasedate;
  final String voteAverage;
  final String id;

  static DataFromFirebase? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataFromFirebase>();
  }

  @override
  bool updateShouldNotify(DataFromFirebase oldWidget) {
    return filmTitle != oldWidget.filmTitle &&
        overview != oldWidget.overview &&
        imagePath != oldWidget.imagePath &&
        releasedate != oldWidget.releasedate &&
        voteAverage != voteAverage &&
        id != oldWidget.id;
  }
}

// Inherits