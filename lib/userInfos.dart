class UserInfos {
  final String user;
  final String username;
  final String email;
  final String picture;
  final String wallet;
  final String level;
  // userSkills(level, percentage),
  // projects including fail ones

  UserInfos({
    required this.user,
    required this.username,
    required this.email,
    required this.picture,
    required this.wallet,
    required this.level,


  });

  factory UserInfos.fromJson(Map<String, dynamic> json) {
    final userInfos = UserInfos(
        user: json['login'],
        username: json['usual_full_name'],
        email: json['email'],
        picture: json['image.link'],
        wallet: json['wallet'],
        // level: json['cursus_users -> id -> level'],

    );
    return userInfos;
  }
}