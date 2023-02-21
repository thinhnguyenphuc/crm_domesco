import 'package:demo_domesco/blocs/auth/auth_cubit.dart';
import 'package:demo_domesco/blocs/auth/auth_state.dart';
import 'package:demo_domesco/widgets/auth/input_field.dart';
import 'package:demo_domesco/widgets/auth/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  late final AuthCubit _authCubit = AuthCubit();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: BlocBuilder(
          bloc: _authCubit,
          builder: (context, state) {
            if (state is Login) {
              return Container();
            }
            return GestureDetector(
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
                  InputField(
                      hint: "Tên đăng nhập",
                      iconData: CupertinoIcons.person,
                      textEditingController: usernameController),
                  InputField(
                      hint: "Mật khẩu",
                      iconData: Icons.lock,
                      isPasswordField: true,
                      textEditingController: passwordController),
                  Visibility(
                      visible: (state as UnLogin).hasClickLogin,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Container(
                            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 32.w),
                            child: Text("Ten dang nhap hoac mat khau sai"))],
                      )),
                  forgotPassword(),
                  LoginButton(
                      title: "Đăng nhập",
                      color: Colors.blue,
                      callback: () {
                        _authCubit.login(
                            usernameController.text, passwordController.text);
                      }),
                  socialLoginButton(),
                ],
              ),
            );
          }),
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
