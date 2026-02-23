import 'models/user_profile.dart';
import 'network/api_client.dart';
import 'repositories/user_repository.dart';

void main() async {
  // 1. We spin up our central Database Engine Tool (The Network layer)
  final apiClient = ApiClient();

  // 2. We give the tool to our Data Worker (The Repository layer)
  final userRepository = UserRepository(apiClient);

  try {
    // 3. The UI (this main function) simply says: "Hey worker, give me the data. I don't care how you get it."
    final List<UserProfile> users = await userRepository.fetchUsers();

    // Everything that happens physically from this line onwards means
    // the UI is safe! We have pure, strictly-typed Dart objects!

    print(
        "\n[Ops]: Isolate fused successfully. Extracted ${users.length} secure profiles.\n");

    for (int i = 0; i < 3; i++) {
      print("================================");
      print("IDENTITY: ${users[i].firstName}");
      print("ROLE: ${users[i].company.title} at ${users[i].company.name}");
      print("================================");
    }

    print("\n[Ops]: Mission Complete. Shutting down connection.");
  } catch (e) {
    print("[CRITICAL UI ERROR]: $e");
  }
}
