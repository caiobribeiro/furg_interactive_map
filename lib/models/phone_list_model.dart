// To parse this JSON data, do
//
//     final phoneListApi = phoneListApiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PhoneListApi phoneListApiFromJson(String str) =>
    PhoneListApi?.fromJson(json.decode(str));

class PhoneListApi {
  PhoneListApi({
    @required this.res,
    @required this.status,
  });

  final Res? res;
  final String? status;

  factory PhoneListApi.fromJson(Map<String, dynamic> json) => PhoneListApi(
        res: Res.fromJson(json["res"]),
        status: json["status"],
      );
}

class Res {
  Res({
    @required this.telefones,
  });

  final List<Telefone>? telefones;

  factory Res.fromJson(Map<String, dynamic> json) => Res(
        telefones: List<Telefone>.from(
            json["telefones"].map((x) => Telefone.fromJson(x))),
      );
}

class Telefone {
  Telefone({
    @required this.idTelefone,
    @required this.nrDdd,
    @required this.nrTelefone,
    @required this.nrRamal,
    @required this.nmLocal,
    @required this.unidade,
    @required this.subunidade,
    @required this.dsTelefone,
    @required this.flPrioritario,
    @required this.pessoas,
    @required this.flFax,
  });

  final String? idTelefone;
  final String? nrDdd;
  final String? nrTelefone;
  final dynamic nrRamal;
  final String? nmLocal;
  final String? unidade;
  final dynamic subunidade;
  final String? dsTelefone;
  final bool? flPrioritario;
  final List<String>? pessoas;
  final String? flFax;

  factory Telefone.fromJson(Map<String, dynamic> json) => Telefone(
        idTelefone: json["id_telefone"],
        nrDdd: json["nr_ddd"],
        nrTelefone: json["nr_telefone"],
        nrRamal: json["nr_ramal"],
        nmLocal: json["nm_local"],
        unidade: json["unidade"],
        subunidade: json["subunidade"],
        dsTelefone: json["ds_telefone"],
        flPrioritario: json["fl_prioritario"],
        pessoas: List<String>.from(json["pessoas"].map((x) => x)),
        flFax: json["fl_fax"],
      );
}
