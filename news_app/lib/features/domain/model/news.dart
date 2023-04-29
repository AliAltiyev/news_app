import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Equatable {
  final String? name;
  final String? category;
  final String? desprition;
  final String? image;
  final String? id;

  const News({this.name, this.category, this.desprition, this.image, this.id});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  @override
  List<Object?> get props => [name, category, desprition, image];

  News copyWith({String? name, String? category, String? desprition, String? image, String? id}) {
    return News(
        name: name ?? this.name,
        category: category ?? this.category,
        desprition: desprition ?? this.desprition,
        image: image ?? this.image,
        id: id ?? this.id);
  }
}
