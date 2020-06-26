import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

enum SnsType { kakao, google }

class SnsInfo {
  SnsType _type;
  SnsType get type => _type;

  String _id;
  String get id => _id;

  String _name;
  String get name => _name;

  String _email;
  String get email => _email;

  SnsInfo(this._type, this._id, this._name, this._email);
}

class SignResult {
  int _userId;
  int get userId => _userId;

  String _token;
  String get token => _token;

  SignResult(this._userId, this._token);
}

class HomeResult {
  String _nickName;
  String get nickName => _nickName;

  int _price;
  int get price => _price;

  int _lastPrice;
  int get lastPrice => _lastPrice;

  HomeResult(this._nickName, this._price, this._lastPrice);
}

class ManagementPriceInfo {
  String _cowCount;
  String get cowCount => _cowCount;

  int _managePrice;
  int get managePrice => _managePrice;

  int _feedPrice;
  int get feedPrice => _feedPrice;

  ManagementPriceInfo(this._cowCount, this._managePrice, this._feedPrice);
}

class WeekPriceInfo {
  DateTime _date;
  DateTime get date => _date;

  int _weekPrice;
  int get weekPrice => _weekPrice;

  WeekPriceInfo(this._date, this._weekPrice);
}

class AuctionPriceResult {
  int _predictPrice;
  int get predictPrice => _predictPrice;

  List<WeekPriceInfo> _weekPrices;
  List<WeekPriceInfo> get weekPrices => _weekPrices;

  List<ManagementPriceInfo> _managementPrices;
  List<ManagementPriceInfo> get managementPrices => _managementPrices;

  AuctionPriceResult(
    this._predictPrice,
    this._weekPrices,
    this._managementPrices,
  );
}

class PostInfo {
  int id;
  DateTime createdData;
  int userId;
  String nickName;
  String tags;
  String photo;
  String title;
  String content;
  int likeCount;
  int commentCount;

  PostInfo(
    this.id,
    this.createdData,
    this.userId,
    this.nickName,
    this.tags,
    this.photo,
    this.title,
    this.content,
    this.likeCount,
    this.commentCount,
  );
}

class ProfileInfo {
  int userId;
  String userImage;
  String nickName;
  String farmImage;
  String phoneNum;
  String introduction;
  List<PostInfo> postInfo;

  ProfileInfo(
    this.userId,
    this.userImage,
    this.nickName,
    this.farmImage,
    this.phoneNum,
    this.introduction,
    this.postInfo,
  );
}

class RestService {
  static final RestService instance = RestService();

  final baseUrl = 'http://114.71.219.75:10005';

  SignResult _signResult;

  Future<SignResult> signUp({
    String address,
    String cowCount,
    String email,
    String nickName,
    String phoneNumber,
    String snsId,
    SnsType snsType,
    String userName,
    String userType,
  }) async {
    var snsTypeString;
    switch (snsType) {
      case SnsType.kakao:
        snsTypeString = 'KAKAO';
        break;
      case SnsType.google:
        snsTypeString = 'GOOGLE';
        break;
    }

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final body = json.encode({
      'address': address,
      'cowCount': cowCount,
      'email': email,
      'nickName': nickName,
      'phoneNum': phoneNumber,
      'snsId': snsId,
      'snsType': snsTypeString,
      'userName': userName,
      'userType': userType,
    });

    final response = await http.post(
      baseUrl + '/user/sign_up',
      headers: headers,
      body: body,
    );

    if (response.statusCode != 200) {
      return null;
    }

    final data = json.decode(response.body);
    _signResult = SignResult(data['userId'], data['token']);
    return _signResult;
  }

  Future<SignResult> signIn(
    SnsType snsType,
    String snsId,
  ) async {
    var snsTypeString;
    switch (snsType) {
      case SnsType.kakao:
        snsTypeString = 'KAKAO';
        break;
      case SnsType.google:
        snsTypeString = 'GOOGLE';
        break;
    }

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': _signResult?.token,
    };

