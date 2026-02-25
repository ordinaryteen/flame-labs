import '../models/user_profile.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserProfile> users;

  UserLoaded(this.users);
}

class UserError extends UserState {
  final String errorMessage;

  UserError(this.errorMessage);
}
