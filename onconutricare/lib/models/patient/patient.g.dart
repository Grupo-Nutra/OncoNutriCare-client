// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Patient on _Patient, Store {
  late final _$idAtom = Atom(name: '_Patient.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom = Atom(name: '_Patient.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$birthdayAtom = Atom(name: '_Patient.birthday', context: context);

  @override
  String? get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(String? value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  late final _$medicalRecordNumAtom =
      Atom(name: '_Patient.medicalRecordNum', context: context);

  @override
  String? get medicalRecordNum {
    _$medicalRecordNumAtom.reportRead();
    return super.medicalRecordNum;
  }

  @override
  set medicalRecordNum(String? value) {
    _$medicalRecordNumAtom.reportWrite(value, super.medicalRecordNum, () {
      super.medicalRecordNum = value;
    });
  }

  late final _$sexAtom = Atom(name: '_Patient.sex', context: context);

  @override
  String? get sex {
    _$sexAtom.reportRead();
    return super.sex;
  }

  @override
  set sex(String? value) {
    _$sexAtom.reportWrite(value, super.sex, () {
      super.sex = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_Patient.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$emailAtom = Atom(name: '_Patient.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$oncoDiagnosisAtom =
      Atom(name: '_Patient.oncoDiagnosis', context: context);

  @override
  String? get oncoDiagnosis {
    _$oncoDiagnosisAtom.reportRead();
    return super.oncoDiagnosis;
  }

  @override
  set oncoDiagnosis(String? value) {
    _$oncoDiagnosisAtom.reportWrite(value, super.oncoDiagnosis, () {
      super.oncoDiagnosis = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
birthday: ${birthday},
medicalRecordNum: ${medicalRecordNum},
sex: ${sex},
phone: ${phone},
email: ${email},
oncoDiagnosis: ${oncoDiagnosis}
    ''';
  }
}
