import '../model/parking_model.dart';

class ParkingService {
  Future<List<ParkingSpot>> getSpots() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      ParkingSpot(
        name: "Bole Parking",
        location: "Addis Ababa",
        slots: 20,
        lat: 8.9806,
        lng: 38.7578,
      ),
      ParkingSpot(
        name: "Piassa Parking",
        location: "Addis Ababa",
        slots: 10,
        lat: 9.03,
        lng: 38.74,
      ),
    ];
  }
}