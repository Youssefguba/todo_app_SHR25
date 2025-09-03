part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  TodoLoaded(this.todos);

}

class TodoDeletedSuccessfully extends TodoState {}

class LoadingTodos extends TodoState {}
