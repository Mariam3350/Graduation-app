import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostcalapp/Bloc/lostPeopleState.dart';

class YourLostScreen extends StatelessWidget {
  const YourLostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Your lost')),
        body: BlocBuilder<LostPeopleCubit, LostPeopleState>(
          builder: (context, state) {
            if (state is LostPeopleInitial) {
              context.read<LostPeopleCubit>().getMyLostPeople();
            }
            if (state is LostPeopleLoading) {
              return const CircularProgressIndicator();
            }
            if (state is LostPeopleLoaded) {
              return ListView(
                  children: state.lostPeople
                      .map(
                        (person) => ListTile(
                          title: Text(person.name),
                          leading: Image.network(person.imageUrl),
                          subtitle: Column(
                            children: [
                              Text("Address : ${person.address}"),
                              Text("Email : ${person.email}"),
                              Text("Phone number : ${person.phoneNumber}"),
                            ],
                          ),
                        ),
                      )
                      .toList());
            } else if (state is LostPeopleError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text(""));
            }
          },
        ));
  }
}
