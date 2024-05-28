const String userTable = 'userTable';
const String idColumn = 'idColumn';
const String nameColumn = 'nameColumn';
const String bloodColumn = 'bloodColumn';
const String numberColumn = 'numberColumn';
const String birthColumn = 'birthColumn';
const String tattooColumn = 'tattooColumn';
const String pigmentationColumn = 'pigmentationColumn';
const String makeupColumn = 'makeupColumn';
const String imageColumn = 'imageColumn';
const String statesColumn = 'statesColumn';
const String blood_centerColumn = 'blood_centerColumn';


class User {
  int? id;
  int? number;
  int? tattoo;
  int? pigmentation;
  int? makeup;
  String? name;
  String? birth;
  String? blood;
  String? image;
  String? states;
  String? blood_center;

  User();

  User.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    blood = map[bloodColumn];
    number = map[numberColumn];
    birth = map[birthColumn];
    tattoo = map[tattooColumn];
    pigmentation = map[pigmentationColumn];
    makeup = map[makeupColumn];
    image = map[imageColumn];
    states = map[statesColumn];
    blood_center = map[blood_centerColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      bloodColumn: blood,
      numberColumn: number,
      birthColumn: birth,
      tattooColumn: tattoo,
      pigmentationColumn: pigmentation,
      makeupColumn: makeup,
      imageColumn: image,
      statesColumn: states,
      blood_centerColumn: blood_center,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "User(id: $id,birth: $birth,name: $name,blood: $blood, number: $number, tattoo: $tattoo, pigmentation: $pigmentation, makeup: $makeup, image: $image, states: $states, blood_center: $blood_center)";
  }
}
