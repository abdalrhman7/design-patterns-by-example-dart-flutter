import 'package:design_patterns_flutter/behavioral/command/flutter_examples/universal_remote/universal_remote_command.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';
import 'package:flutter/material.dart';

/// Home theater demo: one remote, many devices, many command classes + a macro.
class UniversalRemoteScreen extends StatefulWidget {
  const UniversalRemoteScreen({super.key});

  @override
  State<UniversalRemoteScreen> createState() => _UniversalRemoteScreenState();
}

class _UniversalRemoteScreenState extends State<UniversalRemoteScreen> {
  final TvReceiver _tv = TvReceiver();
  final FanReceiver _fan = FanReceiver();
  final LightsReceiver _lights = LightsReceiver();
  final UniversalRemoteInvoker _remote = UniversalRemoteInvoker();

  void _press(RemoteCommand command) {
    setState(() {
      _remote.press(command);
    });
  }

  /// One tap = several commands — shows why requests-as-objects scale.
  RemoteCommand get _movieNightMacro => MacroCommand([
        TvPowerOnCommand(_tv),
        FanSetSpeedCommand(_fan, 1),
        LightsSetBrightnessCommand(_lights, 25),
      ]);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Command Pattern: Universal Remote')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Device status', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          _DeviceStatusCard(
            icon: Icons.tv,
            title: 'TV',
            subtitle: _tv.isOn ? 'On · Channel ${_tv.channel}' : 'Off',
            color: _tv.isOn ? Colors.green.shade700 : theme.colorScheme.outline,
          ),
          _DeviceStatusCard(
            icon: Icons.mode_fan_off_outlined,
            title: 'Fan',
            subtitle: _fan.speed == 0 ? 'Off' : 'Speed ${_fan.speed} / 3',
            color: _fan.speed > 0 ? Colors.blue.shade700 : theme.colorScheme.outline,
          ),
          _DeviceStatusCard(
            icon: Icons.light_rounded,
            title: 'Lights',
            subtitle: '${_lights.brightness}% brightness',
            color: Colors.amber.shade800,
          ),
          const SizedBox(height: 20),
          Text('Remote', style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'Each control sends a different [RemoteCommand]. The invoker never branches on device type.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _RemoteChip(
                label: 'TV On',
                icon: Icons.power,
                onPressed: () => _press(TvPowerOnCommand(_tv)),
              ),
              _RemoteChip(
                label: 'TV Off',
                icon: Icons.power_off,
                onPressed: () => _press(TvPowerOffCommand(_tv)),
              ),
              _RemoteChip(
                label: 'CH+',
                icon: Icons.skip_next,
                onPressed: () => _press(TvChannelUpCommand(_tv)),
              ),
              _RemoteChip(
                label: 'CH−',
                icon: Icons.skip_previous,
                onPressed: () => _press(TvChannelDownCommand(_tv)),
              ),
              _RemoteChip(
                label: 'Fan +',
                icon: Icons.add,
                onPressed: () => _press(FanSpeedUpCommand(_fan)),
              ),
              _RemoteChip(
                label: 'Fan −',
                icon: Icons.remove,
                onPressed: () => _press(FanSpeedDownCommand(_fan)),
              ),
              _RemoteChip(
                label: 'Light +',
                icon: Icons.light_mode_outlined,
                onPressed: () => _press(LightsBrighterCommand(_lights)),
              ),
              _RemoteChip(
                label: 'Light −',
                icon: Icons.dark_mode_outlined,
                onPressed: () => _press(LightsDimmerCommand(_lights)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => _press(_movieNightMacro),
            icon: const Icon(Icons.local_movies_outlined),
            label: const Text('Movie night (macro)'),
          ),
          const PatternDefinitionCard(
            title: 'Command Pattern',
            description:
                'Encapsulates requests as objects so one invoker can drive many receivers without giant if/switch trees.',
            exampleContext:
                'TV, fan, and lights each have their own commands. “Movie night” is a MacroCommand that runs several commands in order—new buttons or scenes are new classes, not edits to the remote.',
          ),
        ],
      ),
    );
  }
}

class _DeviceStatusCard extends StatelessWidget {
  const _DeviceStatusCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: color, size: 32),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class _RemoteChip extends StatelessWidget {
  const _RemoteChip({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
