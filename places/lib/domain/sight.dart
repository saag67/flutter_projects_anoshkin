///класс-модель карточки интересного места

class Sight {
  String name, lat, lon, details, type;
  List<String> url = [];
  Sight(this.name, this.lat, this.lon, this.url, this.details, this.type);
}
