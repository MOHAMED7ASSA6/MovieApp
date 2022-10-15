class Genreids{
  final String name;
  final int id;
  Genreids({
  required   this.name,
    required this.id
});
  @override

  List<Object?> get props => [name,id];
}