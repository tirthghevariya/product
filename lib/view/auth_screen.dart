import 'package:flutter/material.dart';
import 'package:product/controller/auth_controller.dart';
import 'package:product/utils/color_utils.dart';
import '../common/common_textfield.dart';
import '../utils/size_utils.dart';
import 'bottom_bar_icon_screen.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int state = 1;
  bool isObscure = true;
  final AuthController authController = AuthController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(children: [
            ClipPath(
              clipper: BezierClipper(state),
              child: Container(
                height: mediaQuery.height * 0.4,
                width: mediaQuery.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                      ColorUtils.lightred,
                      ColorUtils.darkred,
                    ])),
              ),
            ),
            SizeUtils.h3h,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: authController.setUseName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onFieldSubmitted: (submit) {
                        authController.userNameNode.unfocus();
                        FocusScope.of(context)
                            .requestFocus(authController.passwordNode);
                      },
                      focusNode: authController.userNameNode,
                      validator: (Value) {
                        return authController.validateUserName(Value!);
                      },
                      controller: authController.usernameController,
                      decoration: textInputDecoration.copyWith(
                          prefixIcon: const Icon(Icons.person_outlined),
                          labelStyle:
                              TextStyle(color: ColorUtils.grey.withOpacity(.7)),
                          labelText: 'Enter your usernNme'),
                    ),
                    SizeUtils.h3h,
                    TextFormField(
                      obscureText: isObscure,
                      onChanged: authController.setPassword,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: authController.passwordNode,
                      controller: authController.passwordController,
                      validator: ((value) {
                        return authController.validatepassword(value!, context);
                      }),
                      decoration: textInputDecoration.copyWith(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: isObscure == true
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: ColorUtils.grey,
                                  )
                                : const Icon(Icons.visibility,
                                    color: ColorUtils.black),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline),
                          labelStyle:
                              TextStyle(color: ColorUtils.grey.withOpacity(.7)),
                          labelText: 'Enter your password'),
                    ),
                    SizeUtils.h2h,
                    ElevatedButton(
                        onPressed: () {
                          print(Error);
                          // authController.cheakLogin(context);
                          cheakLogin();
                        },
                        child: Text('Login'))
                  ],
                ),
              ),
            ),
          ] // mainAxisAlignment: MainAxisAlignment.center,
              ),
        ));
  }

  void cheakLogin() {
    var isvalid = formkey.currentState!.validate();
    if (isvalid) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomBarMainScreen(
                userName: '${authController.usernameController.text}'),
          ));
    } else {
      print(Error);
    }
  }
}

class BezierClipper extends CustomClipper<Path> {
  final int state;
  BezierClipper(this.state);

  Path _getInitialClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 363.15;
    path.lineTo(
        -0.003999999999997783 * _xScaling, 341.78499999999997 * _yScaling);
    path.cubicTo(
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
      23.461000000000002 * _xScaling,
      363.15099999999995 * _yScaling,
      71.553 * _xScaling,
      363.15099999999995 * _yScaling,
    );
    path.cubicTo(
      119.645 * _xScaling,
      363.15099999999995 * _yScaling,
      142.21699999999998 * _xScaling,
      300.186 * _yScaling,
      203.29500000000002 * _xScaling,
      307.21 * _yScaling,
    );
    path.cubicTo(
      264.373 * _xScaling,
      314.234 * _yScaling,
      282.666 * _xScaling,
      333.47299999999996 * _yScaling,
      338.408 * _xScaling,
      333.47299999999996 * _yScaling,
    );
    path.cubicTo(
      394.15000000000003 * _xScaling,
      333.47299999999996 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
    );
    return path;
  }

  Path _getFinalClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 301.69;
    path.lineTo(-0.003999999999997783 * _xScaling, 217.841 * _yScaling);
    path.cubicTo(
      -0.003999999999997783 * _xScaling,
      217.841 * _yScaling,
      19.14 * _xScaling,
      265.91999999999996 * _yScaling,
      67.233 * _xScaling,
      265.91999999999996 * _yScaling,
    );
    path.cubicTo(
      115.326 * _xScaling,
      265.91999999999996 * _yScaling,
      112.752 * _xScaling,
      234.611 * _yScaling,
      173.83299999999997 * _xScaling,
      241.635 * _yScaling,
    );
    path.cubicTo(
      234.914 * _xScaling,
      248.659 * _yScaling,
      272.866 * _xScaling,
      301.691 * _yScaling,
      328.608 * _xScaling,
      301.691 * _yScaling,
    );
    path.cubicTo(
      384.34999999999997 * _xScaling,
      301.691 * _yScaling,
      413.99600000000004 * _xScaling,
      201.977 * _yScaling,
      413.99600000000004 * _xScaling,
      201.977 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      201.977 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999997783 * _xScaling,
      217.841 * _yScaling,
      -0.003999999999997783 * _xScaling,
      217.841 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) =>
      state == 1 ? _getInitialClip(size) : _getFinalClip(size);
}

class CurvedPainter extends CustomClipper<Path> {
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  getClip(Size size) {
    Path path = Path();

    path.moveTo(size.height * 0, 2);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
