import 'package:fine_dust/const/color.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
      color: Colors.white,
      fontSize: 30,
    );

    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  '서울',
                  style: ts.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DateTime.now().toString(),
                  style: ts.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/img/mediocre.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: 20),
                Text(
                  '보통',
                  style: ts.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  '나쁘지 않네요!',
                  style: ts.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
