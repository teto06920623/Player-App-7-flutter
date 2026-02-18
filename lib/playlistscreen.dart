import 'package:flutter/material.dart';
import 'playerscreen.dart';
import 'model.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({super.key, required this.playlist});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    final currentListSongs = widget.playlist.songs;

    bool isThisPlaylistActive = globalCurrentPlaylist == widget.playlist;

    final headerImage = (isThisPlaylistActive && globalCurrentIndex != null)
        ? currentListSongs[globalCurrentIndex!].image
        : widget.playlist.image;

    final headerTitle = (isThisPlaylistActive && globalCurrentIndex != null)
        ? currentListSongs[globalCurrentIndex!].title
        : widget.playlist.title;

    final headerArtist = (isThisPlaylistActive && globalCurrentIndex != null)
        ? currentListSongs[globalCurrentIndex!].artist
        : "Playlist";

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(headerImage),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        // ignore: deprecated_member_use
                        Colors.black.withOpacity(0.4),
                        BlendMode.darken,
                      ),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(Icons.favorite_border, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            headerTitle,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            headerArtist,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (isThisPlaylistActive &&
                              globalCurrentIndex != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlayerScreen(
                                  songs: currentListSongs,
                                  initialIndex: globalCurrentIndex!,
                                ),
                              ),
                            ).then((value) => setState(() {}));
                          }
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color(0xFF6F35A5),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFF1C1B29),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "SONGS", 
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentListSongs.length,
                      itemBuilder: (context, index) {
                        bool isCurrentPlaying =
                            (globalCurrentIndex == index) &&
                            isThisPlaylistActive;

                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          onTap: () {
                            setState(() {
                              globalCurrentIndex = index;
                              globalCurrentPlaylist = widget.playlist;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlayerScreen(
                                  songs:
                                      currentListSongs, 
                                  initialIndex: index,
                                ),
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              currentListSongs[index].image,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            currentListSongs[index].title,
                            style: TextStyle(
                              color: isCurrentPlaying
                                  ? const Color(0xFF6F35A5)
                                  : Colors.white,
                              fontWeight: isCurrentPlaying
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          subtitle: Text(
                            currentListSongs[index].artist,
                            style: const TextStyle(color: Colors.white54),
                          ),
                          trailing: isCurrentPlaying
                              ? const Icon(
                                  Icons.graphic_eq,
                                  color: Color(0xFF6F35A5),
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white54,
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
