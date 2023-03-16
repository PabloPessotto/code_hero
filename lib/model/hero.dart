class Hero {
  int? id;
  String? name;
  String? description;
  String? thumbnail;

  Hero({this.id, this.name, this.description, this.thumbnail});

  factory Hero.fromJson(Map<String, dynamic> json) {
    return Hero(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      thumbnail: json["thumbnail"]["path"] + '.' + json["thumbnail"]["extension"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "thumbnail": thumbnail,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hero && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
