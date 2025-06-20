import 'package:untitled/Model/task/task_dto.dart';
import 'package:untitled/Model/task/task_factory.dart';

import 'base_task.dart';
import 'daily_task.dart';

class DailyTaskFactory extends TaskFactory {
  @override
  Task create(TaskDTO taskData) {
    return DailyTask(
        title: taskData.title,
        description: taskData.description,
        dueDate: taskData.dueDate,
        isRepeated: taskData.isRepeated ?? false
    );
  }
}