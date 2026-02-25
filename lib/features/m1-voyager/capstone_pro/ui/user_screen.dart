import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flame Labs Secure Database'),
        centerTitle: true,
      ),
      // BlocBuilder listens to the Stream and repaints this section of the screen!
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            // STATE 1: Draw a Button
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  // This is the physical trigger! We throw the Event into the BLoC tube.
                  context.read<UserBloc>().add(FetchUserPressed());
                },
                child: const Text('Access Classified Users',
                    style: TextStyle(fontSize: 18)),
              ),
            );
          } else if (state is UserLoading) {
            // STATE 2: Draw a Spinner
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoaded) {
            // STATE 3: Draw the massive List of users
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${user.id}')),
                  title: Text(user.firstName,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle:
                      Text('${user.company.title} at ${user.company.name}'),
                );
              },
            );
          } else if (state is UserError) {
            // STATE 4: Draw the Error Message
            return Center(
              child: Text(
                'CRITICAL ERROR:\n${state.errorMessage}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            );
          }

          // Fallback if something impossible happens
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
