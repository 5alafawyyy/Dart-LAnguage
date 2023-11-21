class SpaceAge {
  late double result;
  late double earthAge;
  double age({required String planet, required int seconds}) {
    earthAge = seconds / 31557600;
    switch (planet) {
      case 'Mercury':
        result = earthAge / 0.2408467;
        break;
      case 'Venus':
        result = earthAge / 0.61519726;
        break;
      case 'Mars':
        result = earthAge / 1.8808158;
        break;
      case 'Jupiter':
        result = earthAge / 11.862615;
        break;
      case 'Saturn':
        result = earthAge / 29.447498;
        break;
      case 'Uranus':
        result = earthAge / 84.016846;
        break;
      case 'Neptune':
        result = earthAge / 164.79132;
        break;

      default:
        result = earthAge;
    }

    return double.parse(result.toStringAsFixed(2));
  }
}