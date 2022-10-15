import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_code/apis.dart';
import 'package:shimmer/shimmer.dart';

import '../../movies/presentation/controller/movies_bloc.dart';
import '../../movies/presentation/controller/movies_states.dart';

import '../enume/enume.dart';

class TopRatedComponents extends StatelessWidget {
  const TopRatedComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc,MoviesState>(

      builder: (context,state)
    {
      switch (state.TopRatedState) {
        case RequestState.Loading:
          return const SizedBox(
            height: 400,
            child: Center(child: CircularProgressIndicator(
              color: Colors.redAccent,
            )),
          );
        case RequestState.Loaded:
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.TopRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.TopRatedMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApisConstance.imageUrl(movie.backdropPath),
                          placeholder: (context, url) =>
                              Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        case RequestState.error:
          return SizedBox(
            height: 400,
            child: Text(
              state.message,
            ),
          );
      }
    });
  }
}