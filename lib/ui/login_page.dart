import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_app/provider/auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// Functions

void _registerFunc(
    BuildContext context, emailController, passwordController) async {
  if (emailController.text.contains(RegExp(r'@.')) &&
      passwordController.text.length > 6) {
    bool _register =
        await Provider.of<FirebaseAuthProvider>(context, listen: false)
            .registerUser(
                emailController.text.trim(), passwordController.text.trim());
    if (_register) {
      Navigator.pushNamed(context, '/mainScreens');
    }
  } else if (!emailController.text.contains(RegExp(r'@.'))) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        duration: const Duration(seconds: 1),
        content: Text(
          AppLocalizations.of(context)!.invalid_email_address,
          style: const TextStyle(
              fontFamily: 'Sniglet', color: Color.fromRGBO(21, 64, 82, 1)),
        ),
        backgroundColor: const Color.fromRGBO(133, 212, 236, 1)));
  } else if (passwordController.text.length <= 6) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        duration: const Duration(seconds: 1),
        content: Text(
          AppLocalizations.of(context)!.too_short_password,
          style: const TextStyle(
              fontFamily: 'Sniglet', color: Color.fromRGBO(21, 64, 82, 1)),
        ),
        backgroundColor: const Color.fromRGBO(133, 212, 236, 1)));
  }
}

void _loginFunc(
    BuildContext context, emailController, passwordController) async {
  if (emailController.text.contains(RegExp(r'@.'))) {
    bool _login = await Provider.of<FirebaseAuthProvider>(context,
            listen: false)
        .loginUser(emailController.text.trim(), passwordController.text.trim());
    if (_login) {
      Navigator.pushNamed(context, '/mainScreens');
    }
    ;
  } else if (!emailController.text.contains(RegExp(r'@.'))) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        duration: const Duration(seconds: 1),
        content: Text(
          AppLocalizations.of(context)!.invalid_email_address,
          style: const TextStyle(
              fontFamily: 'Sniglet', color: Color.fromRGBO(21, 64, 82, 1)),
        ),
        backgroundColor: const Color.fromRGBO(133, 212, 236, 1)));
  } else if (passwordController.text.length <= 6) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        duration: const Duration(seconds: 1),
        content: Text(
          AppLocalizations.of(context)!.too_short_password,
          style: const TextStyle(
              fontFamily: 'Sniglet', color: Color.fromRGBO(21, 64, 82, 1)),
        ),
        backgroundColor: const Color.fromRGBO(133, 212, 236, 1)));
  }
}

// Functions

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(228, 255, 255, 1),
        child: SingleChildScrollView(
          child: TextControllers(
            emailController: _emailController,
            passwordController: _passwordController,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Logo(),
                SizedBox(height: MediaQuery.of(context).size.height / 3 - 150),
                const FormWid(),
                const SizedBox(
                  height: 70,
                ),
                const Buttons(),
                const SizedBox(
                  height: 30,
                ),
                const Center(child: WelcomeText()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Stack(children: [
          Text(AppLocalizations.of(context)!.welcome,
              style: TextStyle(
                  color: const Color.fromRGBO(154, 218, 238, 1),
                  fontFamily: 'Handjet',
                  fontSize: 80,
                  shadows: [
                    Shadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 27)
                  ])),
          Text(AppLocalizations.of(context)!.welcome,
              style: TextStyle(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = const Color.fromRGBO(88, 134, 144, 1),
                  fontFamily: 'Handjet',
                  fontSize: 80)),
        ]));
  }
}

// Buttons class

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = context
        .dependOnInheritedWidgetOfExactType<TextControllers>()!
        .emailController;
    final passwordController = context
        .dependOnInheritedWidgetOfExactType<TextControllers>()!
        .passwordController;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: MaterialButton(
              onPressed: () =>
                  _loginFunc(context, emailController, passwordController),
              child: Text(AppLocalizations.of(context)!.login,
                  style: const TextStyle(
                      color: Color.fromRGBO(21, 64, 82, 1),
                      fontSize: 24,
                      fontFamily: 'Handjet')),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color.fromRGBO(1, 72, 112, 1), width: 1),
                  borderRadius: BorderRadius.circular(32)),
              color: const Color.fromRGBO(210, 255, 255, 1),
              padding: const EdgeInsets.all(15),
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: 150,
            child: MaterialButton(
              onPressed: () =>
                  _registerFunc(context, emailController, passwordController),
              child: Text(AppLocalizations.of(context)!.register,
                  style: const TextStyle(
                      color: Color.fromRGBO(21, 64, 82, 1),
                      fontSize: 24,
                      fontFamily: 'Handjet')),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color.fromRGBO(1, 72, 112, 1), width: 1),
                  borderRadius: BorderRadius.circular(32)),
              color: const Color.fromRGBO(210, 255, 255, 1),
              padding: const EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }
}

// Buttons class

// ----------------------

// Input data form

class FormWid extends StatelessWidget {
  const FormWid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = context
        .dependOnInheritedWidgetOfExactType<TextControllers>()!
        .emailController;
    final passwordController = context
        .dependOnInheritedWidgetOfExactType<TextControllers>()!
        .passwordController;
    bool visability = true;

    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: const Color.fromRGBO(0, 64, 139, 1), width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                style: const TextStyle(
                    fontFamily: 'Handjet',
                    fontSize: 24,
                    color: Color.fromRGBO(110, 178, 199, 1)),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.email,
                  hintStyle: const TextStyle(
                      fontFamily: 'Handjet',
                      fontSize: 34,
                      color: Color.fromRGBO(110, 178, 199, 1)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 58,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: const Color.fromRGBO(0, 64, 139, 1), width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: visability,
                style: const TextStyle(
                    fontFamily: 'Handjet',
                    fontSize: 24,
                    color: Color.fromRGBO(110, 178, 199, 1)),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  hintStyle: const TextStyle(
                      fontFamily: 'Handjet',
                      fontSize: 34,
                      color: Color.fromRGBO(110, 178, 199, 1)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

// Input data form

// ----------------------

// Top navigation bar

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Image(image: AssetImage('assets/imgs/logo.png')),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3 - 70,
        ),
        Stack(children: [
          Text(AppLocalizations.of(context)!.hello,
              style: const TextStyle(
                fontSize: 48,
                fontFamily: 'Handjet',
                color: Color.fromRGBO(136, 221, 243, 1),
              )),
          Text(AppLocalizations.of(context)!.hello,
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'Handjet',
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.5
                  ..color = const Color.fromRGBO(23, 160, 199, 1),
              )),
        ])
      ],
    );
  }
}

// Top navigation bar

// ----------------------

// Inherites

class TextControllers extends InheritedWidget {
  const TextControllers(
      {Key? key,
      required this.child,
      required this.emailController,
      required this.passwordController})
      : super(key: key, child: child);

  final Widget child;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  static TextControllers? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TextControllers>();
  }

  @override
  bool updateShouldNotify(TextControllers oldWidget) {
    return emailController != oldWidget.emailController &&
        passwordController != oldWidget.passwordController;
  }
}

// Inherites
