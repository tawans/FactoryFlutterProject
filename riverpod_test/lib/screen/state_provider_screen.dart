import 'dart:io';

import 'package:flutter/material.dart';
import 'package:riverpod_test/layout/default_Layout.dart';

class StateProviderScreen extends StatelessWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final df = Platform.version;
    return DefaultLayout(
      title: 'StateProviderScreen',
      body: Column(
        children: [
          Text(df),
        ],
      ),
    );
  }
}
