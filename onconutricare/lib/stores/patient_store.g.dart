// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PatientsStore on _PatientsStore, Store {
  late final _$patientsAtom =
      Atom(name: '_PatientsStore.patients', context: context);

  @override
  ObservableList<Patient> get patients {
    _$patientsAtom.reportRead();
    return super.patients;
  }

  @override
  set patients(ObservableList<Patient> value) {
    _$patientsAtom.reportWrite(value, super.patients, () {
      super.patients = value;
    });
  }

  late final _$createNewPatientAsyncAction =
      AsyncAction('_PatientsStore.createNewPatient', context: context);

  @override
  Future<void> createNewPatient(Patient newPatient) {
    return _$createNewPatientAsyncAction
        .run(() => super.createNewPatient(newPatient));
  }

  late final _$loadPatientsAsyncAction =
      AsyncAction('_PatientsStore.loadPatients', context: context);

  @override
  Future<void> loadPatients() {
    return _$loadPatientsAsyncAction.run(() => super.loadPatients());
  }

  late final _$removePatientAsyncAction =
      AsyncAction('_PatientsStore.removePatient', context: context);

  @override
  Future<void> removePatient(Patient patient) {
    return _$removePatientAsyncAction.run(() => super.removePatient(patient));
  }

  late final _$_PatientsStoreActionController =
      ActionController(name: '_PatientsStore', context: context);

  @override
  void addPatient(Patient newPatient) {
    final _$actionInfo = _$_PatientsStoreActionController.startAction(
        name: '_PatientsStore.addPatient');
    try {
      return super.addPatient(newPatient);
    } finally {
      _$_PatientsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int calculateAge(String? birthday) {
    final _$actionInfo = _$_PatientsStoreActionController.startAction(
        name: '_PatientsStore.calculateAge');
    try {
      return super.calculateAge(birthday);
    } finally {
      _$_PatientsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
patients: ${patients}
    ''';
  }
}
