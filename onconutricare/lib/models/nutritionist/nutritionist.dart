import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'nutritionist.g.dart';

class Nutritionist = _Nutritionist with _$Nutritionist;

abstract class _Nutritionist with Store {
  @observable
  String? name;
  @observable
  String? uuid;
  @observable
  String? email;
  @observable
  String? password;
  @observable
  String? phone;
  @observable
  int? crnNumber;
  @observable
  String? crnAcronym;
  @observable
  String? photoUrl;

  _Nutritionist();

  _Nutritionist.fromJson(Map<String, dynamic> json) {
    name = json['nomeCompleto'];
    uuid = json['idNutricionista'];
    email = json['email'];
    phone = json['telefone'];
    crnNumber = int.parse(json['crnNumero']);
    crnAcronym = json['crnSigla'];
    photoUrl = json['photoUrl'];
  }

  _Nutritionist.fromCredential(UserCredential userCredential) {
    final user = userCredential.user!;
    name = user.displayName ?? '';
    uuid = user.uid;
    email = user.email ?? '';
    phone = user.phoneNumber;
    photoUrl = user.photoURL;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomeCompleto'] = name;
    data['idNutricionista'] = uuid;
    data['email'] = email;
    data['telefone'] = phone;
    data['crnNumero'] = crnNumber;
    data['crnSigla'] = crnAcronym;
    data['photoUrl'] = photoUrl;
    return data;
  }

  @action
  void setNutritionist(UserCredential userCredential) {
    final user = userCredential.user!;
    uuid = user.uid;
    email = user.email ?? '';
  }

  @action
  void setNutritionistLogged(User user) {
    name = user.displayName ?? '';
    uuid = user.uid;
    email = user.email ?? '';
    phone = user.phoneNumber;
    photoUrl = user.photoURL;
  }
}
