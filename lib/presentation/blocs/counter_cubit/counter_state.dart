part of 'counter_cubit.dart';

// * IMPORTANT: Equatable allow us compare objects and determinate if
// *            they contain the same data in their properties or not

class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0,
    this.transactionCount = 0,
  });

  @override
  List<Object> get props => [ counter, transactionCount ];

  CounterState copyWith({
    int? counter,
    int? transactionCount,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      transactionCount: transactionCount ?? this.transactionCount,
    );
  }

}