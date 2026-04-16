import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';
import 'package:flutter/material.dart';
import '../social_share_facade.dart';

class SocialShareScreen extends StatefulWidget {
  const SocialShareScreen({super.key});

  @override
  State<SocialShareScreen> createState() => _SocialShareScreenState();
}

class _SocialShareScreenState extends State<SocialShareScreen> {
  final SocialShareFacade _facade = SocialShareFacade();

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
        title: const Text('Social Share Example'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),
            // Post Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                children: [
                  const Icon(Icons.image, size: 80, color: Colors.blueGrey),
                  const SizedBox(height: 20),
                  Text(
                    _facade.lastStatus,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _facade.sharePost('my_photo.jpg'),
                  icon: const Icon(Icons.share),
                  label: const Text('Quick Share'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () => _facade.reset(),
                  child: const Text('Reset'),
                ),
              ],
            ),
            const Spacer(),
            const PatternDefinitionCard(
              title: 'Facade Pattern',
              description:
                  'A Facade provides a high-level interface that makes a complex subsystem easier to use. '
                  'Here, the UI doesn\'t need to know how to compress images or log actions—it just calls sharePost().',
              exampleContext:
                  'The SocialShareFacade coordinates the Compressor, Logger, and API subsystems in one simple method.',
            ),
          ],
        ),
      ),
    );
  }
}
