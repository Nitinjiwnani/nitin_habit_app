import 'package:equatable/equatable.dart';
import 'package:nitin_habit_app/domain/model/quotes_model.dart';
import 'package:nitin_habit_app/utils/enums.dart';

class QuotesState extends Equatable {
  final QuotesStatus quotesStatus;
  final List<Quotes> quotesList;
  final String message;

  const QuotesState({
    this.quotesStatus = QuotesStatus.loading,
    this.quotesList = const <Quotes>[],
    this.message = '',
  });

  QuotesState copywith({
    QuotesStatus? quotesStatus,
    List<Quotes>? quotesList,
    String? message,
  }) {
    return QuotesState(
      quotesStatus: quotesStatus ?? this.quotesStatus,
      quotesList: quotesList ?? this.quotesList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [quotesStatus, quotesList, message];
}
