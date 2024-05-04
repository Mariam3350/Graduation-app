import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:lostcalapp/Config/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define the events
abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpEvent(this.email, this.password);
}

// Define the states
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthSuccess extends AuthState {}

// Define the Cubit
class AuthCubit extends Cubit {
  AuthCubit() : super(AuthInitial());

  final Dio dio = Dio(); // Initialize Dio instance
  // Helper function to validate email
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.trim());
  }

  // Helper function to validate password
  bool isValidPassword(String password) {
    return password.length >= 6;
  }

  Future<void> signIn(String email, String password) async {
    if (!isValidPassword(password)) {
      emit(AuthError('Invalid email or password'));
      print('object');
      return;
    }
    emit(AuthLoading());
    try {
      // Make API call to sign in
      Response response = await dio.post(
        Endpoints.signInEndpoint,
        data: {'email': email, 'password': password},
      );

      // Check response and emit corresponding state
      if (response.statusCode == 200) {
        emit(AuthSuccess());
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString("token", response.data['token']);
        print(response);
      } else {
        emit(AuthError('Sign in failed'));
        print('s');
      }
    } catch (e) {
      emit(AuthError('An error occurred'));
      print(e);
    }
  }

  Future<void> signUp(String email, String password, String confirmPassword,
      String username) async {
    if (!isValidEmail(email) || !isValidPassword(password)) {
      emit(AuthError('Invalid email or password'));
      return;
    } else if (password != confirmPassword) {
      emit(AuthError('Confirm Password!'));
      return;
    }
    emit(AuthLoading());
    try {
      // Make API call to sign up
      Response response = await dio.post(
        Endpoints.signUpEndpoint,
        data: {
          'username': username,
          'email': email,
          'password': password,
          'passwordConfirm': confirmPassword,
        },
      );
      // Check response and emit corresponding state
      if (response.statusCode == 200) {
        emit(AuthSuccess());
      } else {
        emit(AuthError('Sign up failed'));
      }
    } catch (e) {
      emit(AuthError('An error occurred'));
    }
  }
}
