import 'package:mobx/mobx.dart';

part 'appointment.g.dart';

class Appointment = _Appointment with _$Appointment;

abstract class _Appointment with Store {
  @observable
  int? id;
  @observable
  int? idPatient;
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
  String? tnoStatus;
  // ('Sim', 'Não')
  @observable
  String? therapeuticPlan;
  @observable
  String? treatment;

  _Appointment(
      {this.idPatient,
      this.fullDate,
      this.weight,
      this.nutritionalDiagnosis,
      this.inappetence,
      this.nutritionalRisk,
      this.tnoStatus,
      this.therapeuticPlan,
      this.treatment});

  _Appointment.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['idConsulta']);
    idPatient = int.parse(json['idPaciente']);
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
    data['idPaciente'] = idPatient;
    data['data'] = fullDate!.toIso8601String();
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
