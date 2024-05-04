import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:lostcalapp/Config/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define the events
abstract class UpdateProfileEvent {}

class UpdateUsernameEvent extends UpdateProfileEvent {
  final String username;

  UpdateUsernameEvent(this.username);
}

class UpdatePasswordEvent extends UpdateProfileEvent {
  final String password;

  UpdatePasswordEvent(this.password);
}

// Define the states
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileError extends UpdateProfileState {
  final String message;

  UpdateProfileError(this.message);
}

class UpdateProfileSuccess extends UpdateProfileState {}

// Define the Cubit
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final Dio _dio = Dio(); // Initialize Dio instance

  UpdateProfileCubit() : super(UpdateProfileInitial());

  Future<void> updateUsername(String username) async {
    if (username.isEmpty) emit(UpdateProfileError("Username is empty"));
    emit(UpdateProfileLoading());
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      // Make API call to update username
      Response response = await _dio.patch(
        Endpoints.updateUsernameEndpoint,
        options: Options(
            headers: {'Authorization': 'Bearer ${preferences.get("token")}'}),
        data: {'username': username},
      );
      print(response);
      // Check response and emit corresponding state
      if (response.statusCode == 200) {
        emit(UpdateProfileSuccess());
      } else {
        emit(UpdateProfileError('Failed to update username'));
      }
    } catch (e) {
      emit(UpdateProfileError('An error occurred'));
      print(e);
    }
  }

  Future<void> updatePassword(
      {required String password,
      required String currentPassword,
      required String newPasswordConfirmation}) async {
    emit(UpdateProfileLoading());
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      // Make API call to update password
      Response response = await _dio.patch(
        Endpoints.updatePasswordEndpoint,
        options: Options(
            headers: {'Authorization': 'Bearer ${preferences.get("token")}'}),
        data: {
          'password': password,
          'passwordCurrent': currentPassword,
          'passwordConfirm': newPasswordConfirmation
        },
      );

      // Check response and emit corresponding state
      if (response.statusCode == 200) {
        emit(UpdateProfileSuccess());
        await preferences.setString("token", response.data['token']);
      } else {
        emit(UpdateProfileError('Failed to update password'));
      }
    } catch (e) {
      emit(UpdateProfileError('An error occurred'));
      print(e);
    }
  }
}
