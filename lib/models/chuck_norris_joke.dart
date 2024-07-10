class ChuckNorrisJoke {
  final String joke;

  ChuckNorrisJoke({required this.joke});

  factory ChuckNorrisJoke.fromJson(Map<String, dynamic> json) {
    return ChuckNorrisJoke(
      joke: json['value'],
    );
  }
}
