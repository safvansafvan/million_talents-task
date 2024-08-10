class ProductAddModel {
  String? first;
  String? second;
  String? third;
  String? image;

  ProductAddModel({
    this.first,
    this.second,
    this.third,
    this.image,
  });

  factory ProductAddModel.fromJson(Map<String, dynamic> json) =>
      ProductAddModel(
        first: json["first"],
        second: json["second"],
        third: json["third"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
        "third": third,
        "image": image,
      };
}
