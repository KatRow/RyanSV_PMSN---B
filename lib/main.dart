import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pmsnb1/provider/flags_provider.dart';
import 'package:pmsnb1/provider/theme_provider.dart';
import 'package:pmsnb1/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:pmsnb1/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final idTema = sharedPreferences.getInt('id_tema') ?? 0;
  initializeDateFormatting().then((_) => runApp(MyApp(idTema: idTema)));
}

class MyApp extends StatelessWidget {
  final int idTema;
  const MyApp({Key? key, required this.idTema}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => FlagsProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          final themeData = themeProvider.getThemeData(); // Obtén el tema actual
          return MaterialApp(
            theme: themeData,
            routes: getApplicationRoutes(),
            home: Home(),
          );
        },
      ),
    );
  }
}
