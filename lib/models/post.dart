class Post {
  final int id;
  final String postname;
  final String contents;
  final String mainphoto;

  Post({
    required this.id,
    required this.postname,
    required this.contents,
    required this.mainphoto,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      postname: json['postname'],
      contents: json['contents'],
      mainphoto: json['mainphoto'],
    );
  }

  dynamic toJson() => {
        'postname': postname,
        'contents': contents,
        'mainphoto': mainphoto,
      };
}
