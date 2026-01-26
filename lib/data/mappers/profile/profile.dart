import 'package:todo_list/data/models/profile/profile_response.dart';
import 'package:todo_list/domain/entities/profile/profile_response.dart';

class ProfileMapper {
  static ProfileResponseEntity toProfileEntity(ProfileResponseModel profile) {
    return ProfileResponseEntity(
      id: profile.id,
      email: profile.email,
      name: profile.name,
      role: profile.role,
      avatar: profile.avatar,
      creationAt: profile.creationAt,
      updatedAt: profile.updatedAt,
    );
  }
}
