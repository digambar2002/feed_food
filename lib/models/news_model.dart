// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsModel {
  static List<Articles> News = [];
}

class Articles {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  Articles(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
  );

  Articles copyWith({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
  }) {
    return Articles(
      author ?? this.author,
      title ?? this.title,
      description ?? this.description,
      url ?? this.url,
      urlToImage ?? this.urlToImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
    };
  }

  factory Articles.fromMap(Map<String, dynamic> map) {
    return Articles(
      map['author'] ?? "News Network",
      map['title'] ?? "Breaking News",
      map['description'] ?? "Read for more news",
      map['url'] ?? "https://news.google.com/",
      map['urlToImage'] ??
          "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2022/03/breaking-news-new-template-1646528097.jpg",
    );
  }

  String toJson() => json.encode(toMap());

  factory Articles.fromJson(String source) =>
      Articles.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Articles(author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage)';
  }

  @override
  bool operator ==(covariant Articles other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.title == title &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        title.hashCode ^
        description.hashCode ^
        url.hashCode ^
        urlToImage.hashCode;
  }
}

// Method to get news data

