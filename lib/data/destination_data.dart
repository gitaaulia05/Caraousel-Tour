import '../models/destination.dart';

class DestinationData {
  static const List<Destination> heroDestinations = [
    Destination(
      id: 'raja_ampat',
      title: 'Raja Ampat, Papua',
      location: 'Papua Barat Daya',
      tag: '2024 • Nature & Island',
      description:
          'Surga tropis dengan gugusan pulau karst dan keindahan bawah laut terbaik di dunia',
      rating: 5.0,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDwU6JXkTFfmCkrzPliuhtmxixCndsM_buSDqSsvwi7NqpPN-_uI7MlG3qUgXkwaMILe0xVGhY-7C_D60pXoqAkEfaXXTZtsrGblpWcT2mgTwRSygoU1rOEiErWECYhWZotJVtZdtHDUY8knRjkz4cJsnJqSKk5yoh2Uz6bG943q1tbixK_U8UqNu1Zbnekzejf4JH7M6T1ARfh6bS6ZOKJzG-d7ZzKoDyZFJFNWfk',
      alt: 'Raja Ampat Wayag islands karst formations',
    ),
    Destination(
      id: 'bali',
      title: 'Danau Beratan, Bali',
      location: 'Bedugul, Bali',
      tag: '2024 • Temple & Culture',
      description:
          'Stunning aerial view of Bali Ulun Danu Beratan water temple at sunrise enveloped in morning mist',
      rating: 4.8,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBc6qjGcauLOuGSNpc-r4VYd--NMehxXesBjLglxgi2VmVhxb_XUwTopLFxNlqJg8NozGLM0qnz6hSpyVwrPCEJ5Acz5kJdfeuSwL8NrAvSXWoMaCPXhgdgnQ5FSdr-tqabv3uR2fBrvPWkctmQJun8DEkq2pJt_1hpxoQKABrHcMrwtbKOi7NysoWcsr1041-eeBSoqWeQtG8qK032MnPi1qLuPurIDtr9aMUmUq8',
      alt: 'Bali Ulun Danu Beratan temple at sunrise',
    ),
    Destination(
      id: 'komodo',
      title: 'Taman Nasional Komodo',
      location: 'Nusa Tenggara Timur',
      tag: '2024 • Adventure & Wildlife',
      description:
          'Pantai eksotis dengan pasir pink yang memukau dan perbukitan sabana yang dramatis',
      rating: 4.9,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBtxKI2nmgF84-qTSUUzhLC3AHmdIJ2TKkkeDCZSpys1eMfoSjKbeWBZ9svjcxQ4PZb7Lk6FGfn6xBWm0d-CDumpzAfgZCldm9AhET76viezclv2sXtuXgtDt6PQ71qQLjRXEBUV_mIZ9as8dK44MLwuOWWPpxOSoDfNvDR-f67A0JlAhUdwet4wP5YW6UOc-QAhVCBhoQdYT_FCszoGu5jJuVjkl-S04SZNWgZPgE',
      alt: 'Pink beach Komodo National Park',
    ),
    Destination(
      id: 'bromo_hero',
      title: 'Gunung Bromo, Jawa Timur',
      location: 'Probolinggo, Jawa Timur',
      tag: '2024 • Mountain & Volcano',
      description:
          'Lautan pasir mistis dan kawah aktif spektakuler berselimutkan kabut emas matahari terbit',
      rating: 4.9,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC5E7QlvWwnwZVHAODHt_Smd4YOY-tTiJV_E-O2aPVphhVVIrjdMikphFdFpN3meLqEwWZDy60QEyGUBELJULydFGI-3AVmrfr5n9-X0gizs4B-8hfncjomaIN420k3CvRv6-D575qOX595tFwiyt-n14d8r6DmIgbjqscuUlJyPYvNv887bRvmSPntmInFj_GD3aRlb2f7-wEQANf-D708Z6rX67f1MwQbLgVWD9Y',
      alt: 'Sunrise over Mount Bromo caldera',
    ),
  ];

  static const List<Destination> trendingDestinations = [
    Destination(
      id: 'gunung_bromo',
      title: 'Gunung Bromo',
      location: 'Jawa Timur',
      rating: 4.9,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC5E7QlvWwnwZVHAODHt_Smd4YOY-tTiJV_E-O2aPVphhVVIrjdMikphFdFpN3meLqEwWZDy60QEyGUBELJULydFGI-3AVmrfr5n9-X0gizs4B-8hfncjomaIN420k3CvRv6-D575qOX595tFwiyt-n14d8r6DmIgbjqscuUlJyPYvNv887bRvmSPntmInFj_GD3aRlb2f7-wEQANf-D708Z6rX67f1MwQbLgVWD9Y',
    ),
    Destination(
      id: 'labuan_bajo',
      title: 'Labuan Bajo',
      location: 'Flores, NTT',
      rating: 4.8,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBbjRhFHhlMpIsVLzOikEcSi7STs4ycLdhXYLKvKY0Z26oqtR-xcNAv4BNg5SOuFZg8jm578stQ8TM3cPBH93UNlzE0e6wVPVjnZVwP5hjWwgUj7wj3eKTjU03IYpQWKR-UIJ6634_bKmhyd2Yk77Ku0vgNeR-n6y5xd-Otp8GEoolDwTTu-oi40WgHPYut7f60SzqH6RcNDTdIryhfmR1LT_nQes0ZY36GHxaXvRc',
    ),
    Destination(
      id: 'nusa_penida',
      title: 'Nusa Penida',
      location: 'Bali',
      rating: 4.9,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuA7ICvS3KolDeXlF9BAAKYxKk3huWLgBmHaVPlJZT-QV-Vk3XFeUd0VwfzdskaSR6rqHmmGRsgyDt5LZd94PvunHFiI-5T7rW6JzyJRx6sJdLYNg9nq2YTpB-4RIdaL8TvU3Y2PpcinxjEdXBnydd9hXbt2wsgATO5wpn0oQqzCbwLtS00UPv7B9fhfgAAFDRex6dhuyeHlZe_vqU-n28KeqpCtQPfoU5wShMFN5nc',
    ),
  ];

