import 'package:flutter/material.dart';
import 'package:fridge/models/user.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              child: Text('LOG OUT'),
              onPressed: () {
                Get.find<User>().logout();
                Get.offAllNamed('/');
              },
            ),
            TextButton(
              child: Text('LOG OUT GOOGLE'),
              onPressed: () {
                Get.find<User>().handleSignOut();
                print('logged out');
                Get.toNamed('/');
              },
            )
          ],
        ),
      ),
    );
  }
}
