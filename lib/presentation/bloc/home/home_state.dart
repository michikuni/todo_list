import 'package:formz/formz.dart';

class HomeState{
  final int id;
  final String email;
  final String name;
  final String avatar;
  final FormzSubmissionStatus status;
  const HomeState({this.name = '', this.id = 1, this.email = '', this.avatar = '', this.status = FormzSubmissionStatus.initial});
  HomeState copyWith({
    int? id,
    String? email,
    String? name,
    String? avatar,
    FormzSubmissionStatus? status
  }){
    return HomeState(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      status: status ?? this.status
    );
  }
}