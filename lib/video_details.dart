import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:soccer/helper/ad_helper.dart';
import 'package:soccer/models/VideoContent.dart';

class VideoDetails extends StatefulWidget {
  final VideoContent videoContent;
  VideoDetails(this.videoContent);

  @override
  State<StatefulWidget> createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetails> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  final _htmlContent = """
  <div style='width:100%;height:0px;position:relative;padding-bottom:56.250%;'><iframe src='https:\/\/www.scorebat.com\/embed\/v\/6128c4483364d\/?utm_source=api&utm_medium=video&utm_campaign=v3' frameborder='0' width='100%' height='100%' allowfullscreen allow='autoplay; fullscreen' style='width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;'><\/iframe><\/div>
  """;

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.videoContent.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: Image.network(widget.videoContent.thumbnail),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(widget.videoContent.title),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(widget.videoContent.competition),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(widget.videoContent.date.substring(0, 10)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Html(data: _htmlContent),
              ),
              if (_isBannerAdReady)
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: _bannerAd.size.width.toDouble(),
                    height: _bannerAd.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
