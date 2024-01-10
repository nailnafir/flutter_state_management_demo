import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider(
  (ref) => "Nailul Firdaus",
);

final greetingProvider = Provider(
  (ref) => "Hello ${ref.watch(nameProvider)}",
);
