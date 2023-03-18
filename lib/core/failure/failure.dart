abstract class Failure {
  String message;

  Failure({required this.message});
}

class RemoteFailure implements Failure {
  String message;

  RemoteFailure({required this.message});
}
