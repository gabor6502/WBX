class Weight {
  double weight;

  Weight(this.weight);

  Weight operator +(Weight? other) {
    return Weight(other != null ? weight + other.weight : weight);
  }
}
