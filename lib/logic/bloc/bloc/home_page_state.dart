part of 'home_page_bloc.dart';
@immutable
sealed class HomePageState {}
final class HomePageInitial extends HomePageState {}
/// bloc state Get home page loading
final class GetHomePageLoading extends HomePageState {} 
/// bloc state Get home page success
final class GetHomePageSucces extends HomePageState{
  ProductModel productModel;
  GetHomePageSucces({required this.productModel});
}

/// bloc state Get home page error
class GetHomePageError extends HomePageState{
  String title;
  String description; 
  int status;
  GetHomePageError({required this.title, required this.description, required this.status});
}
