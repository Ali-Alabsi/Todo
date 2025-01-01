part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}
final class UsersLoading extends UsersState {}
final class UsersLoaded extends UsersState {}
final class UsersError extends UsersState {}
final class UsersLoadingInsert extends UsersState {}
final class UsersLoadedInsert extends UsersState {}
final class UsersErrorInsert extends UsersState {}
final class UsersLoadingUpdate extends UsersState {}
final class UsersLoadedUpdate extends UsersState {}
final class UsersErrorUpdate extends UsersState {}
final class UsersLoadingImage extends UsersState {}
final class UsersLoadedImage extends UsersState {}

