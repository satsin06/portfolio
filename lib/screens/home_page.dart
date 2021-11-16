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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            topBar(),
          ],
        ),
      ),
    );
  }
  Widget topBar() {
    const speed = Duration(milliseconds: 200);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.52,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedTextKit(
                totalRepeatCount: 1,
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
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 500,
                      height: 100,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('I am ', style: TextStyle(color: Colors.white),),
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
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    width: 500.0,
                    child: Center(
                        child: Text('Flutter Developer', style: TextStyle(
                          color: Colors.white54,
                          fontSize: 28.0,
                          fontFamily: 'Horizon',
                        ),)
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
