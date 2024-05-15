import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/bloc/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  void increaseValue(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) =>
            Text("Modificaciones ${value.state.transactionCount}")),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        // buildWhen: (previous, current) => previous.counter != current.counter,
        builder: (context, state) {
          print("El contador cambio");
          return Center(
            child: Text("Counter value: ${state.counter}"),
          );
        },
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: '3',
          child: const Text('+3'),
          onPressed: () {
            increaseValue(context, 3);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        FloatingActionButton(
          heroTag: '2',
          child: const Text('+2'),
          onPressed: () {
            increaseValue(context, 2);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        FloatingActionButton(
          heroTag: '1',
          child: const Text('+1'),
          onPressed: () {
            increaseValue(context);
          },
        ),
      ]),
    );
  }
}
