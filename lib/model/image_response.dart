class ImageResponse {
  String? id;
  String? slug;
  String? createdAt;
  String? updatedAt;
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  dynamic altDescription;
  List<dynamic>? breadcrumbs;
  Urls? urls;
  Links? links;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  dynamic sponsorship;
  TopicSubmissions? topicSubmissions;
  User? user;
  Exif? exif;
  Location? location;
  int? views;
  int? downloads;

  ImageResponse(
      {this.id, this.slug, this.createdAt, this.updatedAt, this.promotedAt, this.width, this.height, this.color, this.blurHash, this.description, this.altDescription, this.breadcrumbs, this.urls, this.links, this.likes, this.likedByUser, this.currentUserCollections, this.sponsorship, this.topicSubmissions, this.user, this.exif, this.location, this.views, this.downloads});

  ImageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    if (json['breadcrumbs'] != null) {
      breadcrumbs = <Null>[];
      json['breadcrumbs'].forEach((v) {
        breadcrumbs!.add(v);
      });
    }
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    if (json['current_user_collections'] != null) {
      currentUserCollections = <Null>[];
      json['current_user_collections'].forEach((v) {
        currentUserCollections!.add(v);
      });
    }
    sponsorship = json['sponsorship'];
    topicSubmissions =
    json['topic_submissions'] != null ? new TopicSubmissions.fromJson(
        json['topic_submissions']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    exif = json['exif'] != null ? new Exif.fromJson(json['exif']) : null;
    location =
    json['location'] != null ? new Location.fromJson(json['location']) : null;
    views = json['views'];
    downloads = json['downloads'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['promoted_at'] = this.promotedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['blur_hash'] = this.blurHash;
    data['description'] = this.description;
    data['alt_description'] = this.altDescription;
    if (this.breadcrumbs != null) {
      data['breadcrumbs'] = this.breadcrumbs!.map((v) => v.toJson()).toList();
    }
    if (this.urls != null) {
      data['urls'] = this.urls!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    if (this.currentUserCollections != null) {
      data['current_user_collections'] =
          this.currentUserCollections!.map((v) => v.toJson()).toList();
    }
    data['sponsorship'] = this.sponsorship;
    if (this.topicSubmissions != null) {
      data['topic_submissions'] = this.topicSubmissions!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.exif != null) {
      data['exif'] = this.exif!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['views'] = this.views;
    data['downloads'] = this.downloads;
    return data;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls(
      {this.raw, this.full, this.regular, this.small, this.thumb, this.smallS3});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
    smallS3 = json['small_s3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    data['small_s3'] = this.smallS3;
    return data;
  }
}

class Links {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  Links({this.self, this.html, this.download, this.downloadLocation});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['download'] = download;
    data['download_location'] = downloadLocation;
    return data;
  }
}

class TopicSubmissions {


  TopicSubmissions();

TopicSubmissions.fromJson
(
Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
return data;
}
}

class User {
String? id;
String? updatedAt;
String? username;
String? name;
String? firstName;
String? lastName;
dynamic twitterUsername; /// 1
String? portfolioUrl;
dynamic bio; /// 2
String? location;
Links? links;
ProfileImage? profileImage;
String? instagramUsername;
int? totalCollections;
int? totalLikes;
int? totalPhotos;
int? totalPromotedPhotos;
bool? acceptedTos;
bool? forHire;
Social? social;

User({this.id, this.updatedAt, this.username, this.name, this.firstName, this.lastName, this.twitterUsername, this.portfolioUrl, this.bio, this.location, this.links, this.profileImage, this.instagramUsername, this.totalCollections, this.totalLikes, this.totalPhotos, this.totalPromotedPhotos, this.acceptedTos, this.forHire, this.social});

User.fromJson(Map<String, dynamic> json) {
id = json['id'];
updatedAt = json['updated_at'];
username = json['username'];
name = json['name'];
firstName = json['first_name'];
lastName = json['last_name'];
twitterUsername = json['twitter_username'];
portfolioUrl = json['portfolio_url'];
bio = json['bio'];
location = json['location'];
links = json['links'] != null ? new Links.fromJson(json['links']) : null;
profileImage = json['profile_image'] != null ? new ProfileImage.fromJson(json['profile_image']) : null;
instagramUsername = json['instagram_username'];
totalCollections = json['total_collections'];
totalLikes = json['total_likes'];
totalPhotos = json['total_photos'];
totalPromotedPhotos = json['total_promoted_photos'];
acceptedTos = json['accepted_tos'];
forHire = json['for_hire'];
social = json['social'] != null ? new Social.fromJson(json['social']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['updated_at'] = this.updatedAt;
data['username'] = this.username;
data['name'] = this.name;
data['first_name'] = this.firstName;
data['last_name'] = this.lastName;
data['twitter_username'] = this.twitterUsername;
data['portfolio_url'] = this.portfolioUrl;
data['bio'] = this.bio;
data['location'] = this.location;
if (this.links != null) {
data['links'] = this.links!.toJson();
}
if (this.profileImage != null) {
data['profile_image'] = this.profileImage!.toJson();
}
data['instagram_username'] = this.instagramUsername;
data['total_collections'] = this.totalCollections;
data['total_likes'] = this.totalLikes;
data['total_photos'] = this.totalPhotos;
data['total_promoted_photos'] = this.totalPromotedPhotos;
data['accepted_tos'] = this.acceptedTos;
data['for_hire'] = this.forHire;
if (this.social != null) {
data['social'] = this.social!.toJson();
}
return data;
}
}
class ProfileImage {
String? small;
String? medium;
String? large;

ProfileImage({this.small, this.medium, this.large});

ProfileImage.fromJson(Map<String, dynamic> json) {
small = json['small'];
medium = json['medium'];
large = json['large'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['small'] = this.small;
data['medium'] = this.medium;
data['large'] = this.large;
return data;
}
}

class Social {
String? instagramUsername;
String? portfolioUrl;
dynamic twitterUsername;
dynamic paypalEmail;

Social({this.instagramUsername, this.portfolioUrl, this.twitterUsername, this.paypalEmail});

Social.fromJson(Map<String, dynamic> json) {
instagramUsername = json['instagram_username'];
portfolioUrl = json['portfolio_url'];
twitterUsername = json['twitter_username'];
paypalEmail = json['paypal_email'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['instagram_username'] = this.instagramUsername;
data['portfolio_url'] = this.portfolioUrl;
data['twitter_username'] = this.twitterUsername;
data['paypal_email'] = this.paypalEmail;
return data;
}
}

class Exif {
String? make;
String? model;
String? name;
String? exposureTime;
String? aperture;
String? focalLength;
int? iso;

Exif({this.make, this.model, this.name, this.exposureTime, this.aperture, this.focalLength, this.iso});

Exif.fromJson(Map<String, dynamic> json) {
make = json['make'];
model = json['model'];
name = json['name'];
exposureTime = json['exposure_time'];
aperture = json['aperture'];
focalLength = json['focal_length'];
iso = json['iso'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['make'] = this.make;
data['model'] = this.model;
data['name'] = this.name;
data['exposure_time'] = this.exposureTime;
data['aperture'] = this.aperture;
data['focal_length'] = this.focalLength;
data['iso'] = this.iso;
return data;
}
}

class Location {
dynamic name;
dynamic city;
dynamic country;
Position? position;

Location({this.name, this.city, this.country, this.position});

Location.fromJson(Map<String, dynamic> json) {
name = json['name'];
city = json['city'];
country = json['country'];
position = json['position'] != null ? new Position.fromJson(json['position']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['name'] = this.name;
data['city'] = this.city;
data['country'] = this.country;
if (this.position != null) {
data['position'] = this.position!.toJson();
}
return data;
}
}

class Position {
  dynamic latitude;
  dynamic longitude;

Position({this.latitude, this.longitude});

Position.fromJson(Map<String, dynamic> json) {
latitude = json['latitude'];
longitude = json['longitude'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['latitude'] = this.latitude;
data['longitude'] = this.longitude;
return data;
}
}