import 'package:flutter/material.dart';
import 'package:design_patterns_flutter/behavioral/state/flutter_examples/coffee_machine/coffee_machine_logic.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';

class CoffeeMachineScreen extends StatefulWidget {
  const CoffeeMachineScreen({super.key});

  @override
  State<CoffeeMachineScreen> createState() => _CoffeeMachineScreenState();
}

class _CoffeeMachineScreenState extends State<CoffeeMachineScreen> {
  // Our Context
  final CoffeeMachine _machine = CoffeeMachine();

  @override
  void dispose() {
    _machine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: const Text('State Pattern (Coffee)'),
        backgroundColor: Colors.brown.shade800,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        top: false,
        child: ListenableBuilder(
          listenable: _machine,
          builder: (context, _) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Minimal header
                    Text(
                      'Smart Brewer 3000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 20),
  
                    // Digital Display Screen of the machine
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          _machine.displayMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 18,
                            fontFamily: 'Courier', // Giving it a digital screen vibe
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
  
                    // Core Action Buttons
                    // Notice how these buttons do NOT conditionally disappear or check state.
                    // We leave all the logic handling to the State objects!
                    _CoffeeActionButton(
                      icon: Icons.monetization_on,
                      label: 'Insert Coin',
                      color: Colors.amber.shade700,
                      onPressed: _machine.insertCoin,
                    ),
                    const SizedBox(height: 16),
                    _CoffeeActionButton(
                      icon: Icons.local_cafe,
                      label: 'Select Coffee',
                      color: Colors.brown.shade600,
                      onPressed: _machine.selectCoffee,
                    ),
                    const SizedBox(height: 16),
                    _CoffeeActionButton(
                      icon: Icons.pan_tool,
                      label: 'Take Coffee',
                      color: Colors.green.shade600,
                      onPressed: _machine.takeCoffee,
                    ),
                    const PatternDefinitionCard(
                      title: 'State Pattern',
                      description:
                          'The UI doesn’t control the logic or check the current state. It simply sends user actions (like inserting a coin or selecting coffee) to the machine. The machine delegates these actions to its current state, and each state decides what should happen next. This makes the behavior dynamic and keeps all decision-making logic inside the state objects instead of the UI.',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CoffeeActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _CoffeeActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
      icon: Icon(icon, size: 28),
      label: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      onPressed: onPressed,
    );
  }
}
