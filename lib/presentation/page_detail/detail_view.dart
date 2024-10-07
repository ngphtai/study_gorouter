import 'package:flutter/material.dart';
import 'package:study_gorouter/presentation/page_detail/bloc/detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen - $label'),
      ),
      body: Center(child: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocListener<DetailBloc, DetailState>(
                listenWhen: (previous, current) => current.count % 10 == 0,
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("reached ${state.count} !")));
                },
                child: BlocBuilder<DetailBloc, DetailState>(
                  builder: (context, state) {
                    return Text('Details for $label - Counter: ${state.count}',
                        style: Theme.of(context).textTheme.titleLarge);
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              TextButton(
                onPressed: () {
                  context.read<DetailBloc>().add(CounterIncrementPressed());
                },
                child: const Text('Increment counter'),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              TextButton(
                onPressed: () {
                  context.read<DetailBloc>().add(CounterDecrementPressed());
                },
                child: const Text('Decrement counter'),
              ),
            ],
          );
        },
      )),
    );
  }
}
