abstract class ExceptionWeather implements Exception {
  final String messageError;
  ExceptionWeather({
    required this.messageError,
  });
}

class RepositoryExceptionWeather extends ExceptionWeather {
  RepositoryExceptionWeather({required String messageError})
      : super(messageError: messageError);
  @override
  String toString() {
    return messageError;
  }
}
