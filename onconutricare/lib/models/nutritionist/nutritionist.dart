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

  _Nutritionist(
      {this.name,
      this.uuid,
      this.email,
      this.crnNumber,
      this.password,
      this.phone,
      this.crnAcronym,
      this.photoUrl});

  _Nutritionist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uuid = json['uuid'];
    email = json['email'];
    phone = json['phone'];
    crnNumber = json['crnNumber'];
    crnAcronym = json['crnAcronym'];
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
    data['name'] = name;
    data['uuid'] = uuid;
    data['email'] = email;
    data['phone'] = phone;
    data['crnNumber'] = crnNumber;
    data['crnAcronym'] = crnAcronym;
    data['photoUrl'] = photoUrl;
    return data;
  }

  @action
  void setNutritionist(UserCredential userCredential) {
    final user = userCredential.user!;
    name = user.displayName ?? '';
    uuid = user.uid;
    email = user.email ?? '';
    phone = user.phoneNumber;
    photoUrl = user.photoURL;
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
