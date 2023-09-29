// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritionist.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Nutritionist on _Nutritionist, Store {
  late final _$nameAtom = Atom(name: '_Nutritionist.name', context: context);

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

  late final _$uuidAtom = Atom(name: '_Nutritionist.uuid', context: context);

  @override
  String? get uuid {
    _$uuidAtom.reportRead();
    return super.uuid;
  }

  @override
  set uuid(String? value) {
    _$uuidAtom.reportWrite(value, super.uuid, () {
      super.uuid = value;
    });
  }

  late final _$emailAtom = Atom(name: '_Nutritionist.email', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_Nutritionist.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_Nutritionist.phone', context: context);

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

  late final _$crnNumberAtom =
      Atom(name: '_Nutritionist.crnNumber', context: context);

  @override
  int? get crnNumber {
    _$crnNumberAtom.reportRead();
    return super.crnNumber;
  }

  @override
  set crnNumber(int? value) {
    _$crnNumberAtom.reportWrite(value, super.crnNumber, () {
      super.crnNumber = value;
    });
  }

  late final _$crnAcronymAtom =
      Atom(name: '_Nutritionist.crnAcronym', context: context);

  @override
  String? get crnAcronym {
    _$crnAcronymAtom.reportRead();
    return super.crnAcronym;
  }

  @override
  set crnAcronym(String? value) {
    _$crnAcronymAtom.reportWrite(value, super.crnAcronym, () {
      super.crnAcronym = value;
    });
  }

  late final _$photoUrlAtom =
      Atom(name: '_Nutritionist.photoUrl', context: context);

  @override
  String? get photoUrl {
    _$photoUrlAtom.reportRead();
    return super.photoUrl;
  }

  @override
  set photoUrl(String? value) {
    _$photoUrlAtom.reportWrite(value, super.photoUrl, () {
      super.photoUrl = value;
    });
  }

  late final _$_NutritionistActionController =
      ActionController(name: '_Nutritionist', context: context);

  @override
  void setNutritionist(UserCredential userCredential) {
    final _$actionInfo = _$_NutritionistActionController.startAction(
        name: '_Nutritionist.setNutritionist');
    try {
      return super.setNutritionist(userCredential);
    } finally {
      _$_NutritionistActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNutritionistLogged(User user) {
    final _$actionInfo = _$_NutritionistActionController.startAction(
        name: '_Nutritionist.setNutritionistLogged');
    try {
      return super.setNutritionistLogged(user);
    } finally {
      _$_NutritionistActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
uuid: ${uuid},
email: ${email},
password: ${password},
phone: ${phone},
crnNumber: ${crnNumber},
crnAcronym: ${crnAcronym},
photoUrl: ${photoUrl}
    ''';
  }
}
