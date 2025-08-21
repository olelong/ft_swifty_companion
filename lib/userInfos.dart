class UserInfos {
  final String user;
  // id for other requests
  final String username;
  final String email;
  final String picture;
  final int wallet;
  final double? level;
  final skills;
  // userSkills(level, percentage),
  // projects including fail ones
  // final String[finalMark: "", status: "", validated: "", name: ""] projects;

  UserInfos({
    required this.user,
    required this.username,
    required this.email,
    required this.picture,
    required this.wallet,
    required this.level,
    required this.skills,
  });

  static Map<String, dynamic>? _getCursus(List<dynamic> cursus) {
    if (cursus.isEmpty) return null;
    if (cursus.length == 1) return cursus.first;

    return cursus.firstWhere(
          (c) => c["grade"] == "Cadet",
      orElse: () => cursus.firstWhere(
            (c) => c["grade"] == "Transcender",
        orElse: () => null,
      ),
    );
  }

  factory UserInfos.fromJson(Map<String, dynamic> json) {
    final cursus = _getCursus(json['cursus_users']);

    final userInfos = UserInfos(
        user: json['login'],
        username: json['usual_full_name'],
        email: json['email'],
        picture: json['image']['link'],
        wallet: json['wallet'],
        level: cursus?["level"],
        skills: cursus?["skills"],
        // projects: json['projects_users'] -> save : ['final mark'], ['validated'], ['project']['name'] juste ceux fini meme failed
    );
    return userInfos;
  }
}