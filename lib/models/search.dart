import 'api.dart';

/// Search class
class Search {
  /// API class
  late API _api;

  /// Search
  Search(API api) {
    _api = api;
  }

  @override
  String toString() {
    return 'Search';
  }

  /// Allows the programmer to do a quick search for any substring.
  ///
  /// Params:
  ///
  /// `q` *(string)* Search query string.
  ///
  /// `offset` *(integer)* Offset for querying specific result subset, max: 200
  ///
  /// `limit` *(integer)* Maximum number of results to return., default: 9, max: 200
  ///
  /// `filters` *(array)*
  ///
  /// `fields` *(array)*
  ///
  /// `search_global` *(boolean)*, default: 1
  Future<dynamic> getHints([Map<String, dynamic>? params]) async {
    return _api.request('search.getHints', {
      ...?params,
    });
  }
}
