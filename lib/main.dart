import 'package:flutter/material.dart';

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
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(),
      ),
      body: Center(
        child: Text('Hello, World!'),
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
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(), // 남은 공간을 차지하도록 Spacer 위젯을 사용합니다.
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // 알림 아이콘을 클릭했을 때의 동작을 정의합니다.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
