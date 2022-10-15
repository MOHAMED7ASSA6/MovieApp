import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';

import 'package:shimmer/shimmer.dart';

import '../../../core/api_code/apis.dart';
import '../../../core/components/now_playing.dart';
import '../../../core/components/popular.dart';
import '../../../core/components/top_rated.dart';
import '../../../core/dummy.dart';
import '../../../core/server/Server.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>
      getIt<MoviesBloc>()..add(GetNowPlayinEventMovies())..add(GetNowPopularEventMovies())..add(GetNowTopEventMovies()),
    child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const  NowPlayingComponents(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO : NAVIGATION TO POPULAR SCREEN
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text('See More',style: TextStyle(  color: Colors.white,),),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const  PopularComponents(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO : NAVIGATION TO Top Rated Movies Screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text('See More',style:TextStyle(  color: Colors.white,),),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const  TopRatedComponents(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    ),
    );
  }
}
