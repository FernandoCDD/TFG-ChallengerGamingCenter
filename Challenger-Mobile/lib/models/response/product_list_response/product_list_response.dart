import 'dart:convert';

import 'content.dart';
import 'pageable.dart';
import 'sort.dart';

class ProductListResponse {
  List<Content>? content;
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  bool? first;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? empty;

  ProductListResponse({
    this.content,
    this.pageable,
    this.last,
    this.totalElements,
    this.totalPages,
    this.first,
    this.size,
    this.number,
    this.sort,
    this.numberOfElements,
    this.empty,
  });

  factory ProductListResponse.fromMap(Map<String, dynamic> data) {
    return ProductListResponse(
      content: (data['content'] as List<dynamic>?)
          ?.map((e) => Content.fromMap(e as Map<String, dynamic>))
          .toList(),
      pageable: data['pageable'] == null
          ? null
          : Pageable.fromMap(data['pageable'] as Map<String, dynamic>),
      last: data['last'] as bool?,
      totalElements: data['totalElements'] as int?,
      totalPages: data['totalPages'] as int?,
      first: data['first'] as bool?,
      size: data['size'] as int?,
      number: data['number'] as int?,
      sort: data['sort'] == null
          ? null
          : Sort.fromMap(data['sort'] as Map<String, dynamic>),
      numberOfElements: data['numberOfElements'] as int?,
      empty: data['empty'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'content': content?.map((e) => e.toMap()).toList(),
        'pageable': pageable?.toMap(),
        'last': last,
        'totalElements': totalElements,
        'totalPages': totalPages,
        'first': first,
        'size': size,
        'number': number,
        'sort': sort?.toMap(),
        'numberOfElements': numberOfElements,
        'empty': empty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductListResponse].
  factory ProductListResponse.fromJson(String data) {
    return ProductListResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductListResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
