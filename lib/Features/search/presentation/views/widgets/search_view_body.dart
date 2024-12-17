import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (data) {
              BlocProvider.of<SearchCubit>(context)
                  .fetchSearchBooks(searchString: data);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(child: Center(child: SearchResultListView())),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchCubitState>(
      builder: (context, state) {
        if (state is SearchCubitInitial) {
          return const Column(
            children: [
              Spacer(),
              Icon(
                Icons.image_search,
                size: 72,
              ),
              SizedBox(
                height: 16,
              ),
              Text("you can search by book name or category 😊"),
              Spacer(),
            ],
          );
          // return Opacity(
          //   opacity: .7,
          //   child: SizedBox(
          //     width: 275,
          //     child: Text(
          //       "deer end user , you can search by book name or category 😊 ",
          //       style: Styles.textStyle18
          //           .copyWith(fontStyle: FontStyle.italic, fontSize: 10.8),
          //     ),
          //   ),
          // );
        } else if (state is SearchCubitSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
                // child: Text("child"),
              );
            },
            itemCount: state.books.length,
          );
        } else if (state is SearchCubitFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
