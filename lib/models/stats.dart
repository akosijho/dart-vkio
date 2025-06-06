import 'api.dart';

/// Stats class
class Stats {
  /// API class
  late API _api;

  /// Stats
  Stats(API api) {
    _api = api;
  }

  @override
  String toString() {
    return 'Stats';
  }

  /// Returns statistics of a community or an application.
  ///
  /// Params:
  ///
  /// `group_id` *(integer)* Community ID.
  ///
  /// `app_id` *(integer)* Application ID.
  ///
  /// `timestamp_from` *(integer)*
  ///
  /// `timestamp_to` *(integer)*
  ///
  /// `interval` *(string)*, default: day
  ///
  /// `intervals_count` *(integer)*
  ///
  /// `filters` *(array)*
  ///
  /// `stats_groups` *(array)*
  ///
  /// `extended` *(boolean)*, default: true
  Future<dynamic> get([Map<String, dynamic>? params]) async {
    return _api.request('stats.get', {
      ...?params,
    });
  }

  /// Returns stats for a wall post.
  ///
  /// Params:
  ///
  /// `owner_id` *(string)* post owner community id. Specify with "-" sign.
  ///
  /// `post_id` *(integer)* wall post id. Note that stats are available only for '300' last (newest) posts on a community wall.
  Future<dynamic> getPostReach([Map<String, dynamic>? params]) async {
    return _api.request('stats.getPostReach', {
      ...?params,
    });
  }

  /// Params:
  ///
  /// `id` *(string)*
  Future<dynamic> trackVisitor([Map<String, dynamic>? params]) async {
    return _api.request('stats.trackVisitor', {
      ...?params,
    });
  }
}
