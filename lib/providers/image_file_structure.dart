import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageFileStructure {
  String image;
  ImageFileStructure({
    required this.image,
  });

  ImageFileStructure copyWith({
    String? image,
  }) {
    return ImageFileStructure(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
    };
  }

  factory ImageFileStructure.fromMap(Map<String, dynamic> map) {
    return ImageFileStructure(
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageFileStructure.fromJson(String source) => ImageFileStructure.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ImageFileStructure(image: $image)';

  @override
  bool operator ==(covariant ImageFileStructure other) {
    if (identical(this, other)) return true;
  
    return 
      other.image == image;
  }

  @override
  int get hashCode => image.hashCode;
}
