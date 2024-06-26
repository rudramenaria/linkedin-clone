import 'package:flutter/material.dart';
import 'package:linkedin_clone/modules/home/model/post.model.dart';
import 'package:linkedin_clone/modules/home/service/post.service.dart';

class PostController extends ChangeNotifier {
  PostService _postService = PostService();
  List<PostModel> _post = [];

  List<PostModel> get post => _post;

  set post(List<PostModel> value) {
    _post = List.from(value);
    notifyListeners();
  }

  Future<void> getPosts() async {
    try {
      dynamic data = await _postService.getPosts();
      post = List<PostModel>.from(data.map((x) => PostModel.fromJson(x)));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
