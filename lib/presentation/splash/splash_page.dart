import 'package:TMDBFlutter/infrastructore/secret_loader.dart';
import 'package:flutter/material.dart';
import '../core/presentation_utils.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 8),
            Text(context.s.nowLoading),
          ],
        ),
      ),
    );
  }
}
