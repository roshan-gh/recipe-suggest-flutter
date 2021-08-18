import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fridge/constants.dart';
import 'package:fridge/components/buttons.dart';
import 'package:fridge/components/textFields.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/models/user.dart';
import 'package:get/get.dart';
import 'package:fridge/controllers/user_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignInPage extends StatelessWidget {
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<User>(() => User());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: FaIcon(FontAwesomeIcons.chevronLeft)),
                        ),
                        Expanded(
                          flex: 8,
                          child: Text(
                            'Sign In',
                            style: kHeading1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      'asset/images/SignInPageImage.svg',
                      alignment: Alignment.center,
                    ),
                  ),
                  GetBuilder<UserController>(builder: (_) {
                    return InsertTextFlied(
                      width: width,
                      text: 'Username',
                      onChanged: (username) {
                        _.setEmail(username);
                      },
                    );
                  }),
                  GetBuilder<UserController>(builder: (_) {
                    return InsertTextFlied(
                      width: width,
                      text: 'Password',
                      textAction: TextInputAction.done,
                      // onChanged: user.state.setPassword,
                      onChanged: (password) {
                        _.setPassword(password);
                        // Get.find<UserController>().setPassword(password);
                      },
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 35),
                    child: GetBuilder<UserController>(builder: (_) {
                      return MainButton(
                        onPressed: () async {
                          bool res = await _.login();
                          if (res) {
                            Get.toNamed('/home');
                          } else {
                            Alert(
                              context: context,
                              type: AlertType.error,
                              title: "Permission Denied",
                              desc: "Username or Password is incorrect.",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  width: 120,
                                )
                              ],
                            ).show();
                          }
                        },
                        buttonTitle: 'Sign in',
                        fontColor: kTextColor2,
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot your password?',
                        style: ktext2.copyWith(
                          shadows: [
                            Shadow(
                              offset: Offset(3.0, 6.0),
                              blurRadius: 6.0,
                              color: Colors.black.withOpacity(0.25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'OR',
                    style: ktext2.copyWith(
                      shadows: [
                        Shadow(
                          offset: Offset(3.0, 6.0),
                          blurRadius: 6.0,
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                  ),
                  GoogleButton(
                    text: 'Sign in with Google',
                    onPressed: () {},
                  ),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
