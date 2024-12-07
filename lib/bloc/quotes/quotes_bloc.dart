import 'package:bloc/bloc.dart';
import 'package:nitin_habit_app/bloc/quotes/quotes_event.dart';
import 'package:nitin_habit_app/bloc/quotes/quotes_state.dart';
import 'package:nitin_habit_app/data/remote/repository/quotes_repository.dart';
import 'package:nitin_habit_app/utils/enums.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final QuotesRepository quotesRepository;

  QuotesBloc({required this.quotesRepository}) : super(const QuotesState()) {
    on<LoadQuotes>(_loadQuotes);
  }

  Future<void> _loadQuotes(LoadQuotes event, Emitter<QuotesState> emit) async {
    try {
      final quotes = await quotesRepository.fetchQuotes();
      emit(state.copywith(
        quotesStatus: QuotesStatus.success,
        quotesList: quotes,
      ));
    } catch (error) {
      emit(state.copywith(
        quotesStatus: QuotesStatus.failure,
        message: error.toString(),
      ));
    }
  }
}
