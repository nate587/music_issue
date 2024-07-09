import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/models/song.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  late final dynamic playlistProvider;


  @override  

  void initState() {
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int newIndex) {
    playlistProvider.currentSongIndex = newIndex;
    Navigator.pushNamed(context, '/song_page');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "M Y  S O N G S",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
        ),
        drawer: Drawer(
          shape: const BeveledRectangleBorder(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Lottie.asset(
                      "lib/animations/music_animation.json",
                      height: 175,
                      width: 175,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          leading: Icon(Icons.home),
                          title: Text("H O M E"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/settings_page');
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text("S E T T I N G S"),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("L O G O U T"),
                  ),
                ),
              ]),
        ),
        body: Consumer<PlaylistProvider>(
          builder: (context, value, child) {

            final List<Song> playlist = value.playlist;

            return ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {

                final Song song = playlist[index];

                return GestureDetector(
                  onTap: () {
                    goToSong(index);
                  },
                  child: ListTile(
                    leading: Image.asset("lib/images/vivaldi.png"),
                    title: Text(song.songName),
                    subtitle: Text(song.artistName),
                    
                  ),
                );
              },
            );
          },
        ));
  }
}
