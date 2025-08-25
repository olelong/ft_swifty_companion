class UserInfos {
  final String user;
  final String? username;
  final String? email;
  final String? picture;
  final int? wallet;
  final double? level;
  final skills;
  final projects;

  UserInfos({
    required this.user,
    this.username,
    this.email,
    this.picture,
    this.wallet,
    this.level,
    this.skills,
    this.projects,
  });

  static Map<String, dynamic>? _getCursus(List<dynamic> cursus) {
    if (cursus.isEmpty) return null;
    if (cursus.length == 1) return cursus.first; // For Pisciner

    return cursus.firstWhere(
          (c) => c["grade"] == "Cadet",
      orElse: () => cursus.firstWhere(
            (c) => c["grade"] == "Transcender",
        orElse: () => cursus.firstWhere(
              (c) => c["grade"] == "Alumni" && c["cursus"]["name"] == "42cursus",
          orElse: () => cursus.firstWhere(
                (c) => c["grade"] == "Alumni" && c["cursus"]["name"] == "42",
            orElse: () => cursus.firstWhere(
                    (c) => c["cursus"]["name"] == "42.zip",
                orElse: () => cursus.first,
            ),
          ),
        ),
      ),
    );
  }

  factory UserInfos.fromJson(Map<String, dynamic> json) {
    final cursus = _getCursus(json['cursus_users'] ?? []);
    final cursusId = cursus?['cursus_id'];
    final userInfos = UserInfos(
        user: json['login'],
        username: json['usual_full_name'] ?? "",
        email: json['email'] ?? "",
        picture: json['image']?['link'],
        wallet: json['wallet'] ?? 0,
        level: (cursus?["level"] ?? 0).toDouble(),
        skills: cursus?["skills"] ?? [],
        projects: (json['projects_users'] as List ?? [])
        .where((p) => (p['cursus_ids'] as List ?? []).contains(cursusId) &&
            p['status'] == 'finished').toList(), // To get only projects for the current cursus and finished ones
    );
    return userInfos;
  }
}