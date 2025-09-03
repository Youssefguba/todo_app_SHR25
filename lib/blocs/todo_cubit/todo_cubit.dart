import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utils/prefs_constants.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  List<TodoModel> todos = [];

  // add todos
  void addTodo(String text) async {
    final prefs = await SharedPreferences.getInstance();
    final random = Random().nextInt(100000);
    todos.add(TodoModel(id: random, title: text));

    // encoding -> Convert Object to String
    // decoding -> Convert String to Object

    final stringList =
        todos.map((element) {
          return jsonEncode(element.toJson());
        }).toList();

    // Save Item to List in Shared Preferences
    prefs.setStringList(PrefsKeys.todos, stringList);

    emit(TodoLoaded(todos));
    // setState = notifyListeners = emit
  }

  // delete todos
  void deleteTodo(int id) async {
    todos.removeWhere((todo) => todo.id == id);

    // remove from shared prefs
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(id.toString());

    if (todos.isEmpty) {
      emit(TodoInitial());
    } else {
      emit(TodoLoaded(todos));
    }
  }

  void loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(PrefsKeys.todos) ?? [];
    todos =
        stringList.map((element) {
          final map = jsonDecode(element);
          return TodoModel.fromJson(map);
        }).toList();

    if (todos.isEmpty) {
      emit(TodoInitial());
    } else {
      emit(TodoLoaded(todos));
    }
  }
}
