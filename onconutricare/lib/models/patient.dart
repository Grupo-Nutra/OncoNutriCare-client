class Patient {
  int? id;
  String? name;
  String? birthday;
  String? medicalRecordNum;
  String? sex;
  String? phone;
  String? email;
  String? oncoDiagnosis;
  String? nutriId;
  int? age;

  Patient(
      {this.id,
      this.name,
      this.birthday,
      this.medicalRecordNum,
      this.sex,
      this.phone,
      this.email,
      this.oncoDiagnosis,
      this.nutriId,
      this.age});
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["nomeCompleto"] = name;
    data["dtNascimento"] = birthday;
    data["numeroProntuario"] = medicalRecordNum;
    data["sexo"] = sex;
    data["telefone"] = phone;
    data["email"] = email;
    data["diagnosticoOnco"] = oncoDiagnosis;
    data["idNutricionista"] = nutriId;

    return data;
  }

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['idPaciente'];
    name = json['nomeCompleto'];
    medicalRecordNum = json['numeroProntuario'];
    sex = json['sexo'];
    phone = json['telefone'];
    email = json['email'];
    oncoDiagnosis = json['diagnosticoOnco'];
  }
}
