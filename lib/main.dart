import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DanMarket',
      home: const MainPage(),
      theme: ThemeData(
        //primarySwatch: Colors.blue, 뭔 효과인지 모르겠음.
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomAppBar(),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainPageContent(
              title: 'First Content',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Image.asset(
                'assets/DanMarketLogo.png', // 로고 이미지를 assets 폴더에 추가하세요.
                height: 120.0, // 로고 이미지의 높이를 조정합니다.
                width: 120.0, // 로고 이미지의 너비를 조정합니다.
              ),
              const SizedBox(width: 10.0),
              const Text(
                'My Custom AppBar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(), // 남은 공간을 차지하도록 Spacer 위젯을 사용합니다.
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // 알림 아이콘을 클릭했을 때의 동작을 정의합니다.
                  // 기능 아직 없음
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // 알림 아이콘을 클릭했을 때의 동작을 정의합니다.
                  // 기능 아직 없음
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {
                  // 알림 아이콘을 클릭했을 때의 동작을 정의합니다.
                  // 기능 아직 없음
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSlideView extends StatelessWidget {
  const ImageSlideView({super.key});
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      /// Width of the [ImageSlideshow].
      width: double.infinity,

      /// Height of the [ImageSlideshow].
      height: 400,

      /// The page to show when first creating the [ImageSlideshow].
      initialPage: 0,

      indicatorRadius: 5.0,

      /// The color to paint the indicator.
      indicatorColor: Colors.blue,

      /// The color to paint behind th indicator.
      indicatorBackgroundColor: Colors.white,

      /// Called whenever the page in the center of the viewport changes.
      //onPageChanged: (value) {
      //print('Page changed: $value');
      //},

      /// Auto scroll interval.
      /// Do not auto scroll with null or 0.
      autoPlayInterval: 10000,

      /// Loops back to first slide.
      isLoop: true,

      /// The widgets to display in the [ImageSlideshow].
      /// Add the sample image file into the images folder
      children: [
        Image.asset(
          'assets/BattlePost01.jpg',
          //fit: BoxFit.none,
          width: 50,
          height: 50,
        ),
        Image.asset(
          'assets/BattlePost02.png',
          //fit: BoxFit.none,
          width: 50,
          height: 50,
        ),
        Image.asset(
          'assets/BattlePost03.jpg',
          //fit: BoxFit.none,
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // 각 컨테이너의 높이를 고정하거나 적절히 조절할 수 있습니다.
      color: Colors.blue,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'First Part Content',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
