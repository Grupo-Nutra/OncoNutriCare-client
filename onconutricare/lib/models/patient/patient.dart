import 'package:mobx/mobx.dart';

part 'patient.g.dart';

class Patient = _Patient with _$Patient;

abstract class _Patient with Store {
  @observable
  int? id;
  @observable
  String? name;
  @observable
  String? birthday;
  @observable
  String? medicalRecordNum;
  @observable
  String? sex;
  @observable
  String? phone;
  @observable
  String? email;
  @observable
  String? oncoDiagnosis;
  String? nutriId;

  _Patient(
      {this.id,
      this.name,
      this.birthday,
      this.medicalRecordNum,
      this.sex,
      this.phone,
      this.email,
      this.oncoDiagnosis,
      this.nutriId});
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["nomeCompleto"] = name;
    data["dtNascimento"] = birthday;
    data["numeroProtuario"] = medicalRecordNum;
    data["sexo"] = sex;
    data["telefone"] = phone;
    data["email"] = email;
    data["diagnosticoOnco"] = oncoDiagnosis;
    data["idNutricionista"] = nutriId;

    return data;
  }

  _Patient.fromJson(Map<String, dynamic> json) {
    id = json['idPaciente'];
    name = json['nomeCompleto'];
    medicalRecordNum = json['numeroProtuario'];
    sex = json['sexo'];
    phone = json['telefone'];
    email = json['email'];
    oncoDiagnosis = json['diagnosticoOnco'];
  }
}
