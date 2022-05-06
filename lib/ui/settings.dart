import 'package:flutter/material.dart';
import 'package:tmdb_app/custom_icons/my_flutter_app_icons.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30,),
                    const LanguageButton(),
                    const SizedBox(height: 40,),
                    const ThemeButton(),
                    const SizedBox(height: 17,),
                    Image.asset('assets/imgs/divider.png'),
                    const SizedBox(height: 17,),
                    const SignOutButton(),
                    const SizedBox(height: 20,),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

// Sign out button

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(131, 215, 220, 1), width: 1),
          borderRadius: BorderRadius.circular(35),
          color: const Color.fromRGBO(180, 255, 255, 1),
        ),
          width: MediaQuery.of(context).size.width - 120,
          height: 85,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Sign out',
                style: TextStyle(
                    color: Color.fromRGBO(21, 64, 82, 1), fontFamily: 'Sniglet', fontSize: 32),
              )
            ],
          )),
    );
  }
}

// Sign out button

// ---------------

// Theme button

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(131, 215, 220, 1), width: 1),
          borderRadius: BorderRadius.circular(35),
          color: const Color.fromRGBO(180, 255, 255, 1),
        ),
          width: MediaQuery.of(context).size.width - 120,
          height: 85,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(width: 30,),
              Expanded(
                child: Text(
                  'Theme',
                  style: TextStyle(
                      color: Color.fromRGBO(21, 64, 82, 1), fontFamily: 'Sniglet', fontSize: 32),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Icon(MyFlutterApp.brush, color: Color.fromRGBO(21, 64, 82, 1),),
              )
            ],
          )),
    );
  }
}

// Theme button

// ---------------

// Change language button

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Navigator.pushNamed(context, '/languages');},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(131, 215, 220, 1), width: 1),
          borderRadius: BorderRadius.circular(35),
          color: const Color.fromRGBO(180, 255, 255, 1),
        ),
          width: MediaQuery.of(context).size.width - 120,
          height: 85,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(width: 30,),
              Expanded(
                child: Text(
                  'Languages',
                  style: TextStyle(
                      color: Color.fromRGBO(21, 64, 82, 1), fontFamily: 'Sniglet', fontSize: 32),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Icon(MyFlutterApp.language, color: Color.fromRGBO(21, 64, 82, 1),),
              )
            ],
          )),
    );
  }
}

// Change language button

// ---------------

// Top nav bar

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
        SizedBox(width: MediaQuery.of(context).size.width / 3 - 125),
        Stack(children: [
          const Text(
            'Settings',
            style: TextStyle(
                fontFamily: 'Sniglet',
                fontSize: 48,
                color: Color.fromRGBO(136, 221, 243, 1)),
          ),
          Text(
            'Settings',
            style: TextStyle(
                fontFamily: 'Sniglet',
                fontSize: 48,
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

// Top nav bar