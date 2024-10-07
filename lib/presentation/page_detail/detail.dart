import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_gorouter/presentation/page_detail/bloc/detail_bloc.dart';
import 'package:study_gorouter/presentation/page_detail/detail_view.dart';

class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen].
  const DetailsScreen({
    required this.label,
    Key? key,
  }) : super(key: key);

  /// The label to display in the center of the screen.
  final String label;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBloc(),
      child: DetailView(
        label: label,
      ),
    );
  }
}
