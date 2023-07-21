import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:third_app/widgets/expense_screen.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 150, 129, 216));
var kDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 155));

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((fn) {
  return runApp( MaterialApp(
    themeMode: ThemeMode.system,
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kDarkScheme.primaryContainer,
        foregroundColor: kDarkScheme.onPrimaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kDarkScheme.secondaryContainer ,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkScheme.primaryContainer,
          foregroundColor: kDarkScheme.onPrimaryContainer
        )
      )
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer ,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        )
      ),
      textTheme:const TextTheme().copyWith(
        titleLarge: const TextStyle(
          fontSize: 16, 
          fontWeight: FontWeight.bold,
          color: Colors.black 
        ),
        titleSmall: const TextStyle(
          fontSize: 14, 
          color: Colors.black 
        ),
      ) 
      ),
      
    home: const ExpenseScreen())
    );
  // });
}
