import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
final _appRouter = MyAppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Eco Ml',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xffEBE8E0),
        textTheme: GoogleFonts.koHoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
     routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
