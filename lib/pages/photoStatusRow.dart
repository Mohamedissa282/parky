import 'package:flutter/material.dart';

class PhotoStatusRow extends StatelessWidget {
  const PhotoStatusRow({
    super.key,
    required this.hasPhoto,
    required this.onPickPhoto,
    required this.onRemovePhoto,
  });

  final bool hasPhoto;
  final VoidCallback onPickPhoto;
  final VoidCallback onRemovePhoto;

  @override
  Widget build(BuildContext context) {
    if (!hasPhoto) {
      return GestureDetector(
        onTap: onPickPhoto,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFD7DDD2), width: 1.5),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF3DC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.camera_alt_outlined, size: 16, color: Color(0xFF16281D)),
              ),
              const SizedBox(width: 10),
               Text(
                'Ajouter une photo (optionnel)',
                style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF3DC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF16281D),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, size: 16, color: Color(0xFFC6F45A)),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Photo ajoutée',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF16281D)),
            ),
          ),
          GestureDetector(
            onTap: onRemovePhoto,
            child: const Text(
              'Supprimer',
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: Color(0xFF16281D),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}