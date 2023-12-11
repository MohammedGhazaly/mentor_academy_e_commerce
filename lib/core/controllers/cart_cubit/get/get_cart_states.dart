abstract class GetCartStates {}

class GetCartInitial implements GetCartStates {}

class GetCartLoading implements GetCartStates {}

class GetCartFailure implements GetCartStates {
  final String? errorMessage;

  GetCartFailure({this.errorMessage});
}

class GetCartSuccess implements GetCartStates {}
// Getting Cart products states
