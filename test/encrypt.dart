import 'package:flower_password/flower_password.dart';

main(List<String> args) {
  assert(FlowerPassword.encrypt('t1mer', 'lizhaoming') == 'fCD03bcE9f559F88');
  assert(FlowerPassword.encrypt('t1mer', 'twitter') == 'Kb9C88e0Aa48fE7f');
}
