import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../widgets/rich_text_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen(
      {super.key,
      required this.backDropPath,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.language});
  String posterPath;
  String backDropPath;
  String overview;
  String releaseDate;
  String title;
  String language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Card(
              // color: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  // Add your back button functionality here
                  Navigator.of(context)
                      .pop(); // Example: Popping the current screen
                },
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.12),
            child: Column(
              children: [
                SizedBox(
                  width: double
                      .infinity, // You can set the width to your desired value

                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Colors.transparent],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            imageUrl:
                                'http://image.tmdb.org/t/p/w500/$backDropPath',
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
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          bottom: 16, // Adjust the bottom position as needed
                          left: 16, // Adjust the left position as needed
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              Text(
                                language,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Overview ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Text(overview,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const Divider(),
                      Text('Details',
                          style: Theme.of(context).textTheme.bodyLarge),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'http://image.tmdb.org/t/p/w500/$posterPath',
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return const Icon(
                                      Icons.image,
                                      // color: ColorConstants.greyColor,
                                      size: 42,
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return const Icon(
                                      Icons.image_not_supported_rounded,
                                      // color: ColorConstants.greyColor,
                                      size: 42,
                                    );
                                  },
                                  height: 179,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    RichTextWidget(
                                      title: 'Title',
                                      tContent: title,
                                    ),
                                    RichTextWidget(
                                        title: 'Duration', tContent: '-'),
                                    RichTextWidget(
                                      title: 'Language',
                                      tContent: language,
                                    ),
                                    RichTextWidget(
                                      title: 'Production',
                                      tContent: '-',
                                    ),
                                    RichTextWidget(
                                      title: 'Release date',
                                      tContent: releaseDate,
                                    ),
                                    RichTextWidget(
                                      title: 'Cast',
                                      tContent: '-',
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
