import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:login_bloc/src/blocs/validators.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String?> get validatedEmail => _email.stream.transform(validateEmail);
  Stream<String?> get validatedPassword =>
      _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => CombineLatestStream.combine2(
      validatedEmail, validatedPassword, (newEmail, newPassword) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
