abstract class AddCartStates {}

class AddCartInitil implements AddCartStates {}

class AddCartLoading implements AddCartStates {}

class AddCartFailure implements AddCartStates {
  final String? errorMessage;

  AddCartFailure({this.errorMessage});
}

class AddCartSuccess implements AddCartStates {}
// Getting Cart products states
