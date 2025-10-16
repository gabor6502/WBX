class Arm {
  final double arm;

  Arm(this.arm);

  Arm operator +(Arm? other) {
    return other != null ? Arm(arm + other.arm) : Arm(arm);
  }
}
