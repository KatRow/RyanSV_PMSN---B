import 'package:flutter/material.dart';
import 'package:pmsnb1/widgets/loading_modal_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    ScreenUtil.init(context, designSize: const Size(360, 640));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo_itcelaya.jpeg'),
                opacity: .4,
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Positioned(
                      top: 30.h,
                      child: Image.asset(
                        'assets/logo_itc.png',
                        height: 250.h,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email User',
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password User',
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.generalLogin,
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        Future.delayed(Duration(milliseconds: 4000)).then(
                          (value) {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushNamed(context, '/dash');
                          },
                        );
                      },
                    ),
                    SizedBox(height: 15.h),
                    const Text('or'),
                    SizedBox(height: 15.h),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.google,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15.h),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.all(20.w),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Crear cuenta :)',
                          style: TextStyle(
                            fontSize: 18.sp / textScaleFactor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h), // Espacio adicional al final
                  ],
                ),
              ),
            ),
          ),
          isLoading ? const LoadingModalWidget() : SizedBox.shrink(),
        ],
      ),
    );
  }
}
