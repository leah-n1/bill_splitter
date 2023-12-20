import 'package:get/get_connect.dart';

class BaseService extends GetConnect{

init(url) {
  httpClient.baseUrl =url;
  httpClient.timeout = const Duration(seconds:30);

}


}