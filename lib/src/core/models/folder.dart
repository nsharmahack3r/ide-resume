import 'dart:convert';

class Folder {
  final int id;
  final String name;
  Folder({
    required this.id,
    required this.name,
  });

  Folder copyWith({
    int? id,
    String? name,
  }) {
    return Folder(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Folder.fromMap(Map<String, dynamic> map) {
    return Folder(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Folder.fromJson(String source) => Folder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Folder(id: $id, name: $name)';

  @override
  bool operator ==(covariant Folder other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
