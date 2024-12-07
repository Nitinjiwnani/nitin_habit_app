import 'package:equatable/equatable.dart';

abstract class QuotesEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadQuotes extends QuotesEvent {}