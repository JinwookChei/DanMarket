import 'dart:io';

import 'package:danmarket/models/post.dart';
import 'package:danmarket/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'dart:ffi';
import 'dart:ui' as ui;

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

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
        preferredSize: ui.Size.fromHeight(100.0),
        child: CustomAppBar(),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlideView(),
            MainPageContent(
              title: 'Second Contents',
            ),
            MainPageContent(
              title: 'Third Contents',
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
    return Container(
      height: 450, // 각 컨테이너의 높이를 고정하거나 적절히 조절할 수 있습니다.
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'hello',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: ImageSlideshow(
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
            ),
          )
        ],
      ),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        //const NextPage(title: 'Flutter Demo Home Page')),
                        PostListScreen()),
              );
            },
            child: Padding(
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

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시판'),
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          return ListView.builder(
            itemCount: postProvider.posts.length,
            itemBuilder: (context, index) {
              final post = postProvider.posts[index];
              return ListTile(
                leading: post.imagePath.isNotEmpty
                    ? Image.file(File(post.imagePath), width: 50, height: 50)
                    : null,
                title: Text(post.title),
                subtitle: Text(post.content),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPostScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String? _imagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새 게시물 추가'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: '제목'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: '내용'),
            ),
            SizedBox(height: 10),
            _imagePath != null
                ? Image.file(File(_imagePath!), height: 200)
                : Container(),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('이미지 선택'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _contentController.text.isNotEmpty &&
                    _imagePath != null) {
                  final newPost = Post(
                    postname: _titleController.text,
                    contents: _contentController.text,
                    mainphoto: _imagePath!,
                    id: 9999,
                  );
                  Provider.of<PostProvider>(context, listen: false)
                      .addPost(newPost);
                  Navigator.pop(context);
                }
              },
              child: Text('게시물 추가'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  const NextPage({super.key, required this.title});
  final String title;

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String _message = "EMPTY";

  void sendrequest() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.http('127.0.0.1:8000', '/post');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      _message = jsonResponse[1]['postname'];
    } else {
      //print('Request failed with status: ${response.statusCode}.');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The messsage is : ',
            ),
            Text(
              _message,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendrequest,
        tooltip: 'send request',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
