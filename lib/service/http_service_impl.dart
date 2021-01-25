import 'package:dio/dio.dart';
import 'http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "9dfa7b4a09a84a4cacd2edac20b1c43e";

class HttpServiceImpl implements HttpService{

  Dio _dio;

  @override
  Future<Response> getRequest(String url) async{

    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error){
        print(error.message);
      },
      onRequest: (request){
        print("${request.method} | ${request.path}");
      },
      onResponse: (response){
        print("${response.statusCode} ${response.statusMessage} ${response.data}");
      }
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: {"Authorization" : "Bearer $API_KEY"}
    ));

    initializeInterceptors();
  }

}