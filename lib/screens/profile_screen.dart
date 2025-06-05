import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String profileImage = "assets/user/profile_image.jpg";
  final TextEditingController _dialogNameController = TextEditingController();

  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  void _showOverlayMessage(String message) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 2), () {
      entry.remove();
    });
  }

  Future<void> _updateDisplayName(String newName) async {
    if (newName.trim().isNotEmpty && user != null) {
      await user!.updateDisplayName(newName.trim());
      await user!.reload();
      user = FirebaseAuth.instance.currentUser;
      if (context.mounted) {
        _showOverlayMessage('Display name updated successfully.');
      }
      setState(() {});
    }
  }

  Future<void> _showEditNameDialog() async {
    _dialogNameController.text = user?.displayName ?? '';
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit your name'),
          titleTextStyle: Theme.of(context).textTheme.displaySmall,
          backgroundColor: AppTheme.backgroundColor,
          content: TextFormField(
            controller: _dialogNameController,
            decoration: const InputDecoration(
              labelText: 'Your name',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final newName = _dialogNameController.text.trim();
                if (newName.isNotEmpty) {
                  _updateDisplayName(newName);
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'Done',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.backgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  Navigator.of(context).pushReplacementNamed('/login');
                }
              },
              child: Row(
                children: const [
                  Text(
                    "Logout",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.logout,
                    color: AppTheme.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: user == null
            ? const Text('No user logged in.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(profileImage),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _showEditNameDialog,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          user?.displayName ?? 'No name set',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.edit, color: AppTheme.primaryColor),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Email: ${user?.email ?? "No email"}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
      ),
    );
  }
}
