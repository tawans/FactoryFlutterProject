import 'package:fine_dust/component/main_app_bar.dart';
import 'package:fine_dust/component/main_drawer.dart';
import 'package:fine_dust/component/main_stat.dart';
import 'package:fine_dust/const/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Card(
              color: lightColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('종류별 통계'),
                  MainStat(
                    category: '미세먼지',
                    imgPath: 'assets/img/best.png',
                    level: '최고',
                    stat: 'e',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
