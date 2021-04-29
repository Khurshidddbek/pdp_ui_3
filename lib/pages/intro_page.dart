import 'package:flutter/material.dart';
import 'package:pdp_ui_3/pages/home_page.dart';
import 'package:pdp_ui_3/utils/Strings.dart';

class IntroPage extends StatefulWidget {
  static final String id = 'intro_page';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int currentPage = 0;

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // #Content
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                makeContent(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent,
                ),
                makeContent(
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent,
                ),
                makeContent(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                ),
              ],
            ),
            // #indicator
            Container(
              height: 25,
              padding: EdgeInsets.only(right: 30, left: 30),
              margin: EdgeInsets.only(
                bottom: 60,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildIndicator(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FadeTransition(
                      opacity: _animation,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (currentPage == 2)
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, Homepage.id);
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          else
                            Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeContent({image, title, content}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // #title
          Text(
            title,
            style: TextStyle(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: 20,
          ),

          // #content
          Text(
            content,
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            height: 20,
          ),

          // #image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isAcitive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isAcitive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentPage == i) {
        indicators.add(_indicator(true));
      } else
        indicators.add(_indicator(false));
    }

    if (currentPage == 2) {
      _animationController.forward();
    }

    return indicators;
  }
}
