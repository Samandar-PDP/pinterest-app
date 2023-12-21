import 'package:pinterest_app/model/collection_response.dart';
import 'package:pinterest_app/model/image_response.dart';
import 'package:pinterest_app/service/api_service.dart';

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
}