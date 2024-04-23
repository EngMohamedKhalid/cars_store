import 'dart:convert';

import '../../app/error/exceptions.dart';

class GlobalResponseModel {
  GlobalResponseModel({
    this.success,
    this.data,
    this.authError,
    this.msg,});

  factory GlobalResponseModel.fromJson(String source) {
    try {
      return GlobalResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
    } catch (e) {
      throw DataParsingException(e.toString());
    }
  }
  GlobalResponseModel.fromMap(Map<String, dynamic> json) {
    success = json['statusCode']==200;
    data = json['data'];
    msg = json['message'] ;
    statusCode = json['statusCode'] ;
    authError = json['statusCode']==401||json['statusCode']==469;
    errors = json['errors']is List?null:json['errors'];
  }

  int? statusCode;
  String? msg;
  dynamic data;
  bool? success;
  bool? authError;
  dynamic errors;
}