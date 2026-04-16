import 'package:flutter/material.dart';

// --- Subsystems (Complex Logic) ---

class FlightService {
  Future<bool> bookFlight(String destination, String date) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulating API call
    print('Flight to $destination on $date booked successfully.');
    return true;
  }
}

class HotelService {
  Future<bool> bookHotel(String destination, String date) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Hotel in $destination for $date booked successfully.');
    return true;
  }
}

class RentalService {
  Future<bool> reserveCar(String destination) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Car rental in $destination reserved successfully.');
    return true;
  }
}

class InsuranceService {
  Future<bool> provideInsurance(String destination) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Travel insurance for $destination issued.');
    return true;
  }
}

// --- The Facade ---

enum BookingStatus { idle, loading, success, error }

class TravelFacade extends ChangeNotifier {
  final FlightService _flights = FlightService();
  final HotelService _hotels = HotelService();
  final RentalService _rental = RentalService();
  final InsuranceService _insurance = InsuranceService();

  BookingStatus _status = BookingStatus.idle;
  BookingStatus get status => _status;

  String _currentStep = '';
  String get currentStep => _currentStep;

  // 🔹 Simple Interface for a complex multi-service booking
  Future<void> bookCompleteTrip(String destination, String date) async {
    _status = BookingStatus.loading;
    _currentStep = 'Checking Flights...';
    notifyListeners();

    await _flights.bookFlight(destination, date);

    _currentStep = 'Reserving Hotel...';
    notifyListeners();

    // 2. Book Hotel
    await _hotels.bookHotel(destination, date);

    _currentStep = 'Arranging Transport...';
    notifyListeners();

    // 3. Rent Car
    await _rental.reserveCar(destination);

    _currentStep = 'Securing Insurance...';
    notifyListeners();

    // 4. Insurance
    await _insurance.provideInsurance(destination);

    _status = BookingStatus.success;
    _currentStep = 'Trip Booked for $destination! ✈️';
    notifyListeners();

  }

  void reset() {
    _status = BookingStatus.idle;
    _currentStep = '';
    notifyListeners();
  }
}
