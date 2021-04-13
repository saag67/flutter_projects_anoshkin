///класс-модель карточки интересного места

class Sight {
  String name, lat, lon, details, type;
  List<String> url = [];
  int id;
  Sight(this.id, this.name, this.lat, this.lon, this.url, this.details,
      this.type);
}
