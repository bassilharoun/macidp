class LicenseData {
  LicenseData({
    this.imagePath = '',
    this.startColor = '',
    this.endColor = '',
    this.title = '',
    this.oldPrice = 0,
    this.price = 0,
    this.features ,
  });

  String imagePath;
  String startColor;
  String endColor;
  String title;
  int oldPrice;
  int price;
  List<String>? features;

  static List<LicenseData> licenses = <LicenseData>[
    LicenseData(
      imagePath: 'assets/images/200.png',
      title: 'ONE YEAR',
      price: 200,
      oldPrice: 0,
      features: <String>['53% Discount,','Limited Time Offer', 'Instant PDF Delivery','License Card & Book','EXP : 2024-10-19'],
      startColor: '#0072E7',
      endColor: '#0A296D',
    ),
    LicenseData(
      imagePath: 'assets/images/250.png',
      title: 'THREE YEARS',
      price: 300,
      oldPrice: 600,
      features: <String>['57% Discount','Limited Time Offer', 'Instant PDF Delivery','License Card & Book','EXP : 2026-10-19'],
      startColor: '#FE95B6',
      endColor: '#8201E9',
    ),
    LicenseData(
      imagePath: 'assets/images/300.png',
      title: 'TOW YEARS',
      price: 250,
      oldPrice: 400,
      features: <String>['55% Discount,', 'Limited Time Offer','Instant PDF Delivery','License Card & Book','EXP : 2025-10-19'],
      startColor: '#FFFF8A',
      endColor: '#D89501',
    ),

  ];
}
