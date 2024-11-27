// ignore_for_file: avoid_print
import '../core.dart';

class CourseVideo extends StatefulWidget {
  final Map<String, dynamic> listData;

  const CourseVideo({
    super.key,
    required this.listData,
  });

  @override
  State<CourseVideo> createState() => _CourseVideoState();
}

class _CourseVideoState extends State<CourseVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      // If 'link_youtube' is a String, use it directly; if it's a List, process accordingly
      String videoUrl = widget.listData['link_youtube'];

      // Ensure we have a valid URL
      if (videoUrl.isNotEmpty) {
        String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

        if (videoId != null) {
          // Initialize the YouTube player with the extracted video ID
          _controller = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
              showLiveFullscreenButton: true,
            ),
          );
        } else {
          print('Invalid YouTube URL');
        }
      } else {
        print('No YouTube link available');
      }
    } catch (error) {
      print('Failed to load data: $error');
    }
  }

  @override
  void dispose() {
    // Dispose the controller to release resources and stop the video
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
        children: [
          MyHeader(
            titleText: widget.listData['title'],
            showBackButton: true,
          ),
          const SizedBox(
            height: 10,
          ),
          widget.listData['link_youtube'].isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text('No Voideo Availabel'),
                  ),
                )
              : Expanded(
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: primaryColor,
                  ),
                ),
          const BottomNav()
        ],
      ),
    );
  }
}
