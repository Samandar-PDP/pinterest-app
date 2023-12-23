import 'package:pinterest_app/model/collection_response.dart';
import 'package:pinterest_app/model/image_response.dart';
import 'package:pinterest_app/service/api_service.dart';

import '../model/user_response.dart';

class Repository {
  final _apiService = ApiService(buildDioClient('https://api.unsplash.com/'));

  Future<List<Results>> getImageList(String query) async {
    try {
      final result = await _apiService.getImages(query);
      return result.results ?? [];
    } catch(e) {
      print('@@@ $e');
      return [];
    }
  }

  Future<List<CollectionResponse>> getCategoryList() async {
    try {
      final result = await _apiService.getCollections();
      return result;
    } catch(e) {
      print('@@@ $e');
      return [];
    }
  }

  Future<UserResponse?> getUser(String username) async {
    try {
       final user = await _apiService.getProfile(username);
       return user;
    } catch(e) {
      return null;
    }
  }
}