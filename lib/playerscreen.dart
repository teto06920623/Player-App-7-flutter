import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class PlayerScreen extends StatefulWidget {
  final List<Song> songs;
  final int initialIndex;

  const PlayerScreen({
    super.key,
    required this.songs,
    required this.initialIndex,
  });
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    setupAudio();

    player.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });

    player.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });

    player.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });
  }

  void _playNextSong() {
    if (currentIndex < widget.songs.length - 1) {
      setState(() {
        currentIndex++;
      });
      setupAudio();
    }
  }

  void _playPreviousSong() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      setupAudio();
    }
  }

  Future<void> setupAudio() async {
    await player.play(AssetSource(widget.songs[currentIndex].audioUrl));
  }


// =============================================================================================
  // assets/ هنا كنت بحل مشكله ال صوت و طلع ان الغلطه في ان المكتبه بضيف لواحدها في المسار 
// =============================================================================================
  // Future<void> setupAudio() async {
  //   try {
  //     // طباعة للتأكد إن الدالة اشتغلت والمسار صح
  //     print("حاول تشغيل: audio/${widget.songs[currentIndex].audioUrl}");
      
  //     await player.play(AssetSource(widget.songs[currentIndex].audioUrl));
      
  //     print("تم التشغيل بنجاح ✅");
  //   } catch (e) {
  //     // لو فيه خطأ هيظهر هنا
  //     print("خطأ في التشغيل ❌: $e");
  //   }
  // }

  @override
  void dispose() {
    // player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B29),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Now Playing",
                    style: TextStyle(color: Colors.white54),
                  ),
                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
              const Spacer(),

              Hero(
                tag: widget.songs[currentIndex].title,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(widget.songs[currentIndex].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Spacer(),

              Text(
                widget.songs[currentIndex].title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.songs[currentIndex].artist,
                style: const TextStyle(fontSize: 16, color: Colors.white54),
              ),

              const SizedBox(height: 20),

              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble().clamp(
                  0,
                  duration.inSeconds.toDouble(),
                ),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await player.seek(position);
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(position),
                    style: const TextStyle(color: Colors.white54),
                  ),
                  Text(
                    formatTime(duration),
                    style: const TextStyle(color: Colors.white54),
                  ),
                ],
              ),
              const Spacer(),

              // ده بديل للـ Center اللي كان فيه زرار واحد
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // توسيط الزراير
                children: [
                  // 1. زرار السابق
                  IconButton(
                    iconSize: 45,
                    icon: const Icon(Icons.skip_previous, color: Colors.white),
                    onPressed:
                        _playPreviousSong, // استدعاء الدالة اللي عملناها فوق
                  ),

                  const SizedBox(width: 20), // مسافة
                  // 2. زرار التشغيل (Play/Pause)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      iconSize: 50,
                      color: const Color(0xFF1C1B29),
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () async {
                        if (isPlaying) {
                          await player.pause();
                        } else {
                          await player.resume();
                        }
                      },
                    ),
                  ),

                  const SizedBox(width: 20), // مسافة
                  // 3. زرار التالي
                  IconButton(
                    iconSize: 45,
                    icon: const Icon(Icons.skip_next, color: Colors.white),
                    onPressed: _playNextSong, // استدعاء الدالة اللي عملناها فوق
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
