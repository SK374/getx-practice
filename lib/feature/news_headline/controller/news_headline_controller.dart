import 'package:get/get.dart';
import '../../../core/repository/news_repo.dart';
import '../../../core/repository/news_repo_impl.dart';
import '../../../core/model/article.dart';

class NewsHeadlineController extends GetxController{
  NewsRepo _newsRepo;

  NewsHeadlineController(){
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  RxList<Article> articles;

  loadNewsLine() async{

    showLoading();

    final result = await _newsRepo.getNewsHeadline();

    hideLoading();

    if(result!= null){
      articles = result.obs;
    }else{
      print("No data recieved");
    }
  }

  showLoading(){
    isLoading.toggle();
  }

  hideLoading(){
    isLoading.toggle();
  }
}