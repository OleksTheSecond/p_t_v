class Book {
  final int id;
  final String name;
  final String path;
  final int currentPage;

  Book(
      {required this.id,
      required this.name,
      required this.path,
      this.currentPage = 0});
}
