part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CounterIncrementPressed extends DetailEvent {}

final class CounterDecrementPressed extends DetailEvent {}
