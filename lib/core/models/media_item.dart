class MediaItem {
  final String coverUrl; // URL Capa
  final String name; // Nome
  final String description; // Descrição
  final int episodeCount; // Quantidade Episódios
  final String platform; // Plataforma
  final String releaseDate; // Data de Lançamento
  final List<String> genres; // Gênero
  final String studio; // Estudio
  final String author; // Autor
  final String note; // Observação
  final String status; // Status

  MediaItem({
    required this.coverUrl,
    required this.name,
    required this.description,
    required this.episodeCount,
    required this.platform,
    required this.releaseDate,
    required this.genres,
    required this.studio,
    required this.author,
    required this.note,
    required this.status,
  });

  String get genresString => genres.join(', ');

  // Método para criar uma instância de Anime a partir de um mapa (útil para JSON)
  factory MediaItem.fromMap(Map<String, dynamic> map) {
    return MediaItem(
      coverUrl: map['coverUrl'],
      name: map['name'],
      description: map['description'],
      episodeCount: map['episodeCount'],
      platform: map['platform'],
      releaseDate: map['releaseDate'],
      genres: List<String>.from(map['genres']),
      studio: map['studio'],
      author: map['author'],
      note: map['note'],
      status: map['status'],
    );
  }

  // Método para converter a instância de Anime em um mapa (útil para JSON)
  Map<String, dynamic> toMap() {
    return {
      'coverUrl': coverUrl,
      'name': name,
      'description': description,
      'episodeCount': episodeCount,
      'platform': platform,
      'releaseDate': releaseDate,
      'genres': genres,
      'studio': studio,
      'author': author,
      'note': note,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'Anime{'
        'coverUrl: $coverUrl, '
        'name: $name, '
        'description: $description, '
        'episodeCount: $episodeCount, '
        'platform: $platform, '
        'releaseDate: $releaseDate, '
        'genres: $genres, '
        'studio: $studio, '
        'author: $author, '
        'note: $note, '
        'status: $status'
        '}';
  }
}
