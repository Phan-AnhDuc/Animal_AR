// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:animal_ar/const/cache/ar_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    Key? key,
    required this.imageUrl,
    this.fit,
    this.progress,
  }) : super(key: key);

  final String imageUrl;
  final fit;
  final bool? progress;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      cacheManager: OneCacheManager.customCacheManager,
      imageUrl: imageUrl,
      key: UniqueKey(),
      placeholder: (context, url) => progress == true ? const CircularProgressIndicator() : const SizedBox(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
