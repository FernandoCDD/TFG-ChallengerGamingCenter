import 'dart:convert';

import 'content.dart';
import 'pageable.dart';
import 'sort.dart';

class TorneoListResponse {
  List<Torneos>? content;
  Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  bool? first;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? empty;

  TorneoListResponse({
    this.content,
    this.pageable,
    this.last,
    this.totalPages,
    this.totalElements,
    this.first,
    this.size,
    this.number,
    this.sort,
    this.numberOfElements,
    this.empty,
  });

  factory TorneoListResponse.fromMap(Map<String, dynamic> data) {
    return TorneoListResponse(
      content: (data['content'] as List<dynamic>?)
          ?.map((e) => Torneos.fromMap(e as Map<String, dynamic>))
          .toList(),
      pageable: data['pageable'] == null
          ? null
          : Pageable.fromMap(data['pageable'] as Map<String, dynamic>),
      last: data['last'] as bool?,
      totalPages: data['totalPages'] as int?,
      totalElements: data['totalElements'] as int?,
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
        'totalPages': totalPages,
        'totalElements': totalElements,
        'first': first,
        'size': size,
        'number': number,
        'sort': sort?.toMap(),
        'numberOfElements': numberOfElements,
        'empty': empty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TorneoListResponse].
  factory TorneoListResponse.fromJson(String data) {
    return TorneoListResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TorneoListResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
