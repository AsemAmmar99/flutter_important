part of 'users_cubit.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersSuccessState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersErrorState extends UsersState {}