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
            leading: const Icon(Icons.psychology, size: 20),
            title: const Text('Skills', style: TextStyle(fontSize: 14)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.school, size: 20),
            title: const Text('Education', style: TextStyle(fontSize: 14)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.work, size: 20),
            title: const Text('Experience', style: TextStyle(fontSize: 14)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.folder_open, size: 20),
            title: const Text('Projects', style: TextStyle(fontSize: 14)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.verified, size: 20),
            title: const Text('Certifications', style: TextStyle(fontSize: 14)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail, size: 20),
            title: const Text('Contact', style: TextStyle(fontSize: 14)),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
