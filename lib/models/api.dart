import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../vk.dart';
import 'account.dart';
import 'ads.dart';
import 'apiexception.dart';
import 'apps.dart';
import 'auth.dart';
import 'board.dart';
import 'database.dart';
import 'docs.dart';
import 'fave.dart';
import 'friends.dart';
import 'gifts.dart';
import 'groups.dart';
import 'leads.dart';
import 'likes.dart';
import 'market.dart';
import 'messages.dart';
import 'newsfeed.dart';
import 'notes.dart';
import 'notifications.dart';
import 'orders.dart';
import 'pages.dart';
import 'photos.dart';
import 'polls.dart';
import 'prettycards.dart';
import 'search.dart';
import 'secure.dart';
import 'stats.dart';
import 'status.dart';
import 'storage.dart';
import 'stories.dart';
import 'streaming.dart';
import 'users.dart';
import 'utils.dart';
import 'video.dart';
import 'wall.dart';
import 'widgets.dart';

/// VK API class
class API {
  /// Base API request url
  final String _baseUrl = 'https://api.vk.com/method';

  /// VK class
  late VK _vk;

  /// Account class
  late Account account;

  /// Ads class
  late Ads ads;

  /// Apps class
  late Apps apps;

  /// Auth class
  late Auth auth;

  /// Board class
  late Board board;

  /// Database class
  late Database database;

  /// Docs class
  late Docs docs;

  /// Fave class
  late Fave fave;

  /// Friends class
  late Friends friends;

  /// Gifts class
  late Gifts gifts;

  /// Groups class
  late Groups groups;

  /// Leads class
  late Leads leads;

  /// Likes class
  late Likes likes;

  /// Market class
  late Market market;

  /// Messages class
  late Messages messages;

  /// Newsfeed class
  late Newsfeed newsfeed;

  /// Notes class
  late Notes notes;

  /// Notifications class
  late Notifications notifications;

  /// Orders class
  late Orders orders;

  /// Pages class
  late Pages pages;

  /// Photos class
  late Photos photos;

  /// Polls class
  late Polls polls;

  /// PrettyCards class
  late PrettyCards prettyCards;

  /// Search class
  late Search search;

  /// Secure class
  late Secure secure;

  /// Stats class
  late Stats stats;

  /// Status class
  late Status status;

  /// Storage class
  late Storage storage;

  /// Stories class
  late Stories stories;

  /// Streaming class
  late Streaming streaming;

  /// Users class
  late Users users;

  /// Utils class
  late Utils utils;

  /// Video class
  late Video video;

  /// Wall class
  late Wall wall;

  /// Widgets class
  late Widgets widgets;

  /// API
  API(VK vk) {
    _vk = vk;

    account = Account(this);
    ads = Ads(this);
    apps = Apps(this);
    auth = Auth(this);
    board = Board(this);
    database = Database(this);
    docs = Docs(this);
    fave = Fave(this);
    friends = Friends(this);
    gifts = Gifts(this);
    groups = Groups(this);
    leads = Leads(this);
    likes = Likes(this);
    market = Market(this);
    messages = Messages(this);
    newsfeed = Newsfeed(this);
    notes = Notes(this);
    notifications = Notifications(this);
    orders = Orders(this);
    pages = Pages(this);
    photos = Photos(this);
    polls = Polls(this);
    prettyCards = PrettyCards(this);
    search = Search(this);
    secure = Secure(this);
    stats = Stats(this);
    status = Status(this);
    storage = Storage(this);
    stories = Stories(this);
    streaming = Streaming(this);
    users = Users(this);
    utils = Utils(this);
    video = Video(this);
    wall = Wall(this);
    widgets = Widgets(this);
  }

  @override
  String toString() {
    return 'API';
  }

  Future<dynamic> request(String method,
      [Map<String, dynamic>? rawParams]) async {
    var params = {...?rawParams};

    for (var item in params.entries) {
      dynamic value = item.value;

      if (item.value is List) {
        value = item.value.join(',');
      } else if (item.value is int || item.value is double) {
        value = '${item.value}';
      }

      params[item.key] = value;
    }

    if (params['random_id'] == null) {
      var random_id = Random().nextInt(4294967296);

      params['random_id'] = '$random_id';
    }

    if (_vk.options['lang'] != null) {
      params['lang'] = _vk.options['lang'];
    }

    Map body = <String, dynamic>{
      'access_token': _vk.options['token'],
      'v': _vk.options['version'],
      ...params,
    };

    var response = await http.post(
      Uri.tryParse(_baseUrl + '/$method')!,
      body: body,
    );

    Map json = jsonDecode(response.body);

    if (json['error'] != null) {
      Map error = json['error'];

      throw APIException(
        error['error_msg'],
        error['error_code'],
      ).error;
    }

    return json['response'];
  }

  /// Call an API [method] with [params]
  Future<dynamic> call(String method, [Map<String, dynamic>? params]) async {
    return request(method, {
      ...?params,
    });
  }

  /// Execute [code]
  Future<dynamic> execute(String code) async {
    return call('execute', {
      'code': code,
    });
  }
}
