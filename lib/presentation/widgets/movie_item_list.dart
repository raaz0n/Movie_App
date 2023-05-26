import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';

import '../../common/core/api_constant.dart';

class TrendingMovieItem extends StatelessWidget {
  final MovieEntity Movie;

  const TrendingMovieItem({required this.Movie});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        color: AppColor.violet,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      Movie.id.toString(),
                      style:
                          TextStyle(color: Colors.grey.shade300, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  Movie.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      // flex: 3,
                      child: Hero(
                        tag: 'Movie${Movie.id}',
                        child: Image.network(
                          ApiConstant.ITEM_LIST + Movie.posterPath,
                          height: 100,
                          // width: 200,
                          // errorBuilder: (src, _, __) {
                          //   return Image.asset(
                          //     'assets/images/pokeball.png',
                          //     height: 70,
                          //   );
                          // },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
