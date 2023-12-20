import 'package:get/get.dart';
import 'package:get_x/data/model/user.dart';
import '../../../../data/provider/network/auth_provider.dart';

class HomeScreenController extends GetxController {
  Rx<User?> userProfile = Rx<User?>(null); // Use Rx<User?> here

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
    getUserProfile('https://run.mocky.io/v3/88395547-651a-4f66-8ead-fac57f2f3646');
  }

  @override
  void onReady() {
    super.onReady();
    fetchProfile();
    getUserProfile('https://run.mocky.io/v3/88395547-651a-4f66-8ead-fac57f2f3646');
  }

  fetchProfile() async {
    try {
      List<User> returnValue = await getUserProfile(
          'https://run.mocky.io/v3/88395547-651a-4f66-8ead-fac57f2f3646');
      if (returnValue.isNotEmpty) {
        userProfile.value = returnValue[0];
      }
    } catch (error) {
      print('Error fetching profile: $error');
    }
  }

  Future<List<User>> getUserProfile(String url) async {
    var data = await AuthProvider().getUser(url);
    var response = data.body['user'];
    var userData = response as Map<String, dynamic>;

    User user = User(
      firstName: userData['firstName'],
      lastName: userData['lastName'],
      id: userData['id'],
      accountNumber: userData['accountNumber'],
      balance: userData['balance'],
    );

    return [user];
  }
}