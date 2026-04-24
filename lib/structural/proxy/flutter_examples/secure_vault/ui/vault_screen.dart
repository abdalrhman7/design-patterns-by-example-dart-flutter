import 'package:flutter/material.dart';
import 'package:design_patterns_flutter/structural/proxy/flutter_examples/secure_vault/vault_logic.dart';
import 'package:design_patterns_flutter/core/widgets/pattern_definition_card.dart';

class SecureVaultScreen extends StatefulWidget {
  const SecureVaultScreen({super.key});

  @override
  State<SecureVaultScreen> createState() => _SecureVaultScreenState();
}

class _SecureVaultScreenState extends State<SecureVaultScreen> {
  // The Context holds the Proxy
  final SecureVaultProxy _vaultProxy = SecureVaultProxy();
  final TextEditingController _pinController = TextEditingController();
  
  List<String> _vaultFiles = [];
  bool _isLoading = false;
  String _error = '';

  Future<void> _handleVaultAccess() async {
    setState(() {
      _isLoading = true;
      _error = '';
      _vaultFiles = [];
    });

    try {
      // The UI attempts to access data THROUGH the proxy
      final files = await _vaultProxy.openWithPin(_pinController.text);
      setState(() {
        _vaultFiles = files;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'ACCESS DENIED: Unauthorized Request';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed to White as requested
      appBar: AppBar(
        title: const Text('Proxy Pattern: Secure Vault'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Visual Vault State
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: _vaultFiles.isNotEmpty ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: _vaultFiles.isNotEmpty ? Colors.green : Colors.red,
                  width: 3,
                ),
              ),
              child: Icon(
                _vaultFiles.isNotEmpty ? Icons.lock_open : Icons.lock,
                size: 80,
                color: _vaultFiles.isNotEmpty ? Colors.green : Colors.red,
              ),
            ),
          ),
          
          const SizedBox(height: 30),

          // PIN Input Field
          TextField(
            controller: _pinController,
            obscureText: true,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.black87, letterSpacing: 10, fontSize: 24),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'ENTER PIN',
              helperText: 'Try default PIN: 1234', // Added hint for the user
              hintStyle: TextStyle(color: Colors.black26, letterSpacing: 2),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          
          const SizedBox(height: 16),

          // Primary Action
          SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              onPressed: _isLoading ? null : _handleVaultAccess,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: _isLoading 
                ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : const Icon(Icons.security),
              label: const Text('OPEN VAULT (Calls Proxy)', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),

          const SizedBox(height: 30),

          // THE PROXY DECISION VIEW
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Internal Proxy Decision Tracker:', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 8),
                Text(
                  _vaultProxy.lastProxyLog,
                  style: TextStyle(color: Colors.grey.shade800, fontFamily: 'monospace', fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Result Area
          if (_error.isNotEmpty) 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(_error, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          
          if (_vaultFiles.isNotEmpty) ...[
            const Text('ACCESS GRANTED - SECURE FILES:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 8),
            ..._vaultFiles.map((file) => Card(
              elevation: 0,
              color: Colors.green.shade50,
              child: ListTile(
                leading: const Icon(Icons.insert_drive_file, color: Colors.green),
                title: Text(file, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
              ),
            )),
          ],

          const SizedBox(height: 40),

          const PatternDefinitionCard(
            title: 'Proxy Pattern',
            description: 'Provides a placeholder object that controls access to another object. It allows adding behaviors like security checks or lazy initialization without changing the original object.',
            exampleContext: 'The vault is accessed through a secure layer instead of directly. This layer first checks the PIN (security) and only loads the protected files when access is granted (lazy loading). The user interacts normally, while the proxy silently controls access and resource usage behind the scenes.',
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
