import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  // altpajswl
  final String category;
  // 아이콘 위치
  final String imgPath;

  // 오염 정도
  final String level;

  // 오염 수치
  final String stat;

  const MainStat({
    super.key,
    required this.category,
    required this.imgPath,
    required this.level,
    required this.stat,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          category,
        ),
        Image(
          image: AssetImage(
            imgPath,
          ),
        ),
        Text(
          level,
        ),
        Text(
          stat,
        ),
      ],
    );
  }
}
