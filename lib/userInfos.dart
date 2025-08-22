class UserInfos {
  final String user;
  final String username;
  final String email;
  final String picture;
  final int wallet;
  final double? level;
  final skills;
  final projects;

  UserInfos({
    required this.user,
    required this.username,
    required this.email,
    required this.picture,
    required this.wallet,
    required this.level,
    required this.skills,
    required this.projects,
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
    final cursusId = cursus?['cursus_id'];
    final userInfos = UserInfos(
        user: json['login'],
        username: json['usual_full_name'],
        email: json['email'],
        picture: json['image']['link'],
        wallet: json['wallet'],
        level: cursus?["level"],
        skills: cursus?["skills"],
        projects: (json['projects_users'] as List)
        .where((p) => (p['cursus_ids'] as List).contains(cursusId) &&
            p['status'] == 'finished').toList(), // To get only projects for the current cursus and finished ones
    );
    return userInfos;
  }
}