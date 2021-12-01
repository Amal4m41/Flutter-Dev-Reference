import 'package:flutter/material.dart';

//Example comparing using logical pixels and making dimensions independent of screen sizes.

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    print('${SizedConfig.screenHeight}');
    print('${SizedConfig.screenWidth}');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Height : ${SizedConfig.screenHeight}'),
            Text('Width : ${SizedConfig.screenWidth}'),
            Container(
              height: SizedConfig.screenHeight * 0.05,
              width: SizedConfig.screenWidth * 0.75,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class SizedConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
