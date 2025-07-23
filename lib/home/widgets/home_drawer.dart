import 'package:flutter/material.dart';
import 'package:piero_morales_alcalde/app/app.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 32,
                  child: NetworkImageWithFallback(
                    imageUrl:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDW'
                        'fs50_zrIc8jQGRCjWFmJLyizd0PQEjNAwv-TQXvuF9JJJhCV0df-W3'
                        'Ig1JNq40OpmDbkxtJtknQC-ERV9SDTvDS_jCGtf6dg9AdKmu5JT7tA'
                        'yTj8Ltpk8VA-QUhYgeSyodxDuSWEkXO9AOnP4QgSR3whs60T-a16bR'
                        '4OlnDqYRwxCTtpu-D6KhHAr5EiZ-ks2IKAlXo4eBBa6zikthnY09wq'
                        'LhU3cobOVtmlHxcJcvzRnBSXfrXASIJuk7gFKV2AkOw8fVbY0IVu',
                    borderRadius: 32,
                  ),
                ),
                SizedBox(height: 8),
                Flexible(
                  child: Text(
                    'Piero Angelo Morales Alcalde',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Software Engineer',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('About'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('Skills'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('Education'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('Experience'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('Projects'),
            onTap: () => Navigator.pop(context),
          ),
          const Divider(),
          // Sección de contacto como footer
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contact Info',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'piero.morales@example.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_outlined,
                      size: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '+51 999 888 777',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Lima, Perú',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Redes sociales
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        debugPrint('Navegando a LinkedIn');
                      },
                      icon: const Icon(Icons.work_outline),
                      tooltip: 'LinkedIn',
                      iconSize: 24,
                      color: Colors.blue[700],
                    ),
                    IconButton(
                      onPressed: () {
                        debugPrint('Navegando a GitHub');
                      },
                      icon: const Icon(Icons.code),
                      tooltip: 'GitHub',
                      iconSize: 24,
                      color: Colors.grey[700],
                    ),
                    IconButton(
                      onPressed: () {
                        debugPrint('Navegando a WhatsApp');
                      },
                      icon: const Icon(Icons.message),
                      tooltip: 'WhatsApp',
                      iconSize: 24,
                      color: Colors.green[600],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
