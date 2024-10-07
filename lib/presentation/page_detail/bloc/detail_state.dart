part of 'detail_bloc.dart';

class DetailState extends Equatable {
  final int count;

  const DetailState(this.count);

  @override
  List<Object?> get props => [count];
}
