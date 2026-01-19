import 'package:flutter/material.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsTileListView extends StatelessWidget {
  NewsTileListView({super.key});

  final List<NewsTileModel> news = [
    NewsTileModel(
      image: 'https://img.youm7.com/large/20251215124200420.jpg',
      mainName: 'رسمياً.. الأهلي يُنهي إجراءات قيد يوسف بلعمري فى  اتحاد الكرة',
      subName:
          'قامت إدارة النادي الأهلي صباح اليوم، الإثنين، بقيد المغربي يوسف بلعمري فى السيستم الخاص بالقيد باتحاد الكرة المصري، بعد الانتهاء من إجراءات التعاقد معه من نادي الرجاء المغربي خلال فترة الانتقالات الشتوية الجارية.',
    ),
    NewsTileModel(
      image: 'https://img.youm7.com/large/20260110103208328_22650.jpg',
      mainName:
          'السجل الذهبي لكأس أمم أفريقيا بعد تتويج السنغال.. مصر فى الصدارة',
      subName:
          'نجح منتخب السنغال فى الحصول على لقب كأس أمم أفريقيا للمرة الثانية في تاريخه، عقب فوزه الصعب على المنتخب المغربي بهدف دون رد، فى المباراة النهائية التى أقيمت مساء الأحد على ملعب مولاي عبد الله.',
    ),
    NewsTileModel(
      image: 'https://img.youm7.com/large/202307130956575657.jpg',
      mainName:
          'الطقس غدا.. انخفاض الحرارة وشبورة كثيفة ورياح والصغرى بالقاهرة 10 درجات',
      subName:
          'تتوقع الهيئة العامة للأرصاد الجوية، أن يشهد غدا الثلاثاء 20 يناير 2026،  انخفاض فى درجات الحرارة على شمال البلاد حتي القاهرة الكبري، ليسود طقس شديد البرودة في الصباح الباكر، مائل للدفء، نهاراً شديد البرودة ليلاً على أغلب الأنحاء كما يتكون الصقيع على المزروعات على شمال الصعيد ووسط سيناء والصحراء الغربية.',
    ),
    NewsTileModel(
      image: 'https://img.youm7.com/large/202412090535213521.jpg',
      mainName: 'تحديث فورى في سعر جرام الذهب عيار 21 بالصاغة',
      subName:
          'قفزت أسعار الذهب اليوم في مصر مستهل تعاملات الأسبوع بأكثر 75 جنيها بعد صعود الذهب العالمي فوق 4670 دولار مما دفع الذهب في مصر لأعلى مستوى تاريخي.',
    ),
    NewsTileModel(
      image: 'https://img.youm7.com/large/20241209062003203.jpg',
      mainName: 'سعر الدولار يتراجع خلال منتصف تعاملات اليوم الإثنين',
      subName:
          'تراجع سعر الدولار مقابل الجنيه، خلال منتصف تعاملات اليوم الإثنين 19 يناير2026، بينما استقر فى البنك المركزي المصري، عند 47.31 جنيه للشراء، و47.45 جنيه للبيع.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: news.length , (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top:32),
          child: NewsTile(news: news[index]),
        );
      }),
    );
  }
}
