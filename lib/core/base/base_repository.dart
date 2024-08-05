

import "base_provider.dart";


class BaseRepository<P extends BaseProvider> {
  BaseRepository({
    required this.provider,
  });

  final P provider;
}
