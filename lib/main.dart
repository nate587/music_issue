import 'package:flutter/material.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/pages/home_page.dart';
import 'package:music_player/pages/settings_page.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
      create: (context) {
        return ThemeProvider();
          },
        ),

        ChangeNotifierProvider(
      create: (context) {
        return PlaylistProvider();
          },
        ),
      ],
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      routes: {

        "/home_page": (context) {
          return const HomePage();
        },

        "/settings_page": (context) {
          return const SettingsPage();
        },

        "/song_page": (context) {
          return const SongPage();
        },

      },
      home: const HomePage( 
      )
    );
  }
}
