import 'package:mu_hua_movie/generated/json/base/json_field.dart';
import 'package:mu_hua_movie/generated/json/vod_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class VodInfoEntity {

	@JSONField(name: "vod_id")
	late int vodId;
	@JSONField(name: "type_id")
	late int typeId;
	@JSONField(name: "type_id_1")
	late int typeId1;
	@JSONField(name: "group_id")
	late int groupId;
	@JSONField(name: "vod_name")
	late String vodName;
	@JSONField(name: "vod_sub")
	late String vodSub;
	@JSONField(name: "vod_en")
	late String vodEn;
	@JSONField(name: "vod_status")
	late int vodStatus;
	@JSONField(name: "vod_letter")
	late String vodLetter;
	@JSONField(name: "vod_color")
	late String vodColor;
	@JSONField(name: "vod_tag")
	late String vodTag;
	@JSONField(name: "vod_class")
	late String vodClass;
	@JSONField(name: "vod_pic")
	late String vodPic;
	@JSONField(name: "vod_pic_thumb")
	late String vodPicThumb;
	@JSONField(name: "vod_pic_slide")
	late String vodPicSlide;
	@JSONField(name: "vod_pic_screenshot")
	late String vodPicScreenshot;
	@JSONField(name: "vod_actor")
	late String vodActor;
	@JSONField(name: "vod_director")
	late String vodDirector;
	@JSONField(name: "vod_writer")
	late String vodWriter;
	@JSONField(name: "vod_behind")
	late String vodBehind;
	@JSONField(name: "vod_blurb")
	late String vodBlurb;
	@JSONField(name: "vod_remarks")
	late String vodRemarks;
	@JSONField(name: "vod_pubdate")
	late String vodPubdate;
	@JSONField(name: "vod_total")
	late int vodTotal;
	@JSONField(name: "vod_serial")
	late String vodSerial;
	@JSONField(name: "vod_tv")
	late String vodTv;
	@JSONField(name: "vod_weekday")
	late String vodWeekday;
	@JSONField(name: "vod_area")
	late String vodArea;
	@JSONField(name: "vod_lang")
	late String vodLang;
	@JSONField(name: "vod_year")
	late String vodYear;
	@JSONField(name: "vod_version")
	late String vodVersion;
	@JSONField(name: "vod_state")
	late String vodState;
	@JSONField(name: "vod_author")
	late String vodAuthor;
	@JSONField(name: "vod_jumpurl")
	late String vodJumpurl;
	@JSONField(name: "vod_tpl")
	late String vodTpl;
	@JSONField(name: "vod_tpl_play")
	late String vodTplPlay;
	@JSONField(name: "vod_tpl_down")
	late String vodTplDown;
	@JSONField(name: "vod_isend")
	late int vodIsend;
	@JSONField(name: "vod_lock")
	late int vodLock;
	@JSONField(name: "vod_level")
	late int vodLevel;
	@JSONField(name: "vod_copyright")
	late int vodCopyright;
	@JSONField(name: "vod_points")
	late int vodPoints;
	@JSONField(name: "vod_points_play")
	late int vodPointsPlay;
	@JSONField(name: "vod_points_down")
	late int vodPointsDown;
	@JSONField(name: "vod_hits")
	late int vodHits;
	@JSONField(name: "vod_hits_day")
	late int vodHitsDay;
	@JSONField(name: "vod_hits_week")
	late int vodHitsWeek;
	@JSONField(name: "vod_hits_month")
	late int vodHitsMonth;
	@JSONField(name: "vod_duration")
	late String vodDuration;
	@JSONField(name: "vod_up")
	late int vodUp;
	@JSONField(name: "vod_down")
	late int vodDown;
	@JSONField(name: "vod_score")
	late String vodScore;
	@JSONField(name: "vod_score_all")
	late int vodScoreAll;
	@JSONField(name: "vod_score_num")
	late int vodScoreNum;
	@JSONField(name: "vod_time")
	late String vodTime;
	@JSONField(name: "vod_time_add")
	late int vodTimeAdd;
	@JSONField(name: "vod_time_hits")
	late int vodTimeHits;
	@JSONField(name: "vod_time_make")
	late int vodTimeMake;
	@JSONField(name: "vod_trysee")
	late int vodTrysee;
	@JSONField(name: "vod_douban_id")
	late int vodDoubanId;
	@JSONField(name: "vod_douban_score")
	late String vodDoubanScore;
	@JSONField(name: "vod_reurl")
	late String vodReurl;
	@JSONField(name: "vod_rel_vod")
	late String vodRelVod;
	@JSONField(name: "vod_rel_art")
	late String vodRelArt;
	@JSONField(name: "vod_pwd")
	late String vodPwd;
	@JSONField(name: "vod_pwd_url")
	late String vodPwdUrl;
	@JSONField(name: "vod_pwd_play")
	late String vodPwdPlay;
	@JSONField(name: "vod_pwd_play_url")
	late String vodPwdPlayUrl;
	@JSONField(name: "vod_pwd_down")
	late String vodPwdDown;
	@JSONField(name: "vod_pwd_down_url")
	late String vodPwdDownUrl;
	@JSONField(name: "vod_content")
	late String vodContent;
	@JSONField(name: "vod_play_from")
	late String vodPlayFrom;
	@JSONField(name: "vod_play_server")
	late String vodPlayServer;
	@JSONField(name: "vod_play_note")
	late String vodPlayNote;
	@JSONField(name: "vod_play_url")
	late String vodPlayUrl;
	@JSONField(name: "vod_down_from")
	late String vodDownFrom;
	@JSONField(name: "vod_down_server")
	late String vodDownServer;
	@JSONField(name: "vod_down_note")
	late String vodDownNote;
	@JSONField(name: "vod_down_url")
	late String vodDownUrl;
	@JSONField(name: "vod_plot")
	late int vodPlot;
	@JSONField(name: "vod_plot_name")
	late String vodPlotName;
	@JSONField(name: "vod_plot_detail")
	late String vodPlotDetail;
	@JSONField(name: "type_name")
	late String typeName;
  
  VodInfoEntity();

  factory VodInfoEntity.fromJson(Map<String, dynamic> json) => $VodInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $VodInfoEntityToJson(this);

  VodInfoEntity copyWith({int? vodId, int? typeId, int? typeId1, int? groupId, String? vodName, String? vodSub, String? vodEn, int? vodStatus, String? vodLetter, String? vodColor, String? vodTag, String? vodClass, String? vodPic, String? vodPicThumb, String? vodPicSlide, String? vodPicScreenshot, String? vodActor, String? vodDirector, String? vodWriter, String? vodBehind, String? vodBlurb, String? vodRemarks, String? vodPubdate, int? vodTotal, String? vodSerial, String? vodTv, String? vodWeekday, String? vodArea, String? vodLang, String? vodYear, String? vodVersion, String? vodState, String? vodAuthor, String? vodJumpurl, String? vodTpl, String? vodTplPlay, String? vodTplDown, int? vodIsend, int? vodLock, int? vodLevel, int? vodCopyright, int? vodPoints, int? vodPointsPlay, int? vodPointsDown, int? vodHits, int? vodHitsDay, int? vodHitsWeek, int? vodHitsMonth, String? vodDuration, int? vodUp, int? vodDown, String? vodScore, int? vodScoreAll, int? vodScoreNum, String? vodTime, int? vodTimeAdd, int? vodTimeHits, int? vodTimeMake, int? vodTrysee, int? vodDoubanId, String? vodDoubanScore, String? vodReurl, String? vodRelVod, String? vodRelArt, String? vodPwd, String? vodPwdUrl, String? vodPwdPlay, String? vodPwdPlayUrl, String? vodPwdDown, String? vodPwdDownUrl, String? vodContent, String? vodPlayFrom, String? vodPlayServer, String? vodPlayNote, String? vodPlayUrl, String? vodDownFrom, String? vodDownServer, String? vodDownNote, String? vodDownUrl, int? vodPlot, String? vodPlotName, String? vodPlotDetail, String? typeName}) {
      return VodInfoEntity()..vodId= vodId ?? this.vodId
			..typeId= typeId ?? this.typeId
			..typeId1= typeId1 ?? this.typeId1
			..groupId= groupId ?? this.groupId
			..vodName= vodName ?? this.vodName
			..vodSub= vodSub ?? this.vodSub
			..vodEn= vodEn ?? this.vodEn
			..vodStatus= vodStatus ?? this.vodStatus
			..vodLetter= vodLetter ?? this.vodLetter
			..vodColor= vodColor ?? this.vodColor
			..vodTag= vodTag ?? this.vodTag
			..vodClass= vodClass ?? this.vodClass
			..vodPic= vodPic ?? this.vodPic
			..vodPicThumb= vodPicThumb ?? this.vodPicThumb
			..vodPicSlide= vodPicSlide ?? this.vodPicSlide
			..vodPicScreenshot= vodPicScreenshot ?? this.vodPicScreenshot
			..vodActor= vodActor ?? this.vodActor
			..vodDirector= vodDirector ?? this.vodDirector
			..vodWriter= vodWriter ?? this.vodWriter
			..vodBehind= vodBehind ?? this.vodBehind
			..vodBlurb= vodBlurb ?? this.vodBlurb
			..vodRemarks= vodRemarks ?? this.vodRemarks
			..vodPubdate= vodPubdate ?? this.vodPubdate
			..vodTotal= vodTotal ?? this.vodTotal
			..vodSerial= vodSerial ?? this.vodSerial
			..vodTv= vodTv ?? this.vodTv
			..vodWeekday= vodWeekday ?? this.vodWeekday
			..vodArea= vodArea ?? this.vodArea
			..vodLang= vodLang ?? this.vodLang
			..vodYear= vodYear ?? this.vodYear
			..vodVersion= vodVersion ?? this.vodVersion
			..vodState= vodState ?? this.vodState
			..vodAuthor= vodAuthor ?? this.vodAuthor
			..vodJumpurl= vodJumpurl ?? this.vodJumpurl
			..vodTpl= vodTpl ?? this.vodTpl
			..vodTplPlay= vodTplPlay ?? this.vodTplPlay
			..vodTplDown= vodTplDown ?? this.vodTplDown
			..vodIsend= vodIsend ?? this.vodIsend
			..vodLock= vodLock ?? this.vodLock
			..vodLevel= vodLevel ?? this.vodLevel
			..vodCopyright= vodCopyright ?? this.vodCopyright
			..vodPoints= vodPoints ?? this.vodPoints
			..vodPointsPlay= vodPointsPlay ?? this.vodPointsPlay
			..vodPointsDown= vodPointsDown ?? this.vodPointsDown
			..vodHits= vodHits ?? this.vodHits
			..vodHitsDay= vodHitsDay ?? this.vodHitsDay
			..vodHitsWeek= vodHitsWeek ?? this.vodHitsWeek
			..vodHitsMonth= vodHitsMonth ?? this.vodHitsMonth
			..vodDuration= vodDuration ?? this.vodDuration
			..vodUp= vodUp ?? this.vodUp
			..vodDown= vodDown ?? this.vodDown
			..vodScore= vodScore ?? this.vodScore
			..vodScoreAll= vodScoreAll ?? this.vodScoreAll
			..vodScoreNum= vodScoreNum ?? this.vodScoreNum
			..vodTime= vodTime ?? this.vodTime
			..vodTimeAdd= vodTimeAdd ?? this.vodTimeAdd
			..vodTimeHits= vodTimeHits ?? this.vodTimeHits
			..vodTimeMake= vodTimeMake ?? this.vodTimeMake
			..vodTrysee= vodTrysee ?? this.vodTrysee
			..vodDoubanId= vodDoubanId ?? this.vodDoubanId
			..vodDoubanScore= vodDoubanScore ?? this.vodDoubanScore
			..vodReurl= vodReurl ?? this.vodReurl
			..vodRelVod= vodRelVod ?? this.vodRelVod
			..vodRelArt= vodRelArt ?? this.vodRelArt
			..vodPwd= vodPwd ?? this.vodPwd
			..vodPwdUrl= vodPwdUrl ?? this.vodPwdUrl
			..vodPwdPlay= vodPwdPlay ?? this.vodPwdPlay
			..vodPwdPlayUrl= vodPwdPlayUrl ?? this.vodPwdPlayUrl
			..vodPwdDown= vodPwdDown ?? this.vodPwdDown
			..vodPwdDownUrl= vodPwdDownUrl ?? this.vodPwdDownUrl
			..vodContent= vodContent ?? this.vodContent
			..vodPlayFrom= vodPlayFrom ?? this.vodPlayFrom
			..vodPlayServer= vodPlayServer ?? this.vodPlayServer
			..vodPlayNote= vodPlayNote ?? this.vodPlayNote
			..vodPlayUrl= vodPlayUrl ?? this.vodPlayUrl
			..vodDownFrom= vodDownFrom ?? this.vodDownFrom
			..vodDownServer= vodDownServer ?? this.vodDownServer
			..vodDownNote= vodDownNote ?? this.vodDownNote
			..vodDownUrl= vodDownUrl ?? this.vodDownUrl
			..vodPlot= vodPlot ?? this.vodPlot
			..vodPlotName= vodPlotName ?? this.vodPlotName
			..vodPlotDetail= vodPlotDetail ?? this.vodPlotDetail
			..typeName= typeName ?? this.typeName;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}