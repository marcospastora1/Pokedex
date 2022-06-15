import 'package:ekko/infrastructure/navigation/bindings/controllers/home.controller.binding.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return the correct pokemon field', () {
    final field = makePokemonField();
    expect(field.value, []);
  });
}
