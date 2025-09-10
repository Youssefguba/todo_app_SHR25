import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo_app/blocs/todo_cubit/todo_cubit.dart';
import 'package:todo_app/screens/login_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _todoController = TextEditingController();
  // Life cycle

  // 1. Create State
  // 2. initialization State (initState) -> Happy Birthday of the page
  //        -> Actions needed to init the page
  // 3. build
  // 4. dispose

  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().loadTodos();
  }

  @override
  void dispose() {
    super.dispose();
    context.read<TodoBloc>().close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo List'),
        backgroundColor: Colors.green,
        actions: [
          // Logout Button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (_) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Top TextField for adding new todos
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _todoController,
              decoration: InputDecoration(
                hintText: 'Add todo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: const Icon(Icons.edit),
              ),
            ),
          ),

          // Divider between text field and list
          const Divider(height: 1),

          // List of Todos
          BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              if (state is TodoLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.todos[index].title),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // context.read<TodoBloc>().add(
                            //   DeleteTodo(state.todos[index].id),
                            // );

                            context.read<TodoCubit>().deleteTodo(
                              state.todos[index].id,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              }

              if (state is TodoInitial) {
                return const Center(
                  child: Text(
                    'No todos yet. Your state is TodoInitial',
                  ),
                );
              }

              return const Center(child: Text('No todos yet. Add some!'));
            },
          ),
        ],
      ),
      // Floating Action Button to add new todos
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoCubit>().addTodo(_todoController.text);
          _todoController.clear();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
