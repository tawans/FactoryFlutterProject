import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFormField(
          onChanged: (Value) {},
          hintText: '이메일을 입력해주세요.',
          //             errorText: '에러가 있습니다.',
        ),
        CustomTextFormField(
          onChanged: (Value) {},
          hintText: '이메일을 입력해주세요.',
          obscureText: true,
          //             errorText: '에러가 있습니다.',
        ),
      ],
    );
  }
}
