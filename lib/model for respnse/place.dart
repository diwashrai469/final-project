class places {
  String id;
  String name;
  String address;
  String phone_number;

  places({
    required this.id,
    required this.name,
    required this.address,
    required this.phone_number,
  });

  factory places.fromJson(dynamic json) {
    return places(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone_number: json['phone_number'],
    );
  }
  static List<places> placeFromSnapshot(List snapshot) {
    return snapshot.map((e) {
      return places.fromJson(e);
    }).toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'places{id:$id, name:$name,address:$address,phone_number:$phone_number}';
  }
}
