class ModelClass {
  String? img;
  String? title;
  String? subtitle;
  String? tex;

  ModelClass({this.img, this.subtitle, this.tex, this.title});
  static List<ModelClass> mylist = [
    ModelClass(
        img: "images/biryani.jpg",
        title: "Waldort Saled",
        subtitle: "Cooked Chicken",
        tex: "Apple Breakfast"),
    ModelClass(
        img: "images/biryani.jpg",
        title: "Waldort Saled",
        subtitle: "Cooked Chicken",
        tex: "Apple Breakfast"),
    ModelClass(
        img: "images/biryani.jpg",
        title: "Waldort Saled",
        subtitle: "Cooked Chicken",
        tex: "Apple Breakfast"),
    ModelClass(
        img: "images/biryani.jpg",
        title: "Waldort Saled",
        subtitle: "Cooked Chicken",
        tex: "Apple Breakfast")
  ];
}
