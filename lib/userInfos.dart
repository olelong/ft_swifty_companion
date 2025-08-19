class UserInfos {
  final String user;
  // id for other requests
  final String username;
  final String email;
  final String picture;
  final int wallet;
  final double? level;
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
  });

  static double? _getLevel(List<dynamic> cursus) {
    if (cursus.isEmpty) return null;
    if (cursus.length == 1) return cursus.first["level"];

    var cadet = cursus.any((c) => c["grade"] == "Cadet")
        ? cursus.firstWhere((c) => c["grade"] == "Cadet")
        : null;
    if (cadet != null) return cadet["level"];

    var transcender = cursus.any((c) => c["grade"] == "Transcender")
        ? cursus.firstWhere((c) => c["grade"] == "Transcender")
        : null;
    if (transcender != null) return transcender["level"];

    return null;
  }

  factory UserInfos.fromJson(Map<String, dynamic> json) {
    final userInfos = UserInfos(
        user: json['login'],
        username: json['usual_full_name'],
        email: json['email'],
        picture: json['image']['link'],
        wallet: json['wallet'],
        level: _getLevel(json['cursus_users']),
        // level: json['cursus_users -> id qui correspond au cursus -> name : 42cursus genre moi c est 77465 au lieu de mon id 62987-> level'],
        // skills: json['cursus_users -> id qui correspond au cursus -> name : 42cursus genre moi c est 77465 au lieu de mon id 62987-> skills'],
        // projects: json['projects_users'] -> save : ['final mark'], ['status'], ['validated'], ['project']['name']
    );
    return userInfos;
  }
}