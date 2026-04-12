import 'package:design_patterns_flutter/behavioral/command/flutter_examples/counter_undo/counter_undo_command.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';
import 'package:flutter/material.dart';

/// Demonstrates the Command pattern: actions as objects + undo history.
class CounterUndoScreen extends StatefulWidget {
  const CounterUndoScreen({super.key});

  @override
  State<CounterUndoScreen> createState() => _CounterUndoScreenState();
}

class _CounterUndoScreenState extends State<CounterUndoScreen> {
  final CounterReceiver _counter = CounterReceiver();
  final CommandInvoker _invoker = CommandInvoker();

  void _run(UndoableCommand command) {
    setState(() {
      _invoker.execute(command);
    });
  }

  void _undo() {
    setState(() {
      _invoker.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Command Pattern: Counter & Undo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${_counter.value}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Each tap runs a command object; Undo reverses the last command.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => _run(AddOneCommand(_counter)),
                    icon: const Icon(Icons.add),
                    label: const Text('+1'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: () => _run(SubtractOneCommand(_counter)),
                    icon: const Icon(Icons.remove),
                    label: const Text('-1'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _invoker.canUndo ? _undo : null,
              icon: const Icon(Icons.undo),
              label: const Text('Undo last command'),
            ),
            const PatternDefinitionCard(
              title: 'Command Pattern',
              description:
                  'Turns a request into an object so you can parameterize clients with queues, logs, and undoable operations.',
              exampleContext:
                  'Plus and minus are UndoableCommand objects executed by a CommandInvoker; Undo pops the history and calls undo() on the last command, without the buttons knowing counter math.',
            ),
          ],
        ),
      ),
    );
  }
}
