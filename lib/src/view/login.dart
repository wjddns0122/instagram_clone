import 'package:flutter/material.dart';
import 'package:instagram/src/widget/image_data.dart';
import 'package:instagram/src/widget/login_button.dart';
import 'package:instagram/src/widget/login_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(150),
                  colors: [
                Color(0xfff5dfd5),
                Color(0xffd5e1f5),
                Color(0xffd5f5e2)
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _top(),
              _body(),
              _bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _top() {
    return Expanded(
      flex: 3,
      child: Center(
        child: ImageData(
          path: ImagePath.splash,
          width: 200,
        ),
      ),
    );
  }

  Widget _body() {
    return const Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginTextField(
            label: '사용자 이름, 이메일 주소 또는 휴대폰 번호',
          ),
          LoginTextField(label: '비밀번호'),
          LoginButton(
              child: Text(
            '로그인',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }

  Widget _bottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 150,
      ),
    );
  }
}
