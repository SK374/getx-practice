import 'package:get/get.dart';
import '../../../core/repository/news_repo_impl.dart';
import '../../../feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }

}