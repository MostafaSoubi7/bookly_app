import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_cubit_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit(this.searchRepo) : super(SearchCubitInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String searchString}) async {
    emit(SearchCubitLoading());
    var result = await searchRepo.fetchSearchBooks(searchString: searchString);
    result.fold((failure) {
      emit(
        SearchCubitFailure(failure.errMessage),
      );
    }, (books) {
      emit(
        SearchCubitSuccess(books),
      );
    });
  }
}
