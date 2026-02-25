abstract class UserEvent {}

// When the user physically presses the "Fetch Users" button on the glass,
// the UI will instantiate this exact class and throw it at the BLoC.
class FetchUserPressed extends UserEvent {}
