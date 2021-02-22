class Transfer {
  final String bank;
  final double value;

  Transfer(this.bank, this.value);

  @override
  String toString() {
    return 'Transfer {bank: $bank, value: $value}';
  }

  String toStringValue() {
    return "R\$ $value";
  }
}
