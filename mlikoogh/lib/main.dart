import 'package:flutter/material.dart';
import 'package:mlikoogh/screens/login.dart';
import 'package:mlikoogh/screens/menu.dart';
import 'package:http/http.dart' as http;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Mlikoogh',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(255, 236, 103, 46),
            secondary: const Color.fromARGB(255, 196, 48, 48),
          )
        ),
        home: const LoginPage(),
      )
    );
  }
}