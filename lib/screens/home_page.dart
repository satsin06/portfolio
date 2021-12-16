// ignore_for_file: prefer_const_constructors

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
                  coachApp(),
                  SizedBox(
                    height: screenSize.height / 15,
                  ),
                  duitStores(),
                  SizedBox(
                    height: screenSize.height / 15,
                  ),
                  bottomBar()
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Resumé'),
        onPressed: _resumeLink,
        icon: Icon(Icons.document_scanner_rounded),
        shape: RoundedRectangleBorder(
            side: BorderSide(
          width: 4.0,
          color: Colors.blue,
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget appBar() {
    var screenSize = MediaQuery.of(context).size;
    const speed = Duration(milliseconds: 200);
    return Container(
        height: screenSize.height / 1.5,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
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
              width: screenSize.width,
              height: screenSize.height / 6,
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I am ',
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText('SATYAM',
                            speed: speed, textStyle: TextStyle(fontSize: 36)),
                        TypewriterAnimatedText('PROGRAMMER',
                            speed: speed, textStyle: TextStyle(fontSize: 36)),
                        TypewriterAnimatedText('DEVELOPER',
                            speed: speed, textStyle: TextStyle(fontSize: 36)),
                        TypewriterAnimatedText("SATSIN06",
                            speed: speed, textStyle: TextStyle(fontSize: 36)),
                      ],
                    ),
                  ],
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

  Widget coachApp() {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width / 6),
        child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: _coachApp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/coachapp.PNG',
                  fit: BoxFit.fill,
                  height: 250,
                  //scale: 4,
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
          ),
        ));
  }

  Widget duitStores() {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width / 6),
        child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: _duitStore,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/duit.JPEG',
                  fit: BoxFit.fill,
                  height: 250,
                  //scale: 4,
                ),
                const SizedBox(
                  height: 16,
                ),
                const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Duit Stores',
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
          ),
        ));
  }

  Widget bottomBar() {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width / 6),
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Text('Get In Touch')
          ],
        ),
      ),
    );
  }

  /// URL Links
  _resumeLink() async {
    const url =
        'https://drive.google.com/file/d/1H8gvog0lNfqWDLZ-VTOxBMkaxa96BRu3/view?usp=sharing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _coachApp() async {
    const url =
        'https://docs.google.com/document/d/1qvgsWfjKIPriRB7wqPqa12bTqp_OLOkxzH6qidQFjCA/edit?usp=sharing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

_duitStore() async {
  const url =
      'https://docs.google.com/document/d/1s056qAW1inmFRQFeBsFL9y48kxqYOsCYiEXvRP7obLY/edit?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
