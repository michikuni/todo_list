class ProfileResponseEntity {
  final String email;
  final String name;
  final String role;
  final String avatar;
  final String creationAt;
  final String updatedAt;
  const ProfileResponseEntity({
    required this.email,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });
}