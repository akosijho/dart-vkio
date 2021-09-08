import 'api.dart';

/// Status class
class Status {
  /// API class
  late API _api;

  /// Status
  Status(API api) {
    _api = api;
  }

  @override
  String toString() {
    return 'Status';
  }

  /// Returns data required to show the status of a user or community.
  ///
  /// Params:
  ///
  /// `user_id` *(integer)* User ID or community ID. Use a negative value to designate a community ID.
  ///
  /// `group_id` *(integer)*
  Future<dynamic> get([Map<String, dynamic>? params]) async {
    return _api.request('status.get', {
      ...?params,
    });
  }

  /// Sets a new status for the current user.
  ///
  /// Params:
  ///
  /// `text` *(string)* Text of the new status.
  ///
  /// `group_id` *(integer)* Identifier of a community to set a status in. If left blank the status is set to current user.
  Future<dynamic> set([Map<String, dynamic>? params]) async {
    return _api.request('status.set', {
      ...?params,
    });
  }
}
