class Data {
  final int id;
  final int no_urut;
  final String nama;
  final int level;
  final int parent_id;
  final int pelajaran_id;
  final int is_deleted;
  final int created_at;
  final int created_by;
  final int modified_at;
  final int modified_by;
  final List<Detail> detail;

  Data(
    this.id,
    this.no_urut,
    this.nama,
    this.level,
    this.parent_id,
    this.pelajaran_id,
    this.is_deleted,
    this.created_at,
    this.created_by,
    this.modified_at,
    this.modified_by,
    this.detail,
  );

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['detail'] as List;
    List<Detail> detaillist = list.map((e) => Detail.fromJson(e)).toList();
    return Data(
      json['id'] as int,
      json['no_urut'] as int,
      json['nama'] as String,
      json['level'] as int,
      json['parent_id'] as int,
      json['pelajaran_id'] as int,
      json['is_deleted'] as int,
      json['created_at'] as int,
      json['created_by'] as int,
      json['modified_at'] as int,
      json['modified_by'] as int,
      detaillist,
    );
  }
}

class Detail {
  final String youtube_id;
  final String youtube_url;

  Detail(
    this.youtube_id,
    this.youtube_url,
  );

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      json['youtube_id'] as String,
      json['youtube_url'] as String,
    );
  }
}
