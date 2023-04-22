class YogaModel {
  int? id;
  String? sanskritName;
  String? englishName;
  String? imgUrl;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? procedure;
  String? benefits;
  String? gifUrl;

  YogaModel(
      {this.id,
      this.sanskritName,
      this.englishName,
      this.imgUrl,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.procedure,
      this.benefits,
      this.gifUrl});

  YogaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sanskritName = json['sanskrit_name'];
    englishName = json['english_name'];
    imgUrl = json['img_url'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    procedure = json['procedure'];
    benefits = json['benefits'];
    gifUrl = json['gif_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sanskrit_name'] = this.sanskritName;
    data['english_name'] = this.englishName;
    data['img_url'] = this.imgUrl;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['procedure'] = this.procedure;
    data['benefits'] = this.benefits;
    data['gif_url'] = this.gifUrl;
    return data;
  }

  String yogaTable = """CREATE TABLE yogaTable(
      id INTEGER PRIMARY KEY NOT NULL,
      sanskritName TEXT,
      englishName TEXT,
      imgUrl TEXT,
      userId INTEGER
      createdAt TEXT,
      updatedAt TEXT,
      procedure TEXT,
      benefits TEXT,
      gifUrl TEXT,


      )""";
}
