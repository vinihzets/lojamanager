abstract class Failure {
  String message;

  Failure({required this.message});
}

class RemoteFailure implements Failure {
  @override
  String message;

  @override
  RemoteFailure({required this.message});
}
