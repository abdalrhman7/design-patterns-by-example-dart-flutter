import 'package:design_patterns_flutter/behavioral/command/flutter_examples/counter_undo/ui/counter_undo_screen.dart';
import 'package:design_patterns_flutter/behavioral/command/flutter_examples/universal_remote/ui/universal_remote_screen.dart';
import 'package:design_patterns_flutter/behavioral/observer/flutter_examples/weather_observer/ui/weather_observer_screen.dart';
import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/text_style_strategy/ui/text_styling_screen.dart';
import 'package:design_patterns_flutter/behavioral/strategy/flutter_examples/time_format_strategy/ui/time_display_screen.dart';
import 'package:design_patterns_flutter/creational/abstract_factory/flutter_examples/platform_factory/ui/platform_screen.dart';
import 'package:design_patterns_flutter/creational/factory_method/flutter_examples/ui/dialog_factory_screen.dart';
import 'package:design_patterns_flutter/creational/singletone/flutter_examples/ui/counter_singletone_screens.dart';
import 'package:design_patterns_flutter/home_screen/pattern_models.dart';
import 'package:design_patterns_flutter/structural/decorator/flutter_examples/pizza_decorator/ui/decorator_pizza_screen.dart';

List<PatternCategory> buildHomePatternCatalog() {
  return [
    PatternCategory(
      name: 'Behavioral Patterns',
      info: 'How objects talk to each other and share work—who does what, and in what order.',
      patterns: [
        PatternItem(
          name: 'Strategy Pattern',
          description: 'Switch between different behaviors or algorithms.',
          examples: [
            const ExampleItem(
              title: 'Example 1: Time Formatter',
              subtitle: 'Dynamic date/time formatting options.',
              screen: TimeDisplayScreen(),
            ),
            const ExampleItem(
              title: 'Example 2: Text Styling',
              subtitle: 'Change text appearance (Bold, Italic, color).',
              screen: TextStylingScreen(),
            ),
          ],
        ),
        PatternItem(
          name: 'Command Pattern',
          description: 'Encapsulate requests as objects; queue, log, or undo them.',
          examples: [
            const ExampleItem(
              title: 'Example 1: Counter & Undo',
              subtitle: 'Run +1 / -1 as commands and undo the last step.',
              screen: CounterUndoScreen(),
            ),
            const ExampleItem(
              title: 'Example 2: Universal Remote',
              subtitle: 'TV, fan, lights — many commands, one invoker + movie macro.',
              screen: UniversalRemoteScreen(),
            ),
          ],
        ),
        PatternItem(
          name: 'Observer Pattern',
          description: 'One-to-many dependency notification.',
          examples: [
            const ExampleItem(
              title: 'Example 1: Weather Station',
              subtitle: 'Notifications for temp & humidity changes.',
              screen: WeatherObserverScreen(),
            ),
          ],
        ),
      ],
    ),
    PatternCategory(
      name: 'Creational Patterns',
      info: 'Ways to create objects without being tied to a specific constructor or concrete class',
      patterns: [
        PatternItem(
          name: 'Factory Method',
          description: 'Instantiate objects without specifying concrete class.',
          examples: [
            const ExampleItem(
              title: 'Example 1: Dialog Factory',
              subtitle: 'Cross-platform UI components.',
              screen: DialogFactoryScreen(),
            ),
          ],
        ),
        PatternItem(
          name: 'Singleton Pattern',
          description: 'Ensure a class has only one instance.',
          examples: [
            const ExampleItem(
              title: 'Example 1: App State Counter',
              subtitle: 'Shared instance between different screens.',
              screen: CounterFirstScreen(),
            ),
          ],
        ),
        PatternItem(
          name: 'Abstract Factory',
          description: 'Create families of related objects without specifying concrete classes.',
          examples: [
            const ExampleItem(
              title: 'Example 1: Platform UI Widgets',
              subtitle: 'Material vs Cupertino widget families.',
              screen: PlatformScreen(),
            ),
          ],
        ),
      ],
    ),
    PatternCategory(
      name: 'Structural Patterns',
      info: 'Ways to combine classes or objects into larger structures—wrapping, adapting, or composing them cleanly',
      patterns: [
        PatternItem(
          name: 'Decorator Pattern',
          description: 'Add behavior to objects dynamically.',
          examples: [
            const ExampleItem(
              title: 'Example 1: Pizza Ordering',
              subtitle: 'Layering toppings at runtime.',
              screen: DecoratorPizzaScreen(),
            ),
          ],
        ),
      ],
    ),
  ];
}
