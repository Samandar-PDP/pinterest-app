import 'package:pinterest_app/model/image_response.dart';
import 'package:pinterest_app/service/api_service.dart';

class Repository {
  final _apiService = ApiService(buildDioClient('https://api.unsplash.com/'));

  Future<List<ImageResponse>> getImageList() async {
    try {
      return await _apiService.getImages();
    } catch(e) {
      print(e);
      return [];
    }
  }
}