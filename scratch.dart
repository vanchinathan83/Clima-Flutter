void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  print('task 1 completed');
}

Future<String> task2() async {
  Duration duration = Duration(seconds: 3);

  String result;
  return Future.delayed(duration, () {
    result = 'task 2 completed';
    print('done with task2');
    return result;
  });
}

void task3(String task2Result) {
  print('task 3 completed with $task2Result');
}
