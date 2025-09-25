import 'package:dreamlabs/data/mapper/mapper.dart';
import 'package:dreamlabs/domain/model/model.dart';
import 'package:dreamlabs/presentation/resources/assets_manager.dart';
import 'package:dreamlabs/presentation/resources/color_manager.dart';
import 'package:dreamlabs/presentation/resources/screen_manager.dart';
import 'package:dreamlabs/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glass/glass.dart';

class DetailView extends StatefulWidget {
  final Post post;
  const DetailView(this.post, {super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final _bodyKey = GlobalKey();
  final ValueNotifier<double> _bodyHeight = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureBody());
  }

  void _measureBody() {
    final ctx = _bodyKey.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null) return;
    _bodyHeight.value = box.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16, vertical: AppPadding.p80),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      ColorManager.primary,
                      ColorManager.primaryAccent[200] ?? ColorManager.primary,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Text(
                  key: _bodyKey,
                  widget.post.title?.trim() ?? empty,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.s24,
                      color: ColorManager.textLight),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Text(
                  widget.post.body ?? empty,
                  style: const TextStyle(fontSize: AppSize.s16),
                ),
              ),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: _bodyHeight,
            builder: (context, value, child) => Positioned(
              top: value + (AppPadding.p60 * 2),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppMargin.m16),
                child: Container(
                  width: context.screenWidth - (AppMargin.m16 * 2),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p24, vertical: AppPadding.p16),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(AppPadding.p10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.primary,
                            ),
                            child: SizedBox(
                              height: 26,
                              width: 20,
                              child: SvgPicture.asset(
                                ImageAssets.logod,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppPadding.p16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p4,
                                horizontal: AppPadding.p8),
                            decoration: BoxDecoration(
                                color: ColorManager.white.withOpacity(.25),
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              'post #${widget.post.id}',
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s12),
                            ),
                          ),
                        ],
                      ),
                      Text(_bodyHeight.value.toString()),
                      Text(
                        'userId #${widget.post.userId}',
                        style: TextStyle(
                            color: ColorManager.white.withOpacity(.75),
                            fontSize: AppSize.s12),
                      ),
                    ],
                  ),
                ).asGlass(
                  tintColor: ColorManager.primary,
                  clipBorderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: ColorManager.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
