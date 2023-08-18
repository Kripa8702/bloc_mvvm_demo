import 'package:equatable/equatable.dart';

final class Post extends Equatable {
  const Post({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );


  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
  };


  @override
  List<Object> get props => [id, title, body];
}
