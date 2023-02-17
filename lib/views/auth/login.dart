import 'package:demo_domesco/widgets/auth/input_field.dart';
import 'package:demo_domesco/widgets/auth/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/logo/logo_lauchers.png",
              width: 160.h,
              height: 160.h,
            ),
            SizedBox(height: 80.h),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 32.w),
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(fontSize: 24.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            const InputField(
                hint: "Tên đăng nhập", iconData: CupertinoIcons.person),
            const InputField(
                hint: "Mật khẩu", iconData: Icons.lock, isPasswordField: true),
            forgotPassword(),
            const LoginButton(title: "Đăng nhập", color: Colors.blue),
            socialLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget socialLoginButton() {
    return SizedBox(height: 220.h);
  }

  Widget forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 32.w, top: 8.w, bottom: 8.h),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
