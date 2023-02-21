import 'package:demo_domesco/blocs/visibility_password/visibility_cubit.dart';
import 'package:demo_domesco/blocs/visibility_password/visibility_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final bool isPasswordField;
  final TextEditingController textEditingController;

  const InputField(
      {super.key,
      required this.hint,
      required this.iconData,
      this.isPasswordField = false,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    final VisibilityCubit visibilityCubit = VisibilityCubit();
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 32.w),
        child: isPasswordField
            ? BlocBuilder(
                bloc: visibilityCubit,
                builder: (context, state) {
                  return _getInputWidget(
                      state is Hide,
                      isPasswordField,
                      () => state is Hide
                          ? visibilityCubit.showPass()
                          : visibilityCubit.hidePass());
                })
            : _getInputWidget(false, isPasswordField, null));
  }

  Widget _getInputWidget(
      bool hideText, bool isPasswordField, Function()? callback) {
    return TextField(
      controller: textEditingController,
      textAlignVertical: TextAlignVertical.top,
      obscureText: hideText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          filled: true,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          fillColor: Colors.white,
          hintText: hint,
          prefixIcon: Icon(iconData),
          suffixIcon: isPasswordField
              ? IconButton(
                  onPressed: callback,
                  icon:
                      Icon(hideText ? Icons.visibility : Icons.visibility_off))
              : null),
    );
  }
}
