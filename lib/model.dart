import 'package:audioplayers/audioplayers.dart';

final AudioPlayer globalPlayer = AudioPlayer();
int? globalCurrentIndex;

Playlist? globalCurrentPlaylist;

class Song {
  final String title;
  final String artist;
  final String image;
  final String duration;
  final String audioUrl;

  Song({
    required this.title,
    required this.artist,
    required this.image,
    required this.duration,
    required this.audioUrl,
  });
}

class Playlist {
  final String title;
  final String image;
  final List<Song> songs;

  Playlist({required this.title, required this.image, required this.songs});
}

List<Playlist> myPlaylists = [
  Playlist(
    title: "اناشيد رمضان",
    image: "assets/images/Rammadan.jpg",
    songs: [
      Song(
        title: "رمضان",
        artist: "غير معروف",
        image: "assets/images/Rammadan.jpg",
        duration: "3:25",
        audioUrl: "audio/audio2.mp3",
      ),
      Song(
        title: "غردي يا روح",
        artist: "مشاري العفاسي",
        image: "assets/images/غردي يا روح.avif",
        duration: "3:25",
        audioUrl: "audio/gharridy_alafasy.mp3",
      ),
    ],
  ),

  Playlist(
    title: "حزين🖤",
    image: "assets/images/ححزن.jpg",
    songs: [
      Song(
        title: "يا اخوتي ماذا نقول",
        artist: "الشيخ/ احمد السيد",
        image: "assets/images/الشيخ احمد السيد.jpg",
        duration: "3:25",
        audioUrl: "audio/audio1.mp3",
      ),
      Song(
        title: "ياليل الصب متى غده",
        artist: "علي بن عبدالغني بصوت الحصري_القيرواني",
        image: "assets/images/يا ليل متي الصب.png",
        duration: "3:25",
        audioUrl: "audio/layl_al_sabb.mp3",
      ),
      Song(
        title: "باعو الحياه ابيه",
        artist: "بن القيم",
        image: "assets/images/بعو الحياه ابيه.jpg",
        duration: "3:25",
        audioUrl: "audio/ashaqu_al_hayah.mp3",
      ),
    ],
  ),

  Playlist(
    title: "بوديكاست🧠",
    image: "assets/images/بوديكاست.jpg",
    songs: [
      Song(
        title: "كيف للقرأن ان يغير حياتك",
        artist: "د. نايف بن نهار ｜ بودكاست بدون ورق",
        image: "assets/images/cover1.jpg",
        duration: "3:25",
        audioUrl: "audio/quran_understanding.mp3",
      ),
      Song(
        title: "انا صاحبك القرأن",
        artist: "احمد العربي",
        image: "assets/images/احمد العربي.webp",
        duration: "3:25",
        audioUrl: "audio/quran_friend.mp3",
      ),
      Song(
        title: "التوبه",
        artist: "سمير مصطفى",
        image: "assets/images/سمير مصطفي.webp",
        duration: "3:25",
        audioUrl: "audio/tawbah_samir_mostafa.mp3",
      ),
    ],
  ),
];
