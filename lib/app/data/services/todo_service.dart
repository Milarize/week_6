import 'package:get/get.dart';
import 'package:getx/app/data/todo.dart';

class TodoService extends GetxService {
  final todos = <Todo>[
Todo(title: 'Buy groceries', description: 'Pick up milk, bread, and eggs from the store.'),
Todo(title: 'Call the bank', description: 'Inquire about the status of the loan application.'),
Todo(title: 'Schedule meeting', description: 'Set up a Zoom call with the marketing team for Tuesday.'),
Todo(title: 'Walk the dog', description: 'Take Max out for a 30-minute walk in the park.'),
Todo(title: 'Plan vacation', description: 'Research destinations and book flights for the summer trip.'),

  ].obs;

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void removeTodoAt(int index) {
    todos.removeAt(index);
  }

  void toggleTodoStatus(int index) {
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
  }
  void editTodo(int index, Todo todo) {
    todos[index] = todo;
    todos.refresh();
  }

}
