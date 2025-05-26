class Counter {
  int value;

  Counter({required this.value});

  Map<String, dynamic> toJson() {
    return {'value': value};
  }

  factory Counter.fromJson(Map<String, dynamic> json) {
    return Counter(value: json['value']);
  }
}
