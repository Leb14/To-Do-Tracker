enum TaskType {
  job,
  daily,
  empty;

  String get displayName {
    switch (this) {
      case TaskType.job:
        return 'Job';
      case TaskType.daily:
        return 'Daily';
      default:
        return 'Please select a type';
    }
  }
}

