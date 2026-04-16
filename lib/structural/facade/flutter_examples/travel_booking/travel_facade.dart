import 'package:flutter/material.dart';

// === Subsystems (Independent Services with Isolated Responsibilities) ===

class FlightService {
  // 🔹 Responsibility: Handle flight booking logic and API communication
  // This represents a low-level system that should NOT be directly used by the UI
  Future<bool> bookFlight(String destination, String date) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulating API call
    print('Flight to $destination on $date booked successfully.');
    return true;
  }
}

class HotelService {
  // 🔹 Responsibility: Manage hotel reservation process
  // Encapsulates booking rules and external integration
  Future<bool> bookHotel(String destination, String date) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Hotel in $destination for $date booked successfully.');
    return true;
  }
}

class RentalService {
  // 🔹 Responsibility: Handle car rental operations
  // This is part of the travel subsystem, isolated from other services
  Future<bool> reserveCar(String destination) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Car rental in $destination reserved successfully.');
    return true;
  }
}

class InsuranceService {
  // 🔹 Responsibility: Provide travel insurance processing
  // Independent service that should not be orchestrated by the UI layer
  Future<bool> provideInsurance(String destination) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Travel insurance for $destination issued.');
    return true;
  }
}

// -------------------------------------------------------------------------

// Facade: The Simplified Interface
// 🔹 Provides a single entry point for a complex multi-step workflow
// 🔹 Hides coordination between multiple travel-related services

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

  // 🔹 High-level operation exposed to the client
  // The client does NOT need to know:
  // - which services are involved
  // - the order of execution
  // - how each subsystem works internally
  Future<void> bookCompleteTrip(String destination, String date) async {
    print('--- ✈️ Facade: Starting Travel Booking Workflow ---');

    // Step 1: Flight booking (first dependency in the workflow)
    _status = BookingStatus.loading;
    _currentStep = 'Checking Flights...';
    notifyListeners();

    await _flights.bookFlight(destination, date);

    // Step 2: Hotel reservation (depends on successful flight step)
    _currentStep = 'Reserving Hotel...';
    notifyListeners();

    await _hotels.bookHotel(destination, date);

    // Step 3: Transport arrangement (car rental service)
    _currentStep = 'Arranging Transport...';
    notifyListeners();

    await _rental.reserveCar(destination);

    // Step 4: Insurance setup (final step in booking pipeline)
    _currentStep = 'Securing Insurance...';
    notifyListeners();

    await _insurance.provideInsurance(destination);

    // Final state update for UI feedback
    _status = BookingStatus.success;
    _currentStep = 'Trip Booked for $destination! ✈️';
    notifyListeners();
  }

  // 🔹 Reset facade state without exposing subsystem logic
  void reset() {
    _status = BookingStatus.idle;
    _currentStep = '';
    notifyListeners();
  }
}