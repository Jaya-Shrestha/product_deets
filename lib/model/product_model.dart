class Product {
  final String title;
  final String message;
  final ProductData data;

  Product({
    required this.title,
    required this.message,
    required this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      message: json['message'],
      data: ProductData.fromJson(json['data']),
    );
  }
}

class ProductData {
  final String id;
  final String slug;
  final Category category;
  final Brand brand;
  final String title;
  final String ingredient;
  final String howToUse;
  final String description;
  final int price;
  final int rewardPoint;
  final int commissionPercentage;
  final int strikePrice;
  final int offPercent;
  final int minOrder;
  final int maxOrder;
  final bool status;
  final List<String> images;
  final List<ColorAttribute> colorAttributes;
  final List<Variant> colorVariants;
  final int ratings;
  final int totalRatings;
  final int ratedBy;
  final bool isTodaysDeal;
  final bool isFeatured;
  final bool isPublished;
  final bool isDeleted;
  final List<Breadcrumb> breadCrums;

  ProductData({
    required this.id,
    required this.slug,
    required this.category,
    required this.brand,
    required this.title,
    required this.ingredient,
    required this.howToUse,
    required this.description,
    required this.price,
    required this.rewardPoint,
    required this.commissionPercentage,
    required this.strikePrice,
    required this.offPercent,
    required this.minOrder,
    required this.maxOrder,
    required this.status,
    required this.images,
    required this.colorAttributes,
    required this.colorVariants,
    required this.ratings,
    required this.totalRatings,
    required this.ratedBy,
    required this.isTodaysDeal,
    required this.isFeatured,
    required this.isPublished,
    required this.isDeleted,
    required this.breadCrums,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['_id'],
      slug: json['slug'],
      category: Category.fromJson(json['category']),
      brand: Brand.fromJson(json['brand']),
      title: json['title'],
      ingredient: json['ingredient'],
      howToUse: json['howToUse'],
      description: json['description'],
      price: json['price'],
      rewardPoint: json['rewardPoint'],
      commissionPercentage: json['commissionPercentage'],
      strikePrice: json['strikePrice'],
      offPercent: json['offPercent'],
      minOrder: json['minOrder'],
      maxOrder: json['maxOrder'],
      status: json['status'],
      images: List<String>.from(json['images']),
      colorAttributes: (json['colorAttributes'] as List).map((e) => ColorAttribute.fromJson(e)).toList(),
      colorVariants: (json['colorVariants'] as List).map((e) => Variant.fromJson(e)).toList(),
      ratings: json['ratings'],
      totalRatings: json['totalRatings'],
      ratedBy: json['ratedBy'],
      isTodaysDeal: json['isTodaysDeal'],
      isFeatured: json['isFeatured'],
      isPublished: json['isPublished'],
      isDeleted: json['isDeleted'],
      breadCrums: (json['breadCrums'] as List).map((e) => Breadcrumb.fromJson(e)).toList(),
    );
  }
}

class Category {
  final String id;
  final String slug;
  final String title;
  final int level;
  final String parentId;

  Category({
    required this.id,
    required this.slug,
    required this.title,
    required this.level,
    required this.parentId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      slug: json['slug'],
      title: json['title'],
      level: json['level'],
      parentId: json['parentId'],
    );
  }
}

class Brand {
  final String id;
  final String slug;
  final String name;

  Brand({
    required this.id,
    required this.slug,
    required this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      slug: json['slug'],
      name: json['name'],
    );
  }
}

class ColorAttribute {
  final String id;
  final bool isTwin;
  final String name;
  final List<String> colorValue;

  ColorAttribute({
    required this.id,
    required this.isTwin,
    required this.name,
    required this.colorValue,
  });

  factory ColorAttribute.fromJson(Map<String, dynamic> json) {
    return ColorAttribute(
      id: json['_id'],
      isTwin: json['isTwin'],
      name: json['name'],
      colorValue: List<String>.from(json['colorValue']),
    );
  }
}

class Variant {
  final ColorAttribute color;
  final int price;
  final int rewardPoint;
  final int strikePrice;
  final int offPercent;
  final int minOrder;
  final int maxOrder;
  final bool status;
  final List<String> images;
  final String productCode;
  final String id;

  Variant({
    required this.color,
    required this.price,
    required this.rewardPoint,
    required this.strikePrice,
    required this.offPercent,
    required this.minOrder,
    required this.maxOrder,
    required this.status,
    required this.images,
    required this.productCode,
    required this.id,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      color: ColorAttribute.fromJson(json['color']),
      price: json['price'],
      rewardPoint: json['rewardPoint'],
      strikePrice: json['strikePrice'],
      offPercent: json['offPercent'],
      minOrder: json['minOrder'],
      maxOrder: json['maxOrder'],
      status: json['status'],
      images: List<String>.from(json['images']),
      productCode: json['productCode'],
      id: json['_id'],
    );
  }
}

class Breadcrumb {
  final String title;
  final String slug;

  Breadcrumb({
    required this.title,
    required this.slug,
  });

  factory Breadcrumb.fromJson(Map<String, dynamic> json) {
    return Breadcrumb(
      title: json['title'],
      slug: json['slug'],
    );
  }
}
