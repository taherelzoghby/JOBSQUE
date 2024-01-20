// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class GetProfileSuccess extends ProfileState {}

class GetProfileLoading extends ProfileState {}

class GetProfileFailure extends ProfileState {
  final String message;
  GetProfileFailure({required this.message});
}
