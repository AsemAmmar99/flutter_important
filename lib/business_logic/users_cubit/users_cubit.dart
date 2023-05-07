// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_important/data/models/users_response.dart';
// import 'package:http/http.dart' as http;
import '../../core/end_points.dart' as end_points;
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  static UsersCubit get(context) => BlocProvider.of<UsersCubit>(context);

  UsersResponse usersResponse = UsersResponse();
  Dio dio = Dio();

  // Future<void> getUsersUsingHTTP() async{
  //
  //   emit(UsersLoadingState());
  //
  //   try {
  //     final http.Response response = await http.get(Uri.parse(end_points.url),);
  //     if (kDebugMode) {
  //       print('http response status code ${response
  //           .statusCode}, http response body ${response.body}');
  //     }
  //     if(response.statusCode == 200){
  //       usersResponse = UsersResponse.fromJson(jsonDecode(response.body));
  //       emit(UsersSuccessState());
  //     }else{
  //       emit(UsersErrorState());
  //     }
  //   }catch(error){
  //     if (kDebugMode) {
  //       print(error);
  //     }
  //     emit(UsersErrorState());
  //   }
  // }

Future<void> getUsersUsingDio() async{

  emit(UsersLoadingState());

  try{
    final Response response = await dio.get(end_points.url,);
        if (kDebugMode) {
          print('dio response status code ${response
              .statusCode}, dio response status message ${response
              .statusMessage}, dio response body ${response.data}');
        }
        if(response.statusCode == 200) {
          usersResponse = UsersResponse.fromJson(response.data);
          emit(UsersSuccessState());
        }else{
          emit(UsersErrorState());
        }
  }catch(error){
    if (kDebugMode) {
            print(error);
          }
          emit(UsersErrorState());
  }
}
}
