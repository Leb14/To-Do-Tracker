class TaskDTO {
  final String title;
  final String description;
  final DateTime dueDate;

  // Optional extra fields
  final bool? isRepeated;
  final String? projectName;
  final String? subject;
  final String? location;
  final String? familyMember;

  TaskDTO({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isRepeated,
    this.projectName,
    this.subject,
    this.location,
    this.familyMember,
  });
}
