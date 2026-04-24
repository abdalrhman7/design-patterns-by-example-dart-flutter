import 'dart:async';

/// -------------------------------------------------------------
/// PROXY PATTERN (FLUTTER LOGIC)
/// -------------------------------------------------------------
/// We are building a "Protection & Virtual Proxy" for a Secure Vault.
/// This controls access to sensitive files and only initializes 
/// the heavy data when access is first granted.

// --- 1. The Interface (Common contract) ---
abstract class VaultStorage {
  Future<List<String>> openVault();
}

// --- 2. The Real Subject (Heavy/Sensitive Data) ---
class RealVaultFolder implements VaultStorage {
  RealVaultFolder() {
    print('RealVaultFolder: Initializing heavy encryption keys and loading files...');
  }

  @override
  Future<List<String>> openVault() async {
    // Simulate decryption/loading delay
    await Future.delayed(const Duration(seconds: 1));
    return [
      '📜 Secret_Project_X.pdf',
      '🔑 master_bank_passwords.txt',
      '💎 private_crypto_wallet.key',
    ];
  }
}

// --- 3. The Proxy (Protection & Virtual) ---
class SecureVaultProxy implements VaultStorage {
  RealVaultFolder? _realVault;
  final String correctPin = '1234';
  
  // We track the last log to show the Proxy's internal decision in the UI
  String lastProxyLog = 'Proxy: Waiting for access request...';

  @override
  Future<List<String>> openVault([String? pin]) async {
    if (pin != correctPin) {
      lastProxyLog = '❌ Access Denied';
      throw Exception('ACCESS_DENIED');
    }

    if (_realVault == null) {
      lastProxyLog = '📦 Initializing RealVaultFolder...';
      _realVault = RealVaultFolder();
    }

    return await _realVault!.openVault();
  }

  /// THE PROXY LOGIC: Intercepting the request.
  Future<List<String>> openWithPin(String inputPin) async {
    // A. Protection Check
    if (inputPin != correctPin) {
      lastProxyLog = 'Proxy: ❌ Access Denied! PIN incorrect. Intercepting call.';
      throw Exception('ACCESS_DENIED');
    }

    lastProxyLog = 'Proxy: ✅ PIN Correct. Accessing Real Storage...';

    // B. Virtual Proxy Check (Lazy Loading)
    if (_realVault == null) {
      lastProxyLog = 'Proxy: 📦 First time access. Initializing RealVaultFolder...';
      _realVault = RealVaultFolder();
    } else {
      lastProxyLog = 'Proxy: ♻️ RealVaultFolder already exists. Reusing instance.';
    }

    return await _realVault!.openVault();
  }
}
