part of 'search_cubit_cubit.dart';

abstract class SearchCubitState extends Equatable {
  const SearchCubitState();

  @override
  List<Object> get props => [];
}

class SearchCubitInitial extends SearchCubitState {}

class SearchCubitLoading extends SearchCubitState {}

class SearchCubitSuccess extends SearchCubitState {
  final List<BookModel> books;

  const SearchCubitSuccess(this.books);
}

class SearchCubitFailure extends SearchCubitState {
  final String errMessage;

  const SearchCubitFailure(this.errMessage);
}
