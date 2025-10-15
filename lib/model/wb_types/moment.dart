import 'package:wbx/model/wb_types/arm.dart';
import 'package:wbx/model/wb_types/weight.dart';

class Moment {
  Weight weight;
  Arm arm;
  double moment;

  Moment(this.weight, this.arm) : moment = weight.weight * arm.arm;
}
