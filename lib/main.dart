import 'package:flutter/material.dart';
import 'package:item_viewer_app/controllers/item_provider.dart';
import 'package:item_viewer_app/utils/theme.dart';
import 'package:item_viewer_app/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: Consumer<ItemProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Item Viewer',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

