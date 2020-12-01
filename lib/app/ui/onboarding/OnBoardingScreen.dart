import 'package:flutter/material.dart';

class OnBoadingScreen extends StatefulWidget {
  @override
  _OnBoadingScreenState createState() => _OnBoadingScreenState();
}

class _OnBoadingScreenState extends State<OnBoadingScreen> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildFirstPageContent(
                    image: 'assets/solyric_logo.png',
                    color: Colors.indigoAccent,
                    body: "lorem ipsum bla bla bla"),
                _buildPageContent(
                    image: 'assets/tutorial2-write-the-song.png',
                    color: Colors.amberAccent,
                    body: "lorem ipsum bla bla bla"),
                _buildPageContent(
                    image: 'assets/tutorial2-write-the-song.png',
                    color: Colors.blueAccent,
                    body: "lorem ipsum azul aszul"),
                _buildPageContent(
                    image: 'assets/tutorial2-write-the-song.png',
                    color: Colors.greenAccent,
                    body: "lorem ipsum verde verde"),
              ],
            ),
            Positioned(
              top: 40,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/solyric_logo.png',
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ),
                    InkWell(
                      onTap: () => print('Skippp'),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 40,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  // alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < _totalPages; i++)
                          i == _currentPage
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false)
                      ]),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildFirstPageContent({String image, Color color, String body}) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(image),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            body,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildPageContent({String image, Color color, String body}) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(image),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            body,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isCurrentPage ? 20.0 : 8.0,
      width: isCurrentPage ? 20.0 : 8.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
