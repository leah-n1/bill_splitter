
import 'package:get/get.dart';
import 'package:get_x/data/model/profile.dart';

import 'package:get_x/data/provider/network/base_service.dart';

class LoginScreenController extends GetxController {
 

  final count = 0.obs;
final RxString numOneFriend=''.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile("https://run.mocky.io/v3/43056ad7-29da-4877-a8e2-27c2871b5eb9");
  }

  @override
  onReady() {
    getProfile("https://run.mocky.io/v3/43056ad7-29da-4877-a8e2-27c2871b5eb9");
  }

fetchProfile() async {
  var returnValue= await getProfile("https://run.mocky.io/v3/43056ad7-29da-4877-a8e2-27c2871b5eb9");
print(returnValue);
numOneFriend.value= returnValue;
}


Future<String> getProfile (String url) async {
  var data = await AuthProvider().getProfile(url);
  var response = data.body['profile'];
  var profile = Profile.fromMap(response);
  // print (profile.friends);
  return profile.friends[0].name;
  }
  
  void increment() => count.value++;
  }


  class AuthProvider extends BaseService{
    Future<Response> logIn (String url, Map<String, dynamic> param) async {
      final requestHeaders = {
    'Content-Type' : 'application/json',
      };
    return get(
      url,
      headers: requestHeaders,
    );  
 }

  
    Future<Response> getProfile (String url) async {
      final requestHeaders = {
    'Content-Type' : 'application/json',
      };
    return get(
      '$url',
      headers: requestHeaders,
    );  
  }
}





