import 'package:demo/home.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isAuthenticated = false;

  Future<void> loginWithoutPassword(String email) async {
    String usermail = email;

    if (email.isEmpty) {
      Get.snackbar('Empty', 'The field is empty');

      return;
    }

    if (usermail == 'demo@gmail.com') {
      isAuthenticated = true;
    }

    if (isAuthenticated) {
      Get.off(()=> Home());
    } else {
      Get.snackbar('loggin failed', 'enter a valid email');
    }
  }
}
