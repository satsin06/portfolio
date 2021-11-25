import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: Column(
                children: [
                  appBar(),
                  SizedBox(
                    height: screenSize.height / 10,
                  ),
                  myPortfolio(),
                  SizedBox(
                    height: screenSize.height / 15,
                  ),
                  const Divider(
                    thickness: 2.0,
                    height: 10,
                    indent: 30,
                    endIndent: 30,
                  ),
                  SizedBox(
                    height: screenSize.height / 15,
                  ),
                  recentWork(),
                ],
              ),
            ),
          ),
          SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: (1 / 0.85)),
              delegate: SliverChildListDelegate([
                workTile(),
                workTile(),
                workTile(),
              ]))
        ],
      ),
    );
  }

  Widget appBar() {
    var screenSize = MediaQuery.of(context).size;
    const speed = Duration(milliseconds: 200);
    return Container(
        height: screenSize.height / 1.5,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(120),
              bottomRight: Radius.circular(120),
            ),
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
                    //color: Colors.redAccent,
                    color: Colors.blueAccent,
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
                backgroundImage: AssetImage('assets/profile_color.png'),
              ),
            ),
            SizedBox(
              width: screenSize.width / 3,
              //height: 100,
              child: DefaultTextStyle(
                style: const TextStyle(
                  //fontSize: 32,
                  //color: Colors.red,
                  color: Colors.blue,
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
                    color: Colors.blueGrey,
                    fontSize: 28.0,
                    fontFamily: 'Horizon',
                  ),
                ),
              )),
            )
          ],
        ));
  }

  Widget myPortfolio() {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width / 6),
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'My Portfolio',
                maxLines: 1,
                style: TextStyle(fontSize: 36, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'A showcase of my projects and my abilities',
                maxLines: 1,
                style: TextStyle(fontSize: 28, color: Colors.black45),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "My name is Satyam Sinha, I'm a junior at Cluster Innovation Center, University of Delhi, currently pursuing a Bachelor's degree in Information Technology and Mathematical Innovation.",
              style: TextStyle(fontSize: 20, color: Colors.black38),
            ),
          ],
        ),
      ),
    );
  }

  Widget recentWork() {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width / 6),
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: const [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Recent Work',
                maxLines: 1,
                style: TextStyle(fontSize: 32, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget workTile() {
    //var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/coachapp.PNG',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 16,
              ),
              const FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Coach App',
                  maxLines: 1,
                  style: TextStyle(fontSize: 28, color: Colors.black45),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Machine Learning from scratch in Python and Successfully analyzed on the EPL data set.",
                style: TextStyle(fontSize: 16, color: Colors.black38),
              ),
            ],
          ),
        ));
  }

  Widget resumeButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: _resumeLink,
                child: const Text('Resumé'),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  _resumeLink() async {
    const url =
        'https://drive.google.com/file/d/1H8gvog0lNfqWDLZ-VTOxBMkaxa96BRu3/view?usp=sharing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
