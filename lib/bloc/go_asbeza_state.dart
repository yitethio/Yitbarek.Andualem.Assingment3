part of 'go_asbeza_bloc.dart';

@immutable
class GoAsbezaState {}

class GoAsbezaInitial extends GoAsbezaState {}

class GoAsbezaloding extends GoAsbezaState {}

class GoAsbezaIsucsess extends GoAsbezaState {
  // ignore: non_constant_identifier_names
  final List Goasbeza;
  final List Histo;
  // ignore: non_constant_identifier_names
  GoAsbezaIsucsess({required this.Goasbeza, required this.Histo});
}
