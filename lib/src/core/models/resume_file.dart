import 'dart:convert';

class ResumeFile {
  final String name;
  final int id;
  ResumeFile({
    required this.name,
    required this.id,
  });

  ResumeFile copyWith({
    String? name,
    int? id,
  }) {
    return ResumeFile(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory ResumeFile.fromMap(Map<String, dynamic> map) {
    return ResumeFile(
      name: map['name'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResumeFile.fromJson(String source) => ResumeFile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResumeFile(name: $name, id: $id)';

  @override
  bool operator ==(covariant ResumeFile other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
