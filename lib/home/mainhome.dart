import 'package:flutter/material.dart';

class house extends StatefulWidget {
  const house({super.key});

  @override
  State<house> createState() => _houseState();
}

class _houseState extends State<house> {

  final List<Task> _tasks = [
    Task(name: 'Water Intake'),
    Task(name: 'Exercise At Home or Gym'),
    Task(name: 'Balanced Diet'),
    Task(name: 'Minimun 7 - 8hrs Sleep'),
    Task(name: 'Meditate for 10 minutes'),
  ];
  int x = 0; // Variable to store the number of completed tasks

  void _updateCompletedTasks() {
    setState(() {
      // Count the number of completed tasks
      x = _tasks.where((task) => task.isCompleted).length;
      print(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        SizedBox(height: 30,),
        Text("Hey Ritesh",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        SizedBox(height: 30,),
        Text("Your Todays Goal",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 30,),
        Expanded(
          child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              task: _tasks[index],
              onChanged: (bool? value) {
                setState(() {
                  _tasks[index].isCompleted = value ?? false;
                  _updateCompletedTasks();
                });
              },
            );
          },
                ),
        ),
    ]);

  }
}


class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class TaskTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;

  TaskTile({required this.task, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListTile(

        title: Text(
          task.name,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            fontSize: 18.0,
          ),
        ),
        trailing: Checkbox(
          value: task.isCompleted,
          onChanged: onChanged,
          activeColor: Color(0xFF35C5Cf),
        ),
      ),
    );
  }
}
