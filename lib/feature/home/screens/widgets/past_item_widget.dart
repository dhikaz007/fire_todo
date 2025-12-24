part of 'widgets.dart';

class PastItemWidget extends StatelessWidget {
  final DocumentModel documentModel;
  const PastItemWidget({super.key, required this.documentModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 32,
      decoration: BoxDecoration(
        color: ColorApp.white,
        border: const Border(
          left: BorderSide(
            width: 8,
            color: ColorApp.grey,
          ),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.zero,
        title: TextApp(
          text: documentModel.fields?.title?.stringValue ?? '-',
          size: FontAppSize.font_16,
          weight: FontAppWeight.semiBold,
        ),
        subtitle: TextApp(
          text: documentModel.fields?.description?.stringValue ?? '-',
          size: FontAppSize.font_14,
        ),
        trailing: Checkbox(
          activeColor: ColorApp.success(50),
          value: documentModel.fields?.isDone?.booleanValue,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
