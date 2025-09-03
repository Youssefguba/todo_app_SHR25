part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class AddTodo implements TodoEvent {
  final String text;

  AddTodo(this.text);

}

class DeleteTodo implements TodoEvent {
  final int id;

  DeleteTodo(this.id);
}