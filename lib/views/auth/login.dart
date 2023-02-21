import 'package:demo_domesco/blocs/auth/auth_cubit.dart';
import 'package:demo_domesco/blocs/auth/auth_state.dart';
import 'package:demo_domesco/views/home/home_page.dart';
import 'package:demo_domesco/widgets/auth/input_field.dart';
import 'package:demo_domesco/widgets/auth/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      body: BlocListener(
        bloc: _authCubit,
        listener: (context, state) {
          if (state is Login) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) => false);
          } else if (state is LoginFailed) {
            Fluttertoast.showToast(
                msg: "Login failed",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        child: GestureDetector(
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
