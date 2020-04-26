class Exercise {
  int _id;
  String _title;

  Exercise(this._title);

  Exercise.withId(this._id, this._title);

  int get id => _id;
  String get title => _title;

  set title(String newTitle) {
    if (newTitle.length <= 150) {
      this._title = newTitle;
    }
  }

  //convert Exercise object to Map object fro SQLITE
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    return map;
  }

  //Extract Exercise object from Map object
  Exercise.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
  }
}
