import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_bloc.dart';
import 'network/api_client.dart';
import 'repositories/user_repository.dart';
import 'ui/user_screen.dart';

void main() {
  // 1. Boot up the network tool (The Pipe)
  final apiClient = ApiClient();

  // 2. Hand the tool to the Worker (The Foreman)
  final userRepository = UserRepository(apiClient);

  // 3. Command the GPU to take over the screen!
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        // 4. We plug the BLoC into the wall outlet here.
        // We hand the Foreman to the BLoC so it can fetch the data.
        create: (context) => UserBloc(userRepository),
        // 5. The UserScreen can now simply listen to the BLoC!
        child: const UserScreen(),
      ),
    ),
  );
}
