abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AdviceSuccess extends AppState {
  final String advice;
  AdviceSuccess(this.advice);
}

class AdviceError extends AppState {
  final String message;
  AdviceError(this.message);
}

class QuoteSuccess extends AppState {
  final String quote;
  QuoteSuccess(this.quote);
}

class QuoteError extends AppState {
  final String message;
  QuoteError(this.message);
}

class CatSuccess extends AppState {
  final String cat;
  CatSuccess(this.cat);
}

class CatError extends AppState {
  final String message;
  CatError(this.message);
}
