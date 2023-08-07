import 'package:fine_dust/const/color.dart';
import 'package:flutter/material.dart';

const regions = [
  '서울',
  '경기',
  '인천',
  '강원',
  '충북',
  '충남',
  '대전',
  '경북',
  '대구',
  '경남',
  '울산',
  '부산',
  '전북',
  '전남',
  '광주',
  '제주',
];

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: darkColor,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                '지역 선택',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ...regions
                .map(
                  (e) => ListTile(
                    tileColor: Colors.white,
                    selectedTileColor: lightColor,
                    selectedColor: Colors.black,
                    selected: e == '서울',
                    onTap: () {},
                    title: Text(
                      e,
                    ),
                  ),
                )
                .toList(),
          ],
        ));
  }
}
