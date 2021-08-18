import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fridge/screens/first_page.dart';
import 'package:fridge/screens/signin_page.dart';
import 'package:fridge/screens/signup_page.dart';
import 'package:fridge/screens/home_page.dart';
import 'package:get_storage/get_storage.dart';
import 'models/user.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF000000),
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<User>(() => User());
  await GetStorage.init();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    print({"token": box.read("token")});
    return GetMaterialApp(
        initialRoute: box.hasData('token') ? '/home' : '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => FirstPage(),
          ),
          GetPage(name: '/signin', page: () => SignInPage()),
          GetPage(name: '/signup', page: () => SignUpPage()),
          GetPage(name: '/home', page: () => HomePage()),
        ]);
  }
}
