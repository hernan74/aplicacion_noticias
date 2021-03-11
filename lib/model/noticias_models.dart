// To parse this JSON data, do
//
//     final noticiasModel = noticiasModelFromJson(jsonString);

import 'dart:convert';

NoticiasModel noticiasModelFromJson(String str) => NoticiasModel.fromJson(json.decode(str));

String noticiasModelToJson(NoticiasModel data) => json.encode(data.toJson());

class NoticiasModel {
    NoticiasModel({
        this.status,
        this.totalResults,
        this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory NoticiasModel.fromJson(Map<String, dynamic> json) => NoticiasModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description == null ? null : description,
        "url": url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content == null ? null : content,
    };
}

class Source {
    Source({
        this.id,
        this.name,
    });

    Id id;
    String name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : idValues.map[json["id"]],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : idValues.reverse[id],
        "name": name,
    };
}

enum Id { INFOBAE, GOOGLE_NEWS, LA_NACION }

final idValues = EnumValues({
    "google-news": Id.GOOGLE_NEWS,
    "infobae": Id.INFOBAE,
    "la-nacion": Id.LA_NACION
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
