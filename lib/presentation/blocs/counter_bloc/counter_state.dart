part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactioCount;

  const CounterState({this.counter = 0, this.transactioCount = 0});

  CounterState copyWith({int? counter, int? transactioCount}) => CounterState(
      counter: counter ?? this.counter,
      transactioCount: transactioCount ?? this.transactioCount);

  @override
  List<Object> get props => [counter, transactioCount];
}
