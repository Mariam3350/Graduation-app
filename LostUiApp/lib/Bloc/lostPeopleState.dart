import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:lostcalapp/Config/endpoints.dart';
import 'package:lostcalapp/Models/lost_person.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define the events
abstract class LostPeopleEvent {}

class GetAllLostPeopleEvent extends LostPeopleEvent {}

class GetMyLostPeopleEvent extends LostPeopleEvent {}

// Define the states
abstract class LostPeopleState {}

class LostPeopleInitial extends LostPeopleState {}

class LostPeopleLoading extends LostPeopleState {}

class LostPeopleError extends LostPeopleState {
  final String message;
  LostPeopleError(this.message);
}

class LostPeopleLoaded extends LostPeopleState {
  final List<LostPerson> lostPeople;

  LostPeopleLoaded(this.lostPeople);
}

class SearchLostPersonEvent extends LostPeopleEvent {
  final String query;

  SearchLostPersonEvent(this.query);
}

// Define the Cubit
class LostPeopleCubit extends Cubit<LostPeopleState> {
  LostPeopleCubit() : super(LostPeopleInitial());

  final Dio _dio = Dio(); // Initialize Dio instance

  Future<void> getYourFound() async {
    emit(LostPeopleLoading());
    print('object');
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      print(preferences.get("token"));
      // Make API call to get all lost people
      Response response = await _dio.get(
          options: Options(
              headers: {'Authorization': 'Bearer ${preferences.get("token")}'}),
          Endpoints.getYourFound);

      // Check response and emit corresponding state
      if (response.statusCode == 200) {
        List<LostPerson> lostPeople = []; // List to store lost people
        // Parse response and create Person objects
        for (var personData in response.data) {
          lostPeople.add(
            LostPerson(
              name: personData['name'],
              email: personData['email'],
              imageUrl: personData['img'],
              address: personData['address'],
              phoneNumber: personData['phoneNumber'],
            ),
          );
        }
        emit(LostPeopleLoaded(lostPeople));
      } else {
        emit(LostPeopleError('Failed to fetch found people'));
      }
    } catch (e) {
      emit(LostPeopleError('Failed to fetch found people'));
      print(e);
    }
  }

  Future<void> getMyLostPeople() async {
    emit(LostPeopleLoading());
    try {
      // Make API call to get your lost people
      SharedPreferences preferences = await SharedPreferences.getInstance();

      Response response = await _dio.get(
        options: Options(
            headers: {'Authorization': 'Bearer ${preferences.get("token")}'}),
        Endpoints.getMyLost,
      );
      // Check response and emit corresponding state
      if (response.statusCode == 200) {
        List<LostPerson> lostPeople = []; // List to store lost people
        // Parse response and create Person objects
        for (var personData in response.data) {
          lostPeople.add(
            LostPerson(
              name: personData['name'],
              email: personData['email'],
              imageUrl: personData['img'][0],
              address: personData['address'],
              phoneNumber: personData['phoneNumber'],
            ),
          );
        }
        emit(LostPeopleLoaded(lostPeople));
      } else {
        emit(LostPeopleError('Failed to fetch your lost people'));
      }
    } catch (e) {
      emit(LostPeopleError('An error occurred'));
      print(e);
    }
  }

  Future<void> searchLostPerson(String query) async {
    emit(LostPeopleLoading());
    try {
      // Make API call to search for a lost person
      Response response =
          await _dio.get('${Endpoints.signUpEndpoint}?name=$query');
      // Check response and emit corresponding state
      if (response.statusCode == 200) {
        List<LostPerson> lostPeople = []; // List to store lost people
        // Parse response and create Person objects
        for (var personData in response.data) {
          lostPeople.add(
            LostPerson(
              name: personData['name'],
              email: personData['email'],
              imageUrl: personData['img'],
              address: personData['address'],
              phoneNumber: personData['phoneNumber'],
            ),
          );
        }
        emit(LostPeopleLoaded(lostPeople));
      } else {
        emit(LostPeopleError('Failed to search for the lost person'));
      }
    } catch (e) {
      emit(LostPeopleError('An error occurred'));
    }
  }
}
