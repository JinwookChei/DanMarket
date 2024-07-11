class Post {
  final String postname;
  final String contents;
  final String mainphoto;

  Post({
    required this.postname,
    required this.contents,
    required this.mainphoto,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postname: json['postname'],
      contents: json['contents'],
      mainphoto: json['mainphoto'],
    );
  }

  Map<String, dynamic> toJson() => {
        'postname': postname,
        'contents': contents,
        'mainphoto': mainphoto,
      };
}
