import 'package:mobx/mobx.dart';

part 'appointment.g.dart';

class Appointment = _Appointment with _$Appointment;

abstract class _Appointment with Store {
  @observable
  int? id;
  @observable
  DateTime? fullDate;
  @observable
  double? weight;
  @observable
  String? nutritionalDiagnosis;
  // ('Baixo peso', 'Desnutrição', 'Caquexia', 'Miopenia', 'Sarcopenia', 'Sobrepeso', 'Obesidade')
  @observable
  String? inappetence;
  // ('Sim', 'Não')
  @observable
  String? nutritionalRisk;
  // ('Sim', 'Não')
  @observable
  int? tnoStatus;
  // ('Sim', 'Não')
  @observable
  String? therapeuticPlan;
  @observable
  String? treatment;

  _Appointment();

  _Appointment.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['idConsulta']);
    fullDate = DateTime.parse('${json['data']} ${json['hora']}');
    weight = json['peso'];
    nutritionalDiagnosis = json['diagnosticoNutri'];
    inappetence = json['inapetencia'];
    nutritionalRisk = json['riscoNutricional'];
    tnoStatus = json['statusTno'];
    therapeuticPlan = json['planoTerapeutico'];
    treatment = json['tratamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] =
        DateTime.parse('${fullDate!.year}-${fullDate!.month}-${fullDate!.day}');
    data['hora'] = DateTime.parse(
        '${fullDate!.hour}-${fullDate!.minute}-${fullDate!.second}');
    data['peso'] = weight;
    data['diagnosticoNutri'] = nutritionalDiagnosis;
    data['inapetencia'] = inappetence;
    data['riscoNutricional'] = nutritionalRisk;
    data['statusTno'] = tnoStatus;
    data['planoTerapeutico'] = therapeuticPlan;
    data['tratamento'] = treatment;
    return data;
  }
}
