import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testflutter/bloc/users.bloc.dart';
import 'package:testflutter/ui/pages/counter.page.dart';
import 'package:testflutter/ui/pages/design.page.dart';
import 'package:testflutter/ui/pages/gallery.page.dart';
import 'package:testflutter/ui/pages/git.users.page.dart';
import 'package:testflutter/ui/pages/home.page.dart';
import 'package:testflutter/ui/pages/login.page.dart';
import 'package:testflutter/ui/pages/meteo.page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>UsersBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        routes: {
          "/": (context)=>const HomePage(),
          "/meteo": (context)=>const MeteoPage(),
          "/gallery": (context)=>const GalleryPage(),
          "/counter": (context)=>const CounterPage(),
          "/login": (context)=>LoginPage(),
          "/design": (context)=>const MyDesign(),
          "/git": (context)=>const GitUsersPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.deepOrange
        ),
        initialRoute: "/",
      ),
    );
  }
}






