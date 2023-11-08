import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:get/get.dart';

void logout() {
  final userController = Get.find<UserController>();
  // 1. 로그인 정보 삭제
  var userLogout = {
        'login_success': false,
        'authorization': null,
        'refresh_token': null,
        'clout_or_adv': null,
  };
  userController.setUserLogin(userLogout);
  
  // 2. 유저 정보 삭제
  userController.setUserId(null);
  userController.setPassword(null);
  userController.setUserInfo();
  
  // 3. 리디렉션 또는 홈으로 이동
  
}
