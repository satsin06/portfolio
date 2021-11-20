import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/rendering.dart';

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
                  childAspectRatio: (1 / 0.6)),
              delegate: SliverChildListDelegate([
                workTile(),
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
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            // image: DecorationImage(
            //   image: AssetImage(
            //     'assets/coachapp.PNG',
            //   ),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/coachapp.PNG',
                fit: BoxFit.cover,
              ),
              const Text('Coach App')
            ],
          ),
        )
        // Card(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(16),
        //   ),
        //   color: Colors.black,
        //   child: Stack(
        //     children: [
        //       Image.asset(
        //         'assets/coachapp.PNG',
        //         fit: BoxFit.cover,
        //       ),
        //       Positioned(child: Text('Coach App'))
        //     ],
        //   ),
        //   shadowColor: Colors.blue,
        //   elevation: 20,
        // ),
        );
  }
}
