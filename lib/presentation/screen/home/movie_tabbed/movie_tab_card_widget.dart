import 'package:flutter/material.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';

import '../../../../common/constants/size_constant.dart';
import '../../../../common/core/api_constant.dart';
import '../../movie_detail/movie_detail_argument.dart';
import '../../movie_detail/movie_detail_screen.dart';

class MovieTabCardWidget extends StatefulWidget {
  final int movieId;
  final String title, posterPath;

  const MovieTabCardWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.posterPath,
  }) : super(key: key);

  @override
  State<MovieTabCardWidget> createState() => _MovieTabCardWidgetState();
}

class _MovieTabCardWidgetState extends State<MovieTabCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(widget.movieId),
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(Sizes.dimen_16)),
              child: Image.network(
                '${ApiConstant.ITEM_LIST}${widget.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(Sizes.dimen_4)),
            child: Text(
              widget.title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
