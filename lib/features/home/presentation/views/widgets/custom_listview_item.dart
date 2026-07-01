import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListviewBuilder extends StatelessWidget {
  final String imageurl;
  const CustomListviewBuilder({super.key, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          imageUrl: imageurl,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
