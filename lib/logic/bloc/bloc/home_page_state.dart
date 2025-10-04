part of 'home_page_bloc.dart';
@immutable
sealed class HomePageState {}
final class HomePageInitial extends HomePageState {}

final class HomePageLoading extends HomePageState {} 
final class HomePageSucces extends HomePageState{}
class HomePageError extends HomePageState{
  String title;
  String description; 
  String status;
  HomePageError({required this.title, required this.description, required this.status});
}
