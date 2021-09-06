import 'package:eco_ml/data/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DatabaseAdapter());
  await Hive.openBox<Database>('database');
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
