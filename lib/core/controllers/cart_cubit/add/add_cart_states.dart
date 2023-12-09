abstract class AddCartStates {}

class AddCartInitial implements AddCartStates {}

class AddCartLoading implements AddCartStates {}

class AddCartFailure implements AddCartStates {
  final String errorMessage;

  AddCartFailure({required this.errorMessage});
}

class AddCartSuccess implements AddCartStates {}
