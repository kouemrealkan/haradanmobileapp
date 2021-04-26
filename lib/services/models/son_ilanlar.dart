// To parse this JSON data, do
//
//     final sonIlanlar = sonIlanlarFromJson(jsonString);

import 'dart:convert';

SonIlanlar sonIlanlarFromJson(String str) => SonIlanlar.fromJson(json.decode(str));

String sonIlanlarToJson(SonIlanlar data) => json.encode(data.toJson());

class SonIlanlar {
  SonIlanlar({
    this.page,
    this.data,
  });

  Page page;
  List<Advert> data;

  factory SonIlanlar.fromJson(Map<String, dynamic> json) => SonIlanlar(
    page: Page.fromJson(json["page"]),
    data: List<Advert>.from(json["data"].map((x) => Advert.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Advert {
  Advert({
    this.identifier,
    this.advertNo,
    this.status,
    this.category,
   // this.createDate,
    this.title,
    this.description,
    this.price,
    this.city,
    this.district,
    this.url,
    this.imageUrl,
    this.viewCount,
    this.user,
  });

  String identifier;
  int advertNo;
  String status;
  Category category;
  //List<int> createDate;
  String title;
  String description;
  double price;
  String city;
  String district;
  String url;
  String imageUrl;
  int viewCount;

  User user;

  factory Advert.fromJson(Map<String, dynamic> json) => Advert(
    identifier: json["identifier"],
    advertNo: json["advertNo"],
    status: json["status"],
    category: Category.fromJson(json["category"]),
    //createDate: List<int>.from(json["createDate"].map((x) => x)),
    title: json["title"],
    description: json["description"],
    price: json["price"],
    city: json["city"],
    district: json["district"] == null ? null : json["district"],
    url: json["url"],
    imageUrl: json["imageUrl"],
    viewCount: json["viewCount"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "advertNo": advertNo,
    "status": status,
    "category": category.toJson(),
   // "createDate": List<dynamic>.from(createDate.map((x) => x)),
    "title": title,
    "description": description,
    "price": price,
    "city": city,
    "district": district == null ? null : district,
    "url": url,
    "imageUrl": imageUrl,
    "viewCount": viewCount,
    "user": user.toJson(),
  };
}

class Category {
  Category({
    this.identifier,
    this.name,
    this.searchText,
  });

  String identifier;
  String name;
  String searchText;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    identifier: json["identifier"],
    name: json["name"],
    searchText: json["searchText"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "name": name,
    "searchText": searchText,
  };
}

class User {
  User({
    this.identifier,
    this.channel,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.password,
    this.status,
  });

  String identifier;
  String channel;
  String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String password;

  String status;

  factory User.fromJson(Map<String, dynamic> json) => User(
    identifier: json["identifier"],
    channel: json["channel"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    password: json["password"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "channel": channel,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "password": password,
    "status": status,
  };
}

class Page {
  Page({
    this.totalElements,
    this.totalPages,
    this.page,
    this.size,
    this.sort,
    this.direction,
  });

  int totalElements;
  int totalPages;
  int page;
  int size;
  String sort;
  String direction;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
    page: json["page"],
    size: json["size"],
    sort: json["sort"],
    direction: json["direction"],
  );

  Map<String, dynamic> toJson() => {
    "totalElements": totalElements,
    "totalPages": totalPages,
    "page": page,
    "size": size,
    "sort": sort,
    "direction": direction,
  };
}
