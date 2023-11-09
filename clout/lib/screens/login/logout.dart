import 'package:clout/hooks/logout_api.dart';
import 'package:clout/providers/user_controllers/user_controller.dart';
import 'package:get/get.dart';

void logout() async {
  final userController = Get.find<UserController>();
  // 0. api에 전송
  final LogoutApi loginApi = LogoutApi();
  loginApi.postRequest(
    // '/v1/members/logout',
    '/member-service/v1/members/logout',
    userController.userLogin['authorization']);
  // 백에선 auth만 넘기면 자동으로 삭제해 준다네요

  // 1. 로그인 정보 삭제
  var userLogout = {
        'login_success': false,
        'authorization': '',
        'refresh_token': '',
        'clout_or_adv': 0,
  };
  userController.setUserLogin(userLogout);
  
  // 2. 유저 정보 삭제
  userController.setUserId('');
  userController.setPassword('');
  userController.setUserInfo();
  
  // 3. 홈으로 이동
  Get.offAllNamed('/');
  
  
}
