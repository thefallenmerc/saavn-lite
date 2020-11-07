class SongFromSearch {
  String id;
  String title;
  String image;
  String album;
  String url;
  String type;
  String description;
  int ctr;
  int position;
  MoreInfo moreInfo;

  SongFromSearch(
      {this.id,
      this.title,
      this.image,
      this.album,
      this.url,
      this.type,
      this.description,
      this.ctr,
      this.position,
      this.moreInfo});

  SongFromSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    album = json['album'];
    url = json['url'];
    type = json['type'];
    description = json['description'];
    ctr = json['ctr'];
    position = json['position'];
    moreInfo = json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['album'] = this.album;
    data['url'] = this.url;
    data['type'] = this.type;
    data['description'] = this.description;
    data['ctr'] = this.ctr;
    data['position'] = this.position;
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo.toJson();
    }
    return data;
  }
}

class MoreInfo {
  String primaryArtists;
  String singers;
  bool videoAvailable;
  String language;

  MoreInfo(
      {this.primaryArtists, this.singers, this.videoAvailable, this.language});

  MoreInfo.fromJson(Map<String, dynamic> json) {
    primaryArtists = json['primary_artists'];
    singers = json['singers'];
    videoAvailable = json['video_available'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary_artists'] = this.primaryArtists;
    data['singers'] = this.singers;
    data['video_available'] = this.videoAvailable;
    data['language'] = this.language;
    return data;
  }
}
