List<Sliders> slidersFromJson(dynamic str) =>
    List<Sliders>.from((str).map((x) => Sliders.fromJson(x)));

class Sliders {
  final String sliderName;
  final String sliderImage;
  final String sliderId;

  Sliders({
    required this.sliderName,
    required this.sliderImage,
    required this.sliderId,
  });

  factory Sliders.fromJson(Map<String, dynamic> json) {
    return Sliders(
      sliderName: json['sliderName'],
      sliderImage: json['sliderImage'],
      sliderId: json['sliderId'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sliderId'] = sliderId;
    _data['sliderName'] = sliderName;
    _data['sliderImage'] = sliderImage;
    return _data;
  }
}