  static const List<Destination> popularDestinations = [
    Destination(
      id: 'candi_borobudur',
      title: 'Candi Borobudur',
      location: 'Magelang, Jawa Tengah',
      rating: 4.9,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB3XK51BhW50IY_dzX8MFmwLoalytS1k5oNmH7bmTQU1Y8MWYJM2fp9hzABVO9UO_-mcM2n4faKBfNUktMgXXHkhKszyZBot_wwP-qmWsXB7eNj-MdI6Ar0vQUZpj3Hd8r7bTxWa2wSyAO1KJqMQ_F2lRRQhnZpBEaW-jr8sGLfGlU9W5s3NbiLTV_xESARisYmAwT6kzW4WMp4z15Vyvtms30NtcShcBaZhopQS58',
    ),
    Destination(
      id: 'danau_toba',
      title: 'Danau Toba',
      location: 'Sumatera Utara',
      rating: 4.7,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB2YgFYsSgK1t4I1YV_TBA4nIP8_gCE_SSu9eiAxCoh_dRSArqPAEzb7uW1mu9cs-3ZrlmI2FiVBuDE9eLWWEbT5NtgpOPp8tJ1rZD4IW-w-g0dcgIoqDPeo9tPaapeDVvEmgpNT-Rbi_ZqFR75toSf2mNl1wi8lNQ_YzwzFY8TY_p-UU6YdxLvc68fzZkcpbyWZO5q-VfcLsNmp20dSFr0NodVZRDEyP2AccHUC9Y',
    ),
    Destination(
      id: 'kawah_ijen',
      title: 'Kawah Ijen',
      location: 'Banyuwangi, Jawa Timur',
      rating: 4.8,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB_ii3wSysMJyeRymE4ftY_P4wFqv-KZ7i2sFlfVUVd-pyCVZoz6ElEpFjcmMBX-xJ1Q5oiRg3WKG243MOCxSp3WgyxIv2i7Dz8PmAv3B2QFa1l9fVQBTcblgtnTg8rjtVCez69D_pJGQWG4xE_qxjEl4cakCXe-4tQ7O8tXtiCwP-fFKKJ_TAaG5B_bWH-1NK8P_IpjtrOP9NmPxSkzXBLsUaCeg0aZE9uJWqX2ew',
    ),
  ];

  static const List<Destination> topRatedDestinations = [
    Destination(
      id: 'tana_toraja',
      title: 'Tana Toraja',
      location: 'Sulawesi Selatan',
      rating: 4.9,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBPS1fcFhNSGwxrKlUAun8ZYFE_O12SI9Nu5JTBvZrIun5gRS8lD_ppX_Xkfn9hMSGcNentgJ7kXE7ZEUCKIoGMdiyHNePAvf0eVdyobI61iPEQUlqfbjnyuHvRY1VcZiNolwFm8G4DzUBBu5EqftjECpMTZvocfQTBKSCJkDbzBLHx4PWd4TPdNnaRNuK-Ps2r3aBFEEP502_wwJPGNKGrEmnTX9HQQJKdHtRq4Ck',
    ),
    Destination(
      id: 'pulau_derawan',
      title: 'Pulau Derawan',
      location: 'Kalimantan Timur',
      rating: 5.0,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAg_KFaqxbHyA9HYlyC9sOaFbcp3lMD43TZL_LaVyE0rtpgzGfqOrLJ-Bg6PXYXUTsmzm4NplQnVQAS70A2wTlRcBPdtfTd13uVnTW4DjJQqrecf1XIMmFuBWOhwSlaQdoKby7TY9U5cXItp1kxsapxZ2l2bVJz9Dviye8-Hc1vpNIIGRyM-YwPz9E17JmR2VSAT0Qosahv8rqRXZwqIaQILGunTM-zRfxaQHQ07RQ',
    ),
    Destination(
      id: 'desa_waerebo',
      title: 'Desa Waerebo',
      location: 'Manggarai, Flores, NTT',
      rating: 4.9,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCfEuQTMpd-VCv3SJfOs-OXTPOeR-SsTFLgXqfXznXQh7wpwkvJIbvgqkZXw8sKPBx--6g8Flroi2Mb2xuUBFc1-8g3a_WVdbiwKsruGHf7Aq7xCUN40nEmYcdFD0aL9QAtm8g1luE7y7s7LCu7FIXEodYpjoECiA09fivRtrwA_7DDALSxY9B6HvmGlbHoPtKovNu15nU_xW7m7XI6Qq2ZZLohGfTQ8tdP1FQdhUg',
    ),
  ];
}

