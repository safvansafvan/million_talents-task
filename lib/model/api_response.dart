class NameResponse {
  String? id;
  String? name;

  NameResponse({
    this.id,
    this.name,
  });

  factory NameResponse.fromJson(Map<String, dynamic> json) => NameResponse(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
