import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoBlocState> {
  List<TodoModel> todos = [];


  TodoBloc() : super(TodoBlocInitial()) {
    on<AddTodo>((AddTodo event, emit) {
      final random = Random().nextInt(100000);
      todos.add(TodoModel(id: random, title: event.text));

      emit(TodoBlocLoaded(todos));
    });


    on<DeleteTodo>((event, emit) {
      todos.removeWhere((todo) => todo.id == event.id);

      if (todos.isEmpty) {
        emit(TodoBlocInitial());
      } else {
        emit(TodoBlocLoaded(todos));
      }
    });
  }
}
