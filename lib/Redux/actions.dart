class SetRouteAction {
  final String newRoute;

  SetRouteAction(this.newRoute);
}

//Bangun Datar
class CalculateSquareValue {
  final double side;
  CalculateSquareValue(this.side);
}

class CalculateRectangleValue {
  final double length;
  final double width;
  CalculateRectangleValue(this.length, this.width);
}

class CalculateTriangleValue {
  final double side1;
  final double side2;
  final double side3;
  CalculateTriangleValue(this.side1, this.side2, this.side3);
}

//Aritmatika
class CalculateAritmatik {
  final double value;

  CalculateAritmatik(this.value);
}

//Bangun Ruang
class CalculateBoxValue {
  final double panjang;
  final double lebar;
  final double tinggi;

  CalculateBoxValue(this.panjang, this.lebar, this.tinggi);
}

class CalculateCubeValue {
  final double sisi;

  CalculateCubeValue(this.sisi);
}

class CalculateTubeValue {
  final double jariJari;
  final double tinggi;

  CalculateTubeValue(this.jariJari, this.tinggi);
}

//Perpangkatan
class CalculatePerpangkatan {
  final double value;

  CalculatePerpangkatan(this.value);
}

class resetCalculateValue {
  final double value;

  resetCalculateValue(this.value);
}
