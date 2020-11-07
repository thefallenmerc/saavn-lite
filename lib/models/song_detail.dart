class SongDetail {
  String id;
  String type;
  String song;
  String album;
  String year;
  String music;
  String musicId;
  String primaryArtists;
  String primaryArtistsId;
  String featuredArtists;
  String featuredArtistsId;
  String singers;
  String starring;
  String image;
  String image500;
  String label;
  String albumid;
  String language;
  String origin;
  int playCount;
  String copyrightText;
  String s320kbps;
  int explicitContent;
  String hasLyrics;
  String lyricsSnippet;
  String encryptedMediaUrl;
  String encryptedMediaPath;
  String mediaPreviewUrl;
  String mediaUrl;
  String permaUrl;
  String albumUrl;
  String duration;
  Rights rights;
  String cacheState;
  String starred;
  ArtistMap artistMap;
  String releaseDate;
  String labelUrl;

  SongDetail(
      {this.id,
      this.type,
      this.song,
      this.album,
      this.year,
      this.music,
      this.musicId,
      this.primaryArtists,
      this.primaryArtistsId,
      this.featuredArtists,
      this.featuredArtistsId,
      this.singers,
      this.starring,
      this.image,
      this.image500,
      this.label,
      this.albumid,
      this.language,
      this.origin,
      this.playCount,
      this.copyrightText,
      this.s320kbps,
      this.explicitContent,
      this.hasLyrics,
      this.lyricsSnippet,
      this.encryptedMediaUrl,
      this.encryptedMediaPath,
      this.mediaPreviewUrl,
      this.mediaUrl,
      this.permaUrl,
      this.albumUrl,
      this.duration,
      this.rights,
      this.cacheState,
      this.starred,
      this.artistMap,
      this.releaseDate,
      this.labelUrl});

  SongDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    song = json['song'];
    album = json['album'];
    year = json['year'];
    music = json['music'];
    musicId = json['music_id'];
    primaryArtists = json['primary_artists'];
    primaryArtistsId = json['primary_artists_id'];
    featuredArtists = json['featured_artists'];
    featuredArtistsId = json['featured_artists_id'];
    singers = json['singers'];
    starring = json['starring'];
    image = json['image'];
    image500 = json['image500'];
    label = json['label'];
    albumid = json['albumid'];
    language = json['language'];
    origin = json['origin'];
    playCount = json['play_count'];
    copyrightText = json['copyright_text'];
    s320kbps = json['320kbps'];
    explicitContent = json['explicit_content'];
    hasLyrics = json['has_lyrics'];
    lyricsSnippet = json['lyrics_snippet'];
    encryptedMediaUrl = json['encrypted_media_url'];
    encryptedMediaPath = json['encrypted_media_path'];
    mediaPreviewUrl = json['media_preview_url'];
    mediaUrl = json['media_url'];
    permaUrl = json['perma_url'];
    albumUrl = json['album_url'];
    duration = json['duration'];
    rights =
        json['rights'] != null ? new Rights.fromJson(json['rights']) : null;
    cacheState = json['cache_state'];
    starred = json['starred'];
    artistMap = json['artistMap'] != null
        ? new ArtistMap.fromJson(json['artistMap'])
        : null;
    releaseDate = json['release_date'];
    labelUrl = json['label_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['song'] = this.song;
    data['album'] = this.album;
    data['year'] = this.year;
    data['music'] = this.music;
    data['music_id'] = this.musicId;
    data['primary_artists'] = this.primaryArtists;
    data['primary_artists_id'] = this.primaryArtistsId;
    data['featured_artists'] = this.featuredArtists;
    data['featured_artists_id'] = this.featuredArtistsId;
    data['singers'] = this.singers;
    data['starring'] = this.starring;
    data['image'] = this.image;
    data['label'] = this.label;
    data['albumid'] = this.albumid;
    data['language'] = this.language;
    data['origin'] = this.origin;
    data['play_count'] = this.playCount;
    data['copyright_text'] = this.copyrightText;
    data['320kbps'] = this.s320kbps;
    data['explicit_content'] = this.explicitContent;
    data['has_lyrics'] = this.hasLyrics;
    data['lyrics_snippet'] = this.lyricsSnippet;
    data['encrypted_media_url'] = this.encryptedMediaUrl;
    data['encrypted_media_path'] = this.encryptedMediaPath;
    data['media_preview_url'] = this.mediaPreviewUrl;
    data['perma_url'] = this.permaUrl;
    data['album_url'] = this.albumUrl;
    data['duration'] = this.duration;
    if (this.rights != null) {
      data['rights'] = this.rights.toJson();
    }
    data['cache_state'] = this.cacheState;
    data['starred'] = this.starred;
    if (this.artistMap != null) {
      data['artistMap'] = this.artistMap.toJson();
    }
    data['release_date'] = this.releaseDate;
    data['label_url'] = this.labelUrl;
    return data;
  }
}

class Rights {
  int code;
  String reason;
  bool cacheable;
  bool deleteCachedObject;

  Rights({this.code, this.reason, this.cacheable, this.deleteCachedObject});

  Rights.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    reason = json['reason'];
    cacheable = json['cacheable'];
    deleteCachedObject = json['delete_cached_object'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['reason'] = this.reason;
    data['cacheable'] = this.cacheable;
    data['delete_cached_object'] = this.deleteCachedObject;
    return data;
  }
}

class ArtistMap {
  String dinoJames;

  ArtistMap({this.dinoJames});

  ArtistMap.fromJson(Map<String, dynamic> json) {
    dinoJames = json['Dino James'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Dino James'] = this.dinoJames;
    return data;
  }
}
