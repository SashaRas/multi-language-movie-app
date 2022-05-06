import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tmdb_app/api/get_api_data.dart';
import 'package:tmdb_app/main_screens.dart';
import 'package:tmdb_app/provider/auth_provider.dart';
import 'package:tmdb_app/provider/language_provider.dart';
import 'package:tmdb_app/provider/provider_crud.dart';
import 'package:tmdb_app/ui/languages.dart';
import 'package:tmdb_app/ui/login_page.dart';
import 'package:tmdb_app/ui/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<LanguageProvider>(
      create: ((BuildContext context) => LanguageProvider()),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CrudProvider>(
            create: (BuildContext context) => CrudProvider()),
        ChangeNotifierProvider<FirebaseAuthProvider>(
          create: (BuildContext context) => FirebaseAuthProvider(),
        ),
        ChangeNotifierProvider<GetApiData>(create: (context) => GetApiData()),
      ],
      child: MaterialApp(
          locale: Provider.of<LanguageProvider>(context).currentLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.allLanguages,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/mainScreens': (context) => MainScreens(),
            '/settings': (context) => Settings(),
            '/languages': (context) => const Languages(),
          }),
    );
  }
}
