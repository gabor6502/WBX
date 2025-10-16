import 'package:wbx/model/wb_types/arm.dart';
import 'package:wbx/model/wb_types/weight.dart';

class Moment {
  Weight weight;
  Arm arm;
  double moment;

  Moment(this.weight, this.arm) : moment = weight.weight * arm.arm;

  static Arm getArmFrom(Moment m, Weight w) {
    return Arm(m.moment / w.weight);
  }

  Moment operator +(Moment? other) {
    return other != null
        ? Moment(weight + other.weight, arm + other.arm)
        : Moment(weight, arm);
  }
}
