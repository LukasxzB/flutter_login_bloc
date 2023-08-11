import 'dart:async';

mixin Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (String? email, sink) {
    if (email == null || email.isEmpty || !email.contains('@')) {
      sink.addError('Enter a valid email');
      return;
    }
    sink.add(email);
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (String? password, sink) {
    if (password == null || password.isEmpty || password.length < 4) {
      sink.addError('Password must be at least 4 characters');
      return;
    }
    sink.add(password);
  });
}
