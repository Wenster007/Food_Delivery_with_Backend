import 'package:food_delivery_with_backend/data/repository/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  final UserRepo userRepo;

  UserController({required this.userRepo});


  void createUser(String email, String pass) {
    userRepo.createAccountUsingEmailPass(email, pass);
  }

  void loginUser(String email, String pass) {
    userRepo.loginUsingEmailPass(email, pass);
  }


}