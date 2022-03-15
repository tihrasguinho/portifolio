import 'package:flutter/material.dart';
import 'package:tihrasguinho/src/widgets/web_image.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;

    return Scaffold(
      body: WebImage.asset(
        'assets/the_office.jpg',
        alt: 'The Office',
        width: 512,
        height: 420,
      ),
    );
  }
}