    final body = json.encode({
      'snsId': snsId,
      'snsType': snsTypeString,
    });

    final response = await http.post(
      baseUrl + '/user/login',
      headers: headers,
      body: body,
    );

    if (response.statusCode != 200) {
      return null;
    }

    final data = json.decode(response.body);
    _signResult = SignResult(data['userId'], data['token']);
    return _signResult;
  }

  Future<HomeResult> getHome() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': _signResult?.token,
    };

    final response = await http.get(
      baseUrl + '/main/' + _signResult?.userId.toString(),
      headers: headers,
    );

    if (response.statusCode != 200) {
      return null;
    }

    final data = json.decode(response.body);
    return HomeResult(
        data['nickName'], data['price'].round(), data['price'].round());
  }

  Future<AuctionPriceResult> getAuctionPrice() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': _signResult?.token,
    };

    final response = await http.get(
      baseUrl + '/price/',
      headers: headers,
    );

    if (response.statusCode != 200) {
      return null;
    }

    final data = json.decode(response.body);

    List<WeekPriceInfo> weekPrices = List<WeekPriceInfo>();
    for (var weekPrice in data['weekPrices']) {
      weekPrices.add(WeekPriceInfo(
        DateTime.parse(weekPrice['date']),
        weekPrice['weekPrice'].round(),
      ));
    }

    List<ManagementPriceInfo> managementPrices = List<ManagementPriceInfo>();
    for (var managementPrice in data['managementPrices']) {
      managementPrices.add(ManagementPriceInfo(
        managementPrice['cowCount'],
        managementPrice['managePrice'].round(),
        managementPrice['feedPrice'].round(),
      ));
    }

    return AuctionPriceResult(
        data['predictPrice'].round(), weekPrices, managementPrices);
  }

  Future<List<PostInfo>> getCommunityPosts() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': _signResult?.token,
    };

    final response = await http.get(
      baseUrl + '/community/page/0',
      headers: headers,
    );

    if (response.statusCode != 200) {
      return null;
    }

    final data = json.decode(response.body);

    List<PostInfo> posts = List<PostInfo>();
    for (var post in data['posts']) {
      posts.add(PostInfo(
        post['id'],
        DateTime.parse(post['createdDate']),
        post['userId'],
        post['nickName'],
        post['tags'],
        post['photo'],
        post['title'],
        post['content'],
        post['likeCount'],
        post['commentCount'],
      ));
    }

    return posts;
  }

  Future<bool> postCommunity(
    String nickName,
    String title,
    String content,
    String tags,
  ) async {
    var dio = Dio();
    dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    dio.options.headers['Authorization'] = _signResult?.token;

    final body = {
      'userId': _signResult.userId,
      'nickName': nickName,
      'title': title,
      'content': content,
      'tags': null,
      'imageFile': [],
    };

    FormData formData = FormData.fromMap(body);
    final response = await dio.post(
      baseUrl + '/community/new',
      data: formData,
    );

    if (response.statusCode != 200) {
      return false;
    }

    return true;
  }

  Future<ProfileInfo> getProfile() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': _signResult?.token,
    };

    final response = await http.get(
      baseUrl + '/profile/${_signResult?.userId}/0/community',
      headers: headers,
    );

    if (response.statusCode != 200) {
      return null;
    }

    final data = json.decode(response.body);

    List<PostInfo> posts = List<PostInfo>();
    for (var post in data['posts']) {
      posts.add(PostInfo(
        post['id'],
        DateTime.parse(post['createdDate']),
        post['userId'],
        post['nickName'],
        post['tags'],
        post['photo'],
        post['title'],
        post['content'],
        post['likeCount'],
        post['commentCount'],
      ));
    }

    return ProfileInfo(
      data['userId'],
      data['userImage'],
      data['nickName'],
      data['farmImage'],
      data['phoneNum'],
      data['introduction'],
      posts,
    );
  }
}
