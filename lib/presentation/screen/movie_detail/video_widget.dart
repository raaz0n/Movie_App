import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/presentation/screen/watch_video/watch_video_arguments.dart';
import 'package:movie_app/presentation/screen/watch_video/watch_video_screen.dart';
import 'package:movie_app/presentation/widgets/button_widget.dart';

import '../../bloc/video_bloc/videos_bloc.dart';

class VideoWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideoWidget({Key? key, required this.videosBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.vidoes.iterator.moveNext()) {
          final _video = state.vidoes;
          return Button(
            text: TranslationConstants.watchTrailers,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WatchVideoScreen(
                    watchVideoArgument: WatchVideoArgument(_video),
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
