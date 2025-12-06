import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_theme/theme.dart';
import 'package:ui/ui.dart';

enum CommunityTabType {
  normal(title: '홈'),
  popular(title: '인기');

  final String title;

  const CommunityTabType({required this.title});
}

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late final TabController _tabController = TabController(
    length: CommunityTabType.values.length,
    vsync: this,
  );

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _updateTabIndex(int index) {
    if (_tabController.index == index) return;
    _tabController.animateTo(index);
  }

  void _updatePage(int page) {
    if (_pageController.page == page) return;
    _pageController.animateToPage(
      page,
      duration: kTabScrollDuration,
      curve: Curves.easeInOut,
    );
  }

  void _onChangedTab(int index) {
    final int tabCount = CommunityTabType.values.length;
    final int currentPage = _pageController.page?.toInt() ?? 0;
    final int page = (currentPage ~/ tabCount) * tabCount + index;
    _updateTabIndex(index);
    _updatePage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.darkBlack,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: context.appBarTheme.backgroundColor,
              scrolledUnderElevation: 0,
              floating: true,
              snap: true,
              leading: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(right: 8),
                  child: BlindIcon.logoSmall(),
                ),
              ),
              leadingWidth: 55.0,
              titleSpacing: 0,
              title: BlindSearchBar(
                text: '관심있는 글 검색',
                onTap: () {
                  // TODO: 검색 화면으로 이동
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 6.5, right: 8.5),
                  child: BlindAppBarIconAction(
                    icon: BlindIcon.sms(color: context.colorScheme.white),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(45.0),
                child: CommunityTabBar(
                  controller: _tabController,
                  tabs: CommunityTabType.values.map((e) => e.title).toList(),
                  onTap: _onChangedTab,
                ),
              ),
            ),
          ];
        },
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) =>
              _updateTabIndex(index % CommunityTabType.values.length),
          itemBuilder: (context, index) {
            final int tabIndex = index % CommunityTabType.values.length;
            return CoreRefreshIndicator(
              onRefresh: () async {},
              indicator: BlindIcon.restartAlt(
                color: context.colorScheme.gray600,
              ),
              child: CoreLoadMore(
                onLoadMore: () async {},
                child: CustomScrollView(
                  key: PageStorageKey<String>('$CommunityTabType$tabIndex'),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 9.0,
                            ),
                            child: SizedBox(
                              height: 33.0,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                itemBuilder: (context, index) => BlindChannelChip(
                                  imageUrl:
                                      'https://cdn.day1company.io/prod/uploads/migrations/235813_card_img.webp',
                                  name: '새해',
                                  onTap: () {},
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 6.0),
                                itemCount: 10,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: CommunityAllChannelButton(onTap: () {}),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: BlindSortFilter(text: '최신순', onTap: () {}),
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 9.0)),
                    SliverList.separated(
                      itemCount: 20,
                      itemBuilder: (context, index) => BlindPostCard(
                        imageUrl: '',
                        channel: '$index',
                        company: '$index',
                        createdAt: DateTime.now(),
                        title: '$index',
                        onChannelTapped: () {},
                        onCompanyTapped: () {},
                        onLikeTapped: () {},
                        onCommentTapped: () {},
                        onViewTapped: () {},
                        onTap: () {},
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.0),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 56.0 + 16.0)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
