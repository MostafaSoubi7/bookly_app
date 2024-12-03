import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class SearchView extends StatefulWidget {
//   const SearchView({
//     super.key,
//     required this.category,
//   });

//   final String category;

//   @override
//   State<SearchView> createState() => _SearchViewState();
// }

// class _SearchViewState extends State<SearchView> {
//   @override
//   void initState() {
//     BlocProvider.of<SearchCubit>(context).fetchSearchBooks();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(
//         child: SearchViewBody(),
//       ),
//     );
//   }
// }

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: const Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
