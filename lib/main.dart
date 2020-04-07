import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title , this.description);
}

void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      // TodosScreen 스크린을 홈으로 설정
      // Todo 타입의 아이템을 20개 List로 생성하여 전달
      todos: List.generate(
            20,
            (i) => Todo(
          'Todo $i' , 'A description of what needs to be done for Todo $i'
        ),
      ),
    ),
  ));
}

class TodosScreen  extends StatelessWidget {
  final List<Todo> todos; // Todo 아이템 리스트

  // 생성자에서 Todo 아이템 리스트를 받아서 필드에 저장
  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            // ListTile 을 반환
            return ListTile(
              title: Text(todos[index].title),
              // ListTile은 onTap과 onLongPress를 지원함
              onTap: () {
                // ListTile이 탭되면 DetailScreen 스크린을 적재
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // 파라미터 todo로 tap된 index의 아이템을 전달
                    builder: (context) => DetailScreen(todo: todos[index]),
                  ),
                );
              },
            );
          },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget{
  final Todo todo;
  // 생성자로 아이템을 수신하여 필드에 저장
  const DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}