// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  // Adding list view instead of container 
                  
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        coachApp(),
                        SizedBox(
                          width: screenSize.width * 0.1,
                        ),
                        duitStores(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 15,
                  ),
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
                  aboutMe(),
                  SizedBox(
                    height: screenSize.height / 10,
                  ),
                  bottomBar()
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Resumé',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: _resumeLink,
        icon: Icon(
          Icons.document_scanner_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 4.0,
              color: Colors.blue,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  /// Widgets

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
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: _coachApp,
        child: SizedBox(
          width: screenSize.width * 0.35,
          height: screenSize.height * 0.5,
          child: Stack(children: [
            Positioned(
                bottom: 1,
                right: 1,
                child: IconButton(
                    onPressed: _coachAppGitHub,
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      color: Colors.black,
                    ))),
            Column(
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
                  "Fitness app created using flutter and firebase in Spanish language, with mutiple functionalities like gallery view, alarm, diet maintenance, weight tracker etc. ",
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget duitStores() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: _duitStore,
        child: SizedBox(
          width: screenSize.width * 0.35,
          height: screenSize.height * 0.5,
          child: Stack(children: [
            Positioned(
                bottom: 1,
                right: 1,
                child: IconButton(
                    onPressed: _duitStoresGitHub,
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      color: Colors.black,
                    ))),
            Column(
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
                  "Software Engineering intern in android app development in flutter from scratch. Basically, the main motive of this app is to make all local stores online and hasslefree daily shopping",
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget aboutMe() {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width / 6),
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get In Touch',
              maxLines: 1,
              style: TextStyle(fontSize: 32, color: Colors.black54),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.home_work,
                  size: 32,
                  color: Colors.black38,
                ),
                SizedBox(
                  width: screenSize.width * 0.02,
                ),
                Text(
                  'Shanti Kunj, Road No. 04,\nEast Indira Nagar, Kankarbagh, \nPatna - 800020',
                  style: TextStyle(color: Colors.black38, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone_android_sharp,
                  size: 32,
                  color: Colors.black38,
                ),
                SizedBox(
                  width: screenSize.width * 0.02,
                ),
                Text(
                  '+91-88738-53869',
                  style: TextStyle(color: Colors.black38, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            InkWell(
              onTap: _emailTo,
              child: Row(
                children: [
                  Icon(
                    Icons.email_sharp,
                    size: 32,
                    color: Colors.black38,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.02,
                  ),
                  Text(
                    'satyamsinha9404@ducic.ac.in',
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 20,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    var screenSize = MediaQuery.of(context).size;
    //const speed = Duration(milliseconds: 200);
    return Container(
        height: screenSize.height / 3,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.zero),
            image: DecorationImage(
              image: AssetImage(
                'assets/background.jpg',
              ),
              fit: BoxFit.cover,
            )),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon:
                          FaIcon(FontAwesomeIcons.twitter, color: Colors.blue),
                      onPressed: _twitter),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.github,
                          color: Colors.white54),
                      onPressed: _github),
                  IconButton(
                      icon:
                          FaIcon(FontAwesomeIcons.linkedin, color: Colors.blue),
                      onPressed: _linkedIn),
                  IconButton(
                      icon: Icon(Icons.email_sharp, color: Colors.white54),
                      onPressed: _emailTo),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'It\'s a Bird | It\'s a Plane | It\'s SATSIN06',
              style: TextStyle(color: Colors.white54),
            )
          ],
        ));
  }

  /// URL Links

  _resumeLink() async {
    const url =
        'https://drive.google.com/file/d/1ds7cjmyOdOIdTiHM1Pvqlg0F9v22X3am/view?usp=sharing';
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

  _duitStore() async {
    const url =
        'https://docs.google.com/document/d/1s056qAW1inmFRQFeBsFL9y48kxqYOsCYiEXvRP7obLY/edit?usp=sharing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _emailTo() async {
    const url = 'mailto:satyamsinha9404@ducic.ac.in';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _twitter() async {
    const url = 'https://twitter.com/satyamsinha9404';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _github() async {
    const url = 'https://github.com/satsin06';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _linkedIn() async {
    const url = 'https://www.linkedin.com/in/satyam-sinha-a0b2b6169/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _coachAppGitHub() async {
    const url = 'https://github.com/satsin06/coach_app';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _duitStoresGitHub() async {
    const url = 'https://github.com/satsin06/duit-stores';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
