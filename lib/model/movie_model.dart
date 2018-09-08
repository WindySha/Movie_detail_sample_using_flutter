class Movie {
  Movie({
    this.bannerUrl,
    this.posterUrl,
    this.title,
    this.rating,
    this.starRating,
    this.categories,
    this.storyline,
    this.photoUrls,
    this.actors,
  });

  final String bannerUrl;
  final String posterUrl;
  final String title;
  final double rating;
  final int starRating;
  final List<String> categories;
  final String storyline;
  final List<String> photoUrls;
  final List<Actor> actors;
}

class Actor {
  Actor({
    this.name,
    this.avatarUrl,
  });

  final String name;
  final String avatarUrl;
}

class MovieFacroty {
  static Movie getMovie() {
    return Movie(
      bannerUrl: 'images/banner.webp',
      posterUrl: 'images/poster.webp',
      title: '十月围城',
      rating: 7.7,
      starRating: 4,
      categories: ['剧情', '动作', '历史'],
      storyline: '1905年，香港中环。革命志士惨遭暗杀。知悉孙中山（张涵予 饰）即将抵港，清廷遂派遣将军阎孝国（胡军 饰）前来剿杀。'
          '他收买赌徒沈重阳(甄子丹 饰)作密探。适逢商人李玉堂(王学圻 饰)之子李重光(王柏杰饰)考学庆典，沈重阳见前妻月茹(范冰冰 饰)与幼女已成他人家眷，'
          '黯然离去。为护孙，《中国日报》社长陈少白（梁家辉 饰）邀戏班班主（任达华饰）出手，令其惨遭灭门，其女方红(李宇春 饰)侥幸生还。'
          '陈少白被擒，与阎孝国相见，师生决裂。独子游行好友被擒等变故，使李玉堂投身革命，引得探长史密夫(曾志伟 饰)查封报馆。'
          '其间，李玉堂帮车夫阿四(谢霆锋 饰)与恋人阿纯（周韵 饰）订婚。月茹夜会沈重阳，要他弃暗投明。打女方红、小贩王复明(巴特尔 饰)、乞丐刘郁白(黎明 饰)等人也先后加入护孙行列。'
          '一场惊心动魄的全城追杀由此展开……本片投资1.5亿人民币，史上首度以 1：1的比例，在上海重铸了1905年的香港中环。',
      photoUrls: [
        'images/1.webp',
        'images/2.webp',
        'images/3.webp',
        'images/4.webp',
        'images/5.webp',
        'images/6.webp',
        'images/7.webp',
        'images/8.webp',
        'images/9.webp',
        'images/10.webp',
      ],
      actors: [
        Actor(
          name: '陈德森',
          avatarUrl: 'images/teddy_chen.webp',
        ),
        Actor(
          name: '甄子丹',
          avatarUrl: 'images/donnie_yen.webp',
        ),
        Actor(
          name: '王学圻',
          avatarUrl: 'images/wang_xueqi.webp',
        ),
        Actor(
          name: '梁家辉',
          avatarUrl: 'images/tony_leung.webp',
        ),
        Actor(
          name: '胡军',
          avatarUrl: 'images/hu_jun.webp',
        ),
      ],
    );
  }
}
