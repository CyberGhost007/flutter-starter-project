import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/config/apis.dart';
import 'package:flutter_app/src/config/const.dart';
import 'package:flutter_app/src/config/enums.dart';
import 'package:flutter_app/src/config/http_status_codes.dart';
import 'package:flutter_app/src/models/post_model.dart';
import 'package:flutter_app/src/services/dio/dio_service.dart';
import 'package:provider/provider.dart';

class PostProvider with ChangeNotifier {
  Response? _response;
  AuthStateEnum? _state = AuthStateEnum.loading;
  final List<PostModel> _allPosts = [];

  Future<void> getAllPosts() async {
    try {
      _response = await DioConfig().dioServe(
        hasAuth: false,
        url: APIs.posts,
        httpMethod: HttpMethod.get,
      );

      if (_response != null) {
        if (_response!.statusCode == status200OK ||
            _response!.statusCode == status202Accepted) {
          List tempPosts = _response?.data;
          _allPosts.addAll(
            tempPosts.map((e) => PostModel.fromJson(e)).toList(),
          );
          _state = AuthStateEnum.success;
          notifyListeners();
        } else {
          if (_response!.statusCode == status400BadRequest) {
            _state = AuthStateEnum.failed;
            notifyListeners();
          }
          if (_response!.statusCode == status401Unauthorized) {
            _state = AuthStateEnum.error;
            notifyListeners();
          }
          if (_response!.statusCode == status404NotFound) {
            _state = AuthStateEnum.failed;
            notifyListeners();
          }
        }
      } else {
        _state = AuthStateEnum.failed;
        notifyListeners();
      }
    } on DioError catch (_) {
      _state = AuthStateEnum.failed;
      notifyListeners();
    }
  }

  // [Just an example to show how to get single post]
  Future<void> getSinglePost(String id) async {
    try {
      _response = await DioConfig().dioServe(
        hasAuth: true,
        url: APIs.singlePost.replaceFirst('{id}', id),
        httpMethod: HttpMethod.get,
      );

      if (_response != null) {
        if (_response!.statusCode == status200OK ||
            _response!.statusCode == status202Accepted) {
          var post = PostModel.fromJson(_response?.data);
          log(post.title!);

          _state = AuthStateEnum.success;
          notifyListeners();
        } else {
          if (_response!.statusCode == status400BadRequest) {
            _state = AuthStateEnum.failed;
            notifyListeners();
          }
          if (_response!.statusCode == status401Unauthorized) {
            _state = AuthStateEnum.error;
            notifyListeners();
          }
          if (_response!.statusCode == status404NotFound) {
            _state = AuthStateEnum.failed;
            notifyListeners();
          }
        }
      } else {
        _state = AuthStateEnum.failed;
        notifyListeners();
      }
    } on DioError catch (_) {
      _state = AuthStateEnum.failed;
      notifyListeners();
    }
  }

  // To change the state of a given provider to loading
  void changeStateToLoading() {
    _state = AuthStateEnum.loading;
    notifyListeners();
  }

  // Exposing Values
  AuthStateEnum? get state => _state;
  List<PostModel> get allPosts => _allPosts;

  static PostProvider of({bool listen = false}) => Provider.of<PostProvider>(
        Const.globalKey.currentContext!,
        listen: listen,
      );
}
