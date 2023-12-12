// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';
import '../../../../data/model/profile.dart';
import '../../../../data/provider/network/auth_provider.dart';

class LoginScreenController extends GetxController {
  final count = 0.obs;
  final RxString numOneFriend = ''.obs;

  fetchProfile() async {
    var returnValue = await getProfile(
        "https://run.mocky.io/v3/43056ad7-29da-4877-a8e2-27c2871b5eb9");
    numOneFriend.value = returnValue;
  }

  Future<String> getProfile(String url) async {
    var data = await AuthProvider().getProfile(url);
    var response = data.body['profile'];
    var profile = Profile.fromMap(response);

    return profile.friends[0].firstName;
  }

  void increment() => count.value++;
}