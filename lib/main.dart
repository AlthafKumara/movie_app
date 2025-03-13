import 'package:app_movie/views/movie_view.dart';
import 'package:app_movie/views/pesan_view.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/views/dashboard_view.dart';
import 'package:app_movie/views/login_view.dart';
import 'package:app_movie/views/register_user_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoginView(),
      '/dashboard': (context) => DashboardView(),
      '/movie': (context) => MovieView(),
      '/pesan': (context) => PesanView()
    },
  ));
}
