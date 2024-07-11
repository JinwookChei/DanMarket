import 'dart:io';
import 'package:danmarket/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

// void main() => runApp(const MyApp());
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider()..fetchPost(), // 앱 시작 시 게시물 가져오기
      child: MyApp(),
    ),
  );
}

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlideView(),
            MainPageContent(
              title: '레슨 대강/구인 게시판',
            ),
            Divider(
              thickness: 1,
            ),
            MainPageContent(
              title: '공연 섭외 게시판',
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
      automaticallyImplyLeading: false,
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
      height: 450, // 각 컨테이너의 높이를 고정하거나 적절히 조절할 수 있다.
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '주요행사정보',
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
      color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const PostPage(title: '레슨 대강/구인 게시판')),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'First Part Content',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
          ),
        ),
        body: Consumer<PostProvider>(
          builder: (context, postProvider, child) {
            return ListView.builder(
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                final post = postProvider.posts[index];
                return Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 16.0),
                      leading: Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey,
                        child: post.mainphoto.isNotEmpty &&
                                Uri.parse(post.mainphoto).isAbsolute
                            ? Image.network(
                                post.mainphoto,
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.image_not_supported,
                                size: 80, color: Colors.white),
                      ),
                      title: Text(post.postname),
                      subtitle: Text(post.contents),
                    ),
                    Divider(),
                  ],
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
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        //print(pickedFile.path);
        print(_imageFile!.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _AddPostToServer() async {
    final String postname = _titleController.text;
    final String contents = _contentController.text;

    var request =
        http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:8000/post'));
    request.fields['postname'] = postname;
    request.fields['contents'] = contents;
    if (_imageFile != null) {
      request.files.add(
          await http.MultipartFile.fromPath('mainphoto', _imageFile!.path));
    }

    var response = await request.send();

    if (response.statusCode == 201) {
      print('Model saved successfully');
    } else {
      print('Failed to save model');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            _imageFile != null
                ? Image.file(_imageFile!, height: 200)
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
                    _imageFile != null) {
                  _AddPostToServer();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PostPage(title: '레슨 대강/구인 게시판'),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('입력 오류'),
                      content: Text('제목, 내용, 이미지를 모두 선택해주세요.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('확인'),
                        ),
                      ],
                    ),
                  );
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
