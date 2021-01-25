import 'package:get/get.dart';
import '../../core/model/article.dart';
import '../../core/model/news_response_model.dart';
import '../../core/repository/news_repo.dart';
import '../../service/http_service.dart';
import '../../service/http_service_impl.dart';

class NewsRepoImpl implements NewsRepo {
  HttpService _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest("/v2/top-headlines?country=us");

      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    try {
      final response = await _httpService.getRequest("/v2/everything?q=$query");

      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
