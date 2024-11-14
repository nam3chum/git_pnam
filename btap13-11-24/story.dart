class Story
{
  String name,author,path,source,icon,description,type,locale;
  int version;

  Story({required this.name, required this.author, required this.path, required this.source, required this.icon,
      required this.description, required this.type, required this.locale, required this.version});
  factory Story.fromJson(Map json){
    return Story(
      name: json['name'] ?? 'unknown name',
      author: json['author'] ?? 'unknown author',
      path: json['path'] ?? 'unknown path',
      source: json['source'] ?? '',
      icon: json['icon'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      locale: json['locale'] ?? '',
      version: json['version'] ?? 0
    );
  }
}