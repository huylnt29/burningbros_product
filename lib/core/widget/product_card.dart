import 'package:burningbros_product/core/extension/currency.dart';
import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/extension/widget.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:burningbros_product/core/style/text_style.dart';
import 'package:burningbros_product/core/widget/network_image.dart';
import 'package:burningbros_product/feature/product/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(this.product, {super.key});
  final Product product;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(12.sf),
      ),
      child: Column(
        children: [
          Row(
            children: [
              AppNetworkImage(
                imageUrl: product.thumbnail,
              ).wrapWithExpanded(flex: 3),
              12.horizontal,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.vertical,
                  Text(
                    product.title ?? '',
                    style: AppTextStyle.text(bold: true),
                  ),
                  8.vertical,
                  Text(
                    product.price?.toCurrencyString() ?? '',
                    style: AppTextStyle.text(color: AppColor.accent),
                  ),
                  18.vertical,
                  Container(
                    padding: EdgeInsets.all(8.sf),
                    decoration: BoxDecoration(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.circular(12.sf),
                    ),
                    child: Text(
                      product.category ?? '',
                      style: AppTextStyle.text(bold: true),
                    ),
                  ),
                  8.vertical,
                ],
              ).wrapWithExpanded(flex: 7),
            ],
          ),
          3.vertical,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border_rounded,
                size: 24.sf,
              ),
              12.horizontal,
              Text(
                Localization.of(context)!.addToFavoriteList,
                style: AppTextStyle.smallText(),
              ),
            ],
          ),
          8.vertical,
        ],
      ),
    );
  }
}