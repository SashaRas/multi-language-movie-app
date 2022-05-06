import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_app/provider/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// Toast message function

void _showToastMessage(BuildContext context) {
  if (countries == 1) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      duration: const Duration(seconds: 1),
      content: const Text(
        'Вітаємо!',
        style: TextStyle(
            fontFamily: 'Sniglet', color: Color.fromRGBO(21, 64, 82, 1)),
      ),
      backgroundColor: const Color.fromRGBO(133, 212, 236, 1),
    ));
  } else if (countries == 2) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        duration: const Duration(seconds: 1),
        content: const Text(
          'Welcome!',
          style: TextStyle(
              fontFamily: 'Sniglet', color: Color.fromRGBO(21, 64, 82, 1)),
        ),
        backgroundColor: const Color.fromRGBO(133, 212, 236, 1)));
  } else if (countries == 3) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        duration: const Duration(seconds: 1),
        content: const Text(
          'Hola!',
          style: TextStyle(
              fontFamily: 'Sniglet', color: Color.fromRGBO(21, 64, 82, 1)),
        ),
        backgroundColor: const Color.fromRGBO(133, 212, 236, 1)));
  } else if (countries == 4) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        duration: const Duration(seconds: 1),
        content: const Text(
          'Cześć!',
          style: TextStyle(
              fontFamily: 'Sniglet', color: Color.fromRGBO(21, 64, 82, 1)),
        ),
        backgroundColor: const Color.fromRGBO(133, 212, 236, 1)));
  } else if (countries == 5) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      duration: const Duration(seconds: 5),
      content: const Text('Start to learn English. Слава Україні!',
          style: TextStyle(
              fontFamily: 'Sniglet', color: Color.fromRGBO(21, 64, 82, 1))),
      backgroundColor: const Color.fromRGBO(133, 212, 236, 1),
      action: SnackBarAction(
          label: 'Героям слава!', onPressed: scaffold.hideCurrentSnackBar),
    ));
  }
}

// Toast message function

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

int countries = 0;

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(228, 255, 255, 1),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopNavBar(),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    FlagOfUkraine(),
                    SizedBox(
                      height: 55,
                    ),
                    FlagOfGB(),
                    SizedBox(
                      height: 55,
                    ),
                    FlagOfSpanish(),
                    SizedBox(
                      height: 55,
                    ),
                    FlagOfPolish(),
                    SizedBox(
                      height: 55,
                    ),
                    FlagOfR(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Ukraine

class FlagOfUkraine extends StatelessWidget {
  const FlagOfUkraine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        countries = 1;
        changeLanguageToUkrainian(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(228, 255, 255, 1),
            border: Border.all(
                color: const Color.fromRGBO(151, 185, 256, 1), width: 3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(38))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'Українська',
                  style: TextStyle(
                      color: Color.fromRGBO(21, 64, 82, 1),
                      fontFamily: 'Sniglet',
                      fontSize: 32),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/imgs/flags/ukraine_flag.jpg')),
              )
            ],
          ),
        ),
      ),
    );
  }

  // change function
  void changeLanguageToUkrainian(BuildContext context) {
    Provider.of<LanguageProvider>(context, listen: false).changeLocale('uk');

    _showToastMessage(context);
  }
  // change function

}

// Ukraine

// -------------

// English

class FlagOfGB extends StatelessWidget {
  const FlagOfGB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        countries = 2;
        changeLanguageToEnglish(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(228, 255, 255, 1),
            border: Border.all(
                color: const Color.fromRGBO(151, 185, 256, 1), width: 3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(38))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'English',
                  style: TextStyle(
                      color: Color.fromRGBO(21, 64, 82, 1),
                      fontFamily: 'Sniglet',
                      fontSize: 32),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/imgs/flags/gb_flag.png')),
              )
            ],
          ),
        ),
      ),
    );
  }

  // change function
  void changeLanguageToEnglish(BuildContext context) {
    Provider.of<LanguageProvider>(context, listen: false).changeLocale('en');

    _showToastMessage(context);
  }
  // change function

}

// English

// -------------

// Spanish

class FlagOfSpanish extends StatelessWidget {
  const FlagOfSpanish({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        countries = 3;
        changeLanguageToSpanish(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(228, 255, 255, 1),
            border: Border.all(
                color: const Color.fromRGBO(151, 185, 256, 1), width: 3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(38))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'Española',
                  style: TextStyle(
                      color: Color.fromRGBO(21, 64, 82, 1),
                      fontFamily: 'Sniglet',
                      fontSize: 32),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/imgs/flags/spanish_flag.png')),
              )
            ],
          ),
        ),
      ),
    );
  }

  // change function
  void changeLanguageToSpanish(BuildContext context) {
    Provider.of<LanguageProvider>(context, listen: false).changeLocale('es');

    _showToastMessage(context);
  }
  // change function

}

// Spanish

// -------------

// Poland

class FlagOfPolish extends StatelessWidget {
  const FlagOfPolish({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        countries = 4;
        changeLanguageToPolish(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(228, 255, 255, 1),
            border: Border.all(
                color: const Color.fromRGBO(151, 185, 256, 1), width: 3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(38))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'Polski',
                  style: TextStyle(
                      color: Color.fromRGBO(21, 64, 82, 1),
                      fontFamily: 'Sniglet',
                      fontSize: 32),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/imgs/flags/polish_flag.png')),
              )
            ],
          ),
        ),
      ),
    );
  }

  // change function
  void changeLanguageToPolish(BuildContext context) {
    Provider.of<LanguageProvider>(context, listen: false).changeLocale('pl');

    _showToastMessage(context);
  }
  // change function

}

// Poland

// -------------

// russia

class FlagOfR extends StatelessWidget {
  const FlagOfR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        countries = 5;
        _showToastMessage(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(228, 255, 255, 1),
            border: Border.all(
                color: const Color.fromRGBO(151, 185, 256, 1), width: 3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(38))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'Russian',
                  style: TextStyle(
                      color: Color.fromRGBO(21, 64, 82, 1),
                      fontFamily: 'Sniglet',
                      fontSize: 32),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/imgs/flags/r_flag.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// russia

// -------------

// Logo

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
        // SizedBox(width: MediaQuery.of(context).size.width / 3 - 140),
        Stack(children: [
          Text(
            AppLocalizations.of(context)!.languages,
            style: const TextStyle(
                fontFamily: 'Sniglet',
                fontSize: 38,
                color: Color.fromRGBO(136, 221, 243, 1)),
          ),
          Text(
            AppLocalizations.of(context)!.languages,
            style: TextStyle(
                fontFamily: 'Sniglet',
                fontSize: 38,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.5
                  ..color = const Color.fromRGBO(23, 160, 199, 1)),
          )
        ]),
      ],
    );
  }
}

// Logo