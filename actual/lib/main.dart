import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const _App(),
  );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: 'NotoSans',
      ),
      //home: const RootTab(),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
        ),
      ),
    );
  }
}
