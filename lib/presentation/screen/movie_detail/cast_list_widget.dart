import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/data/core/api_constant.dart';
import 'package:movie_app/presentation/bloc/cast_bloc/cast_bloc.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';

class CastListWidget extends StatelessWidget {
  const CastListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          return SizedBox(
            height: getProportionateScreenHeight(Sizes.dimen_230),
            child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.casts.length,
                itemBuilder: (context, index) {
                  final castEntity = state.casts[index];
                  return SizedBox(
                    height: getProportionateScreenHeight(Sizes.dimen_150),
                    width: getProportionateScreenWidth(Sizes.dimen_160),
                    child: Card(
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_8,
                        vertical: Sizes.dimen_4,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            getProportionateScreenWidth(Sizes.dimen_8),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(Sizes.dimen_10)),
                              child: Image.network(
                                '${ApiConstant.ITEM_LIST}${castEntity.profilePath ?? "/rZHqKjXYPFndiri2rVTzHfYSVBc.jpg"}',
                                // fit: BoxFit.fitHeight,
                                fit: BoxFit.cover,
                                height: getProportionateScreenHeight(
                                    Sizes.dimen_100),
                                width: getProportionateScreenWidth(
                                    Sizes.dimen_160),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.dimen_8,
                            ),
                            child: Text(
                              castEntity.name,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: const TextStyle(color: AppColor.vulcan),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(Sizes.dimen_8),
                              right: getProportionateScreenWidth(Sizes.dimen_8),
                              bottom:
                                  getProportionateScreenHeight(Sizes.dimen_2),
                            ),
                            child: Text(
                              castEntity.character,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
