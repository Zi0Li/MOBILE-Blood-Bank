const String donateTable = 'donateTable';
const String idColumn = 'idColumn';
const String nameColumn = 'nameColumn';
const String bloodColumn = 'bloodColumn';
const String numberColumn = 'numberColumn';
const String dateColumn = 'dateColumn';
const String streetColumn = 'streetColumn';
const String districtColumn = 'districtColumn';
const String clinicColumn = 'clinicColumn';
const String doctorColumn = 'doctorColumn';
const String statusColumn = 'statusColumn';


class Donate {
  int? id;
  String? number;
  String? name;
  String? blood;
  String? date;
  String? street;
  String? district;
  String? clinic;
  String? doctor;
  String? status;

  Donate();

  Donate.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    blood = map[bloodColumn];
    number = map[numberColumn];
    date = map[dateColumn];
    street = map[streetColumn];
    district = map[districtColumn];
    clinic = map[clinicColumn];
    doctor = map[doctorColumn];
    status = map[statusColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      streetColumn: street,
      nameColumn: name,
      bloodColumn: blood,
      districtColumn: district,
      numberColumn: number,
      dateColumn: date,
      clinicColumn: clinic,
      doctorColumn: doctor,
      statusColumn: status,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Donate(id: $id,date: $date,name: $name,blood: $blood, number: $number, street: $street, district: $district, clinic: $clinic, doctor: $doctor, status: $status)";
  }
}
