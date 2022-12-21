import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vexana_work/core/network/project_network.dart';
import 'package:vexana_work/rickmorty/model/character_model.dart';
import './rickmorty.dart';

abstract class rickmortyViewModel extends State<rickmorty> {
  final _dio = ProjectNetworkManager.instance.dio;

  List<CharacterModel> characterModels = [];

  Future<void> fetchCharacterModel() async {
    try {
      final _response = await _dio.get(servicePath.CHARACTER.rawValue);

      if (_response.statusCode == HttpStatus.ok) {
        final _data = _response.data;
        if (_data is Map<String, dynamic>) {
          final _baseModel = BaseResponseCharacter.fromJson(_data);
          characterModels = _baseModel.results ?? [];
        } else if (_data is List) {
          characterModels =
              _data.map((e) => CharacterModel.fromJson(e)).toList();
        }
      } else {
        throw Exception();
      }
      setState(() {});
    } on DioError catch (e) {
      print(e);
    }
  }
}

enum servicePath { CHARACTER }

extension ServicePathExtension on servicePath {
  String get rawValue {
    switch (this) {
      case servicePath.CHARACTER:
        return "character";

      default:
        throw "Network path not found.";
    }
  }
}
