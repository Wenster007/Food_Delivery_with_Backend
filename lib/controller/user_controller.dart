import 'package:food_delivery_with_backend/data/repository/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoading = false;

  void createUser(String email, String pass, String name, String phone) async{
    isLoading = true;
    update();
    await userRepo.createAccountUsingEmailPass(email, pass, name, phone);
    isLoading = false;
    update();
  }

  void loginUser(String email, String pass) async{
    isLoading = true;
    update();
    await userRepo.loginUsingEmailPass(email, pass);
    isLoading = false;
    update();
  }

  void isUserLogin() {
    userRepo.isLogin();
  }

  void logoutUser() {
    userRepo.logout();
  }


}