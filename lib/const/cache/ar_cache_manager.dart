import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class OneCacheManager {
  OneCacheManager._();
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );
}
