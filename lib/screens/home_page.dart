import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: appBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            //topBar(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    var screenSize = MediaQuery.of(context).size;
    const speed = Duration(milliseconds: 200);
    return Container(
        height: screenSize.height / 1.5,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/background.jpg',
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: screenSize.width / 40,
            ),
            AnimatedTextKit(
              totalRepeatCount: 2,
              animatedTexts: [
                TypewriterAnimatedText(
                  'SATYAM SINHA',
                  textStyle: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 500),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
            ),
            // SizedBox(
            //   height: screenSize.width / 16,
            // ),
            SizedBox(
              width: screenSize.width / 3,
              //height: 100,
              child: DefaultTextStyle(
                style: const TextStyle(
                  //fontSize: 32,
                  color: Colors.red,
                ),
                child: SizedBox(
                  height: screenSize.height / 6,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'I am ',
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText('SATYAM', speed: speed),
                            TypewriterAnimatedText('PROGRAMMER', speed: speed),
                            TypewriterAnimatedText('DEVELOPER', speed: speed),
                            TypewriterAnimatedText("SATSIN06", speed: speed),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 500.0,
              child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                'Flutter Developer',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 28.0,
                    fontFamily: 'Horizon',
                ),
              ),
                  )),
            )
          ],
        ));
  }
}
