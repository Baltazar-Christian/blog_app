// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../services/product_provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => TodoProvider(),
//       child: MaterialApp(
//         title: 'Todo App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: ProductsScreen(),
//       ),
//     );
//   }
// }

// class ProductsScreen extends StatefulWidget {
//   @override
//   _TodoListScreenState createState() => _TodoListScreenState();
// }

// class _TodoListScreenState extends State<ProductsScreen> {
//   final TextEditingController _titleController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<TodoProvider>(context, listen: false).fetchTodos();
//     });
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final todoProvider = Provider.of<TodoProvider>(context);
//     final todos = todoProvider.todos;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo List'),
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           final todo = todos[index];
//           _titleController.text = todo.name;

//           return Dismissible(
//             key: Key(todo.id.toString()),
//             background: Container(
//               color: Colors.red,
//               child: Icon(
//                 Icons.delete,
//                 color: Colors.white,
//               ),
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.only(right: 16.0),
//             ),
//             direction: DismissDirection.endToStart,
//             onDismissed: (direction) async {
//               await todoProvider.deleteTodo(
//                 todoId: todo.id,
//               );
//             },
//             child: ListTile(
//               title: Text(todo.name),
//               // subtitle: Text(todo.price as String),

//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text('Edit Todo'),
//                       content: TextField(
//                         controller: _titleController,
//                         decoration: InputDecoration(labelText: 'Title'),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Cancel'),
//                         ),
//                         TextButton(
//                           onPressed: () async {
//                             String name = _titleController.text;
//                             if (name.isNotEmpty) {
//                               // await todoProvider.updateTodo(
//                               //   todoId: todo.id,
//                               //   name: name,
//                               //   // completed: todo.completed,
//                               // );
//                               Navigator.of(context).pop();
//                             }
//                           },
//                           child: Text('Save'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('Add Todo'),
//                 content: TextField(
//                   controller: _titleController,
//                   decoration: InputDecoration(labelText: 'Title'),
//                 ),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('Cancel'),
//                   ),
//                   TextButton(
//                     onPressed: () async {
//                       String name = _titleController.text;
//                       if (name.isNotEmpty) {
//                         await todoProvider.createTodo(
//                           name: name,
//                         );
//                         Navigator.of(context).pop();
//                       }
//                     },
//                     child: Text('Add'),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
