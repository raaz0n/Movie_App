import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/domain/entities/watch_video_Entity.dart';
import 'package:movie_app/presentation/screen/app_localization.dart';
import 'package:movie_app/presentation/screen/watch_video/watch_video_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArgument watchVideoArgument;
  const WatchVideoScreen({Key? key, required this.watchVideoArgument})
      : super(key: key);

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<WatchVideoEntity> _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _videos = widget.watchVideoArgument.videos;
    _controller = YoutubePlayerController(
        initialVideoId: _videos[0].key,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          // isLive: true,
          enableCaption: true,
          captionLanguage: "en",
        ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!
            .translate(TranslationConstants.watchTrailers)
            .toString()),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < _videos.length; i++)
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.load(_videos[i].key);
                                _controller.play();
                              },
                              child: Image.asset(
                                YoutubePlayer.getThumbnail(
                                  videoId: _videos[i].key,
                                  quality: ThumbnailQuality.high,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(
                                        Sizes.dimen_6)),
                                child: Text(
                                  _videos[i].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
