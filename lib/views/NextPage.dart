import 'package:flutter/material.dart';
import 'package:flutter_navigation/models/completion_model.dart';
import 'package:flutter_navigation/services/completion_service.dart';

class NextPage extends StatefulWidget {
  final String email;

  const NextPage({
    super.key,
    required this.email,
  });

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  List<CompletionModel> todo = [];
  bool isLoading = true;

  getList() async {
    todo = await CompletionService().getData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/todo.png',
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Todo - list',
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Color(0xff0b9eff)),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: todo.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(todo[index].title ?? "--",
                      style: const TextStyle(color: Color(0xff009aff))),
                  subtitle: Text(todo[index].completed.toString() ?? "--"),
                  trailing: Icon(Icons.add_task),
                );
              },
            ),
    );
  }
}
