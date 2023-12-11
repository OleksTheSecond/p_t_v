class Book {
  final int id;
  final String name;
  final String path;
  int currentPage;
  bool checked;

  Book({
    required this.id,
    required this.name,
    required this.path,
    this.currentPage = 0,
    this.checked = false,
  });

  factory Book.fromSQLDatabase(Map<String, dynamic> map) => Book(
      name: map['name'] ?? "",
      path: map['path'] ?? "",
      id: map['id']?.toInt() ?? 0);
}
