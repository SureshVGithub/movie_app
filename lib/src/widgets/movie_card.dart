import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/src/utils/constants/color_constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MovieCard extends StatelessWidget {
  MovieCard(
      {super.key,
      required this.title,
      required this.releaseDate,
      required this.popularity,
      required this.posterPath});
  String title;
  String releaseDate;
  String posterPath;
  String popularity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: 'http://image.tmdb.org/t/p/w500/$posterPath',
                    progressIndicatorBuilder: (context, url, progress) {
                      return const Icon(
                        Icons.image,
                        size: 42,
                      );
                    },
                    errorWidget: (context, url, error) {
                      return const Icon(
                        Icons.image_not_supported_rounded,
                        size: 42,
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularPercentIndicator(
                        backgroundColor: Colors.black,
                        radius: 20.0,
                        lineWidth: 3.0,
                        percent: 0.7,
                        center: const Text(
                          '72%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                        progressColor: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 170,
                child: Text(
                  textAlign: TextAlign.center,
                  title.toString(),
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                width: 170,
                child: Text(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorConstants.greyColor,
                  ),
                  DateFormat('dd MMM yyyy').format(
                    DateTime.parse(releaseDate),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
