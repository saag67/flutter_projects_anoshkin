class Sight {
  String name, lat, lon, url, details, type;
  Sight(this.name, this.lat, this.lon, this.url, this.details, this.type);

  var gelendzhik = Sight(
      "геленджик",
      "44.5622",
      "38.0848",
      "http://gelendzhik.org/",
      "город-курорт на побережье Черного моря, Краснодарский край РФ",
      "курорт");

  var bora_bora = Sight(
      "Bora-Bora",
      "-16.483333",
      "-151.733333",
      "https://www.tahiti.com/island/bora-bora",
      "Остров во Француской Полинезии",
      "курорт");
  var formentera = Sight(
      "Formentera",
      "38.0850900",
      "0°44′45",
      "https://www.ibiza-spotlight.com/formentera_i.htm",
      "Остров Formentera de Segura, Испания",
      "курорт");
}
