import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostcalapp/Bloc/lostPeopleState.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
      ),
      body: BlocProvider(
        create: (context) => LostPeopleCubit(),
        child: BlocBuilder(
          builder: (context, state) {
            context.read<LostPeopleCubit>().getMyLostPeople();
            if (state is LostPeopleLoading) {
              return const CircularProgressIndicator();
            }
            if (state is LostPeopleLoaded) {
              return ListView(
                  children: state.lostPeople
                      .map(
                        (person) => ListTile(
                          title: Text(person.name),
                          subtitle: Column(
                            children: [
                              Text("Address${person.address}"),
                              Text("Email${person.email}"),
                              Text("Phone number${person.phoneNumber}"),
                              
                            ],
                          ),
                        ),
                      )
                      .toList());
            } else {
              return Container(
                child: const Center(child: Text("There's a network error")),
              );
            }
          },
        ),
      ),
    );
  }
}
