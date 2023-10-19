// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Appointment on _Appointment, Store {
  late final _$idAtom = Atom(name: '_Appointment.id', context: context);

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

  late final _$fullDateAtom =
      Atom(name: '_Appointment.fullDate', context: context);

  @override
  DateTime? get fullDate {
    _$fullDateAtom.reportRead();
    return super.fullDate;
  }

  @override
  set fullDate(DateTime? value) {
    _$fullDateAtom.reportWrite(value, super.fullDate, () {
      super.fullDate = value;
    });
  }

  late final _$weightAtom = Atom(name: '_Appointment.weight', context: context);

  @override
  double? get weight {
    _$weightAtom.reportRead();
    return super.weight;
  }

  @override
  set weight(double? value) {
    _$weightAtom.reportWrite(value, super.weight, () {
      super.weight = value;
    });
  }

  late final _$nutritionalDiagnosisAtom =
      Atom(name: '_Appointment.nutritionalDiagnosis', context: context);

  @override
  String? get nutritionalDiagnosis {
    _$nutritionalDiagnosisAtom.reportRead();
    return super.nutritionalDiagnosis;
  }

  @override
  set nutritionalDiagnosis(String? value) {
    _$nutritionalDiagnosisAtom.reportWrite(value, super.nutritionalDiagnosis,
        () {
      super.nutritionalDiagnosis = value;
    });
  }

  late final _$inappetenceAtom =
      Atom(name: '_Appointment.inappetence', context: context);

  @override
  String? get inappetence {
    _$inappetenceAtom.reportRead();
    return super.inappetence;
  }

  @override
  set inappetence(String? value) {
    _$inappetenceAtom.reportWrite(value, super.inappetence, () {
      super.inappetence = value;
    });
  }

  late final _$nutritionalRiskAtom =
      Atom(name: '_Appointment.nutritionalRisk', context: context);

  @override
  String? get nutritionalRisk {
    _$nutritionalRiskAtom.reportRead();
    return super.nutritionalRisk;
  }

  @override
  set nutritionalRisk(String? value) {
    _$nutritionalRiskAtom.reportWrite(value, super.nutritionalRisk, () {
      super.nutritionalRisk = value;
    });
  }

  late final _$tnoStatusAtom =
      Atom(name: '_Appointment.tnoStatus', context: context);

  @override
  int? get tnoStatus {
    _$tnoStatusAtom.reportRead();
    return super.tnoStatus;
  }

  @override
  set tnoStatus(int? value) {
    _$tnoStatusAtom.reportWrite(value, super.tnoStatus, () {
      super.tnoStatus = value;
    });
  }

  late final _$therapeuticPlanAtom =
      Atom(name: '_Appointment.therapeuticPlan', context: context);

  @override
  String? get therapeuticPlan {
    _$therapeuticPlanAtom.reportRead();
    return super.therapeuticPlan;
  }

  @override
  set therapeuticPlan(String? value) {
    _$therapeuticPlanAtom.reportWrite(value, super.therapeuticPlan, () {
      super.therapeuticPlan = value;
    });
  }

  late final _$treatmentAtom =
      Atom(name: '_Appointment.treatment', context: context);

  @override
  String? get treatment {
    _$treatmentAtom.reportRead();
    return super.treatment;
  }

  @override
  set treatment(String? value) {
    _$treatmentAtom.reportWrite(value, super.treatment, () {
      super.treatment = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
fullDate: ${fullDate},
weight: ${weight},
nutritionalDiagnosis: ${nutritionalDiagnosis},
inappetence: ${inappetence},
nutritionalRisk: ${nutritionalRisk},
tnoStatus: ${tnoStatus},
therapeuticPlan: ${therapeuticPlan},
treatment: ${treatment}
    ''';
  }
}
