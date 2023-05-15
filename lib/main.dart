import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/provider/count_provider.dart';
import 'package:flutter_provider_state_management_course/provider/example_one_provider.dart';
import 'package:flutter_provider_state_management_course/provider/favourite_provider.dart';
import 'package:flutter_provider_state_management_course/provider/theme_changer_provider.dart';
import 'package:flutter_provider_state_management_course/screen/favourite/dark_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.thememode,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.purple,
              iconTheme: const IconThemeData(
                  color: Colors.purple
              )
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.teal,
            primaryColor: Colors.teal,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.teal
            ),
            iconTheme: const IconThemeData(
              color: Colors.teal,
            ),
          ),
          home: DarkThemeScreen(),
        );
      }),
    );
  }
}
