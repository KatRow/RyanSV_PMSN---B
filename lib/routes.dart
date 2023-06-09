import 'package:flutter/material.dart';
import 'package:pmsnb1/screens/dashboard_screen.dart';
import 'package:pmsnb1/screens/popular_movies_screen.dart';
import 'package:pmsnb1/screens/register_screen.dart';
import 'package:pmsnb1/screens/login_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
    '/popular': (BuildContext context) => const PopularMoviesScreen(),
    '/login': (BuildContext context) => const LoginScreen(),
  };
}
