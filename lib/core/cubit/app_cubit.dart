import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:information/core/cubit/app_state.dart';
import 'package:information/core/data/advicer_data.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  AppData adviceData = AppData();

  static AppCubit get(context) => BlocProvider.of(context);

  Future<void> getAdviceCubit() async {
    emit(AppLoading());
    try {
      final advice = await adviceData.getAdvice();
      emit(AdviceSuccess(advice));
    } catch (e) {
      emit(AdviceError("error"));
    }
  }

  Future<void> getQuoteCubit() async {
    emit(AppLoading());
    try {
      final advice = await adviceData.getAdvice();
      emit(QuoteSuccess(advice));
    } catch (e) {
      emit(QuoteError("Something went wrong"));
    }
  }

  Future<void> loadFact() async {
    emit(AppLoading());
    try {
      final fact = await adviceData.getRandomFact();
      emit(CatSuccess(fact));
    } catch (e) {
      emit(QuoteError("Something went wrong"));
    }
  }
}
