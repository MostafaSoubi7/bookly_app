import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//  return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       child: Column(
//         children: [
//           const CustomBookDetailsAppBar(),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * .2),
//             child: const CustomBookImage(),
//           ),
//           const SizedBox(
//             height: 43,
//           ),
//           Text(
//             "The Jungle Book",
//             style: Styles.textStyle30.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 6,
//           ),
//           Opacity(
//             opacity: .7,
//             child: Text(
//               "Rudyard Kipling",
//               style: Styles.textStyle18.copyWith(
//                 fontStyle: FontStyle.italic,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 18,
//           ),
//           const BookRating(
//             mainAxisAlignment: MainAxisAlignment.center,
//           ),
//           const SizedBox(
//             height: 37,
//           ),
//           const BooksAction(),
//           const Expanded(
//             child: SizedBox(
//               height: 50,
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "You can also like",
//               style: Styles.textStyle14.copyWith(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           const SimilarBooksListView(),
//           const SizedBox(
//             height: 40,
//           ),
//         ],
//       ),
//     );
