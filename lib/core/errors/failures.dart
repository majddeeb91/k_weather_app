abstract class Failure {}

class ServerFailure extends Failure {}

class LocalStorageFailure extends Failure {}

class FetchingLocationFailure extends Failure {
  final String message;
  FetchingLocationFailure(this.message);
  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}
