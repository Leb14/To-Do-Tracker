import 'package:untitled/Model/task/task_dto.dart';

import 'base_task.dart';

abstract class TaskFactory {
  Task create(TaskDTO taskData);
}