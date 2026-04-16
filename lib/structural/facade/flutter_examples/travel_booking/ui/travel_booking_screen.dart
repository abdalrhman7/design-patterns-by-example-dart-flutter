import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';
import 'package:flutter/material.dart';
import '../travel_facade.dart';

class TravelBookingScreen extends StatefulWidget {
  const TravelBookingScreen({super.key});

  @override
  State<TravelBookingScreen> createState() => _TravelBookingScreenState();
}

class _TravelBookingScreenState extends State<TravelBookingScreen> {
  final TravelFacade _facade = TravelFacade();
  
  @override
  void initState() {
    super.initState();
    _facade.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _facade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Travel Booking Facade'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildTripCard(),
              const SizedBox(height: 30),
              _buildBookingProgress(),
              const SizedBox(height: 40),
              _buildActionButton(),
              const SizedBox(height: 20),
              const PatternDefinitionCard(
                title: 'Facade Pattern',
                description:
                    'Provides a simplified interface to a large body of code. '
                    'Clients use the Facade instead of talking to multiple subsystems directly.',
                exampleContext:
                    'The TravelFacade handles Flights, Hotels, Cars, and Insurance with a single "Book Trip" call.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue.shade50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'YOUR NEXT ADVENTURE',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.airplane_ticket_outlined, color: Colors.blue.shade700),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Maldives',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Text(
            'August 12 - August 20, 2026',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.black12),
          const SizedBox(height: 16),
          _buildDetailRow(Icons.hotel_outlined, 'Luxury Overwater Villa'),
          const SizedBox(height: 12),
          _buildDetailRow(Icons.directions_car_outlined, 'SUV Rental (Full Week)'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue.shade700, size: 20),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildBookingProgress() {
    if (_facade.status == BookingStatus.idle) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _facade.status == BookingStatus.error 
            ? Colors.red.withOpacity(0.3) 
            : Colors.blue.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (_facade.status == BookingStatus.loading)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              else if (_facade.status == BookingStatus.success)
                const Icon(Icons.check_circle, color: Colors.green)
              else
                const Icon(Icons.error_outline, color: Colors.red),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  _facade.currentStep,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    bool isLoading = _facade.status == BookingStatus.loading;
    bool isDone = _facade.status == BookingStatus.success;

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: isLoading ? null : () {
            if (isDone) {
              _facade.reset();
            } else {
              _facade.bookCompleteTrip('Maldives', '2026-08-12');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isDone ? Colors.greenAccent.shade700 : Colors.blue.shade700,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            shadowColor: (isDone ? Colors.green : Colors.blue).withOpacity(0.5),
          ),
          child: isLoading 
            ? const Text('PROCESSING...') 
            : Text(isDone ? 'BOOK ANOTHER!' : 'BOOK FULL PACKAGE'),
        ),
      ),
    );
  }
}
