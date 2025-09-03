part of 'todo_bloc.dart';

@immutable
abstract class TodoBlocState {}

class TodoBlocInitial extends TodoBlocState {}

class TodoBlocLoaded extends TodoBlocState {
  final List<TodoModel> todos;

  TodoBlocLoaded(this.todos);

}

class TodoDeletedBlocSuccessfully extends TodoBlocState {}

class LoadingBlocTodos extends TodoBlocState {}
