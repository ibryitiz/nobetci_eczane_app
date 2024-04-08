class Eczane {
  final String name;
  final String dist;
  final String address;
  final String phone;
  final String location;

  Eczane(
    this.name,
    this.dist,
    this.address,
    this.phone,
    this.location,
  );

  Eczane.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        dist = json['dist'] ?? "",
        address = json['address'] ?? "",
        phone = json['phone'] ?? "",
        location = json['loc'] ?? "";
}
