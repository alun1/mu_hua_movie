import 'package:mu_hua_movie/generated/json/base/json_convert_content.dart';
import 'package:mu_hua_movie/model/entity/vod_info_entity.dart';

VodInfoEntity $VodInfoEntityFromJson(Map<String, dynamic> json) {
	final VodInfoEntity vodInfoEntity = VodInfoEntity();
	final int? vodId = jsonConvert.convert<int>(json['vod_id']);
	if (vodId != null) {
		vodInfoEntity.vodId = vodId;
	}
	final int? typeId = jsonConvert.convert<int>(json['type_id']);
	if (typeId != null) {
		vodInfoEntity.typeId = typeId;
	}
	final int? typeId1 = jsonConvert.convert<int>(json['type_id_1']);
	if (typeId1 != null) {
		vodInfoEntity.typeId1 = typeId1;
	}
	final int? groupId = jsonConvert.convert<int>(json['group_id']);
	if (groupId != null) {
		vodInfoEntity.groupId = groupId;
	}
	final String? vodName = jsonConvert.convert<String>(json['vod_name']);
	if (vodName != null) {
		vodInfoEntity.vodName = vodName;
	}
	final String? vodSub = jsonConvert.convert<String>(json['vod_sub']);
	if (vodSub != null) {
		vodInfoEntity.vodSub = vodSub;
	}
	final String? vodEn = jsonConvert.convert<String>(json['vod_en']);
	if (vodEn != null) {
		vodInfoEntity.vodEn = vodEn;
	}
	final int? vodStatus = jsonConvert.convert<int>(json['vod_status']);
	if (vodStatus != null) {
		vodInfoEntity.vodStatus = vodStatus;
	}
	final String? vodLetter = jsonConvert.convert<String>(json['vod_letter']);
	if (vodLetter != null) {
		vodInfoEntity.vodLetter = vodLetter;
	}
	final String? vodColor = jsonConvert.convert<String>(json['vod_color']);
	if (vodColor != null) {
		vodInfoEntity.vodColor = vodColor;
	}
	final String? vodTag = jsonConvert.convert<String>(json['vod_tag']);
	if (vodTag != null) {
		vodInfoEntity.vodTag = vodTag;
	}
	final String? vodClass = jsonConvert.convert<String>(json['vod_class']);
	if (vodClass != null) {
		vodInfoEntity.vodClass = vodClass;
	}
	final String? vodPic = jsonConvert.convert<String>(json['vod_pic']);
	if (vodPic != null) {
		vodInfoEntity.vodPic = vodPic;
	}
	final String? vodPicThumb = jsonConvert.convert<String>(json['vod_pic_thumb']);
	if (vodPicThumb != null) {
		vodInfoEntity.vodPicThumb = vodPicThumb;
	}
	final String? vodPicSlide = jsonConvert.convert<String>(json['vod_pic_slide']);
	if (vodPicSlide != null) {
		vodInfoEntity.vodPicSlide = vodPicSlide;
	}
	final String? vodPicScreenshot = jsonConvert.convert<String>(json['vod_pic_screenshot']);
	if (vodPicScreenshot != null) {
		vodInfoEntity.vodPicScreenshot = vodPicScreenshot;
	}
	final String? vodActor = jsonConvert.convert<String>(json['vod_actor']);
	if (vodActor != null) {
		vodInfoEntity.vodActor = vodActor;
	}
	final String? vodDirector = jsonConvert.convert<String>(json['vod_director']);
	if (vodDirector != null) {
		vodInfoEntity.vodDirector = vodDirector;
	}
	final String? vodWriter = jsonConvert.convert<String>(json['vod_writer']);
	if (vodWriter != null) {
		vodInfoEntity.vodWriter = vodWriter;
	}
	final String? vodBehind = jsonConvert.convert<String>(json['vod_behind']);
	if (vodBehind != null) {
		vodInfoEntity.vodBehind = vodBehind;
	}
	final String? vodBlurb = jsonConvert.convert<String>(json['vod_blurb']);
	if (vodBlurb != null) {
		vodInfoEntity.vodBlurb = vodBlurb;
	}
	final String? vodRemarks = jsonConvert.convert<String>(json['vod_remarks']);
	if (vodRemarks != null) {
		vodInfoEntity.vodRemarks = vodRemarks;
	}
	final String? vodPubdate = jsonConvert.convert<String>(json['vod_pubdate']);
	if (vodPubdate != null) {
		vodInfoEntity.vodPubdate = vodPubdate;
	}
	final int? vodTotal = jsonConvert.convert<int>(json['vod_total']);
	if (vodTotal != null) {
		vodInfoEntity.vodTotal = vodTotal;
	}
	final String? vodSerial = jsonConvert.convert<String>(json['vod_serial']);
	if (vodSerial != null) {
		vodInfoEntity.vodSerial = vodSerial;
	}
	final String? vodTv = jsonConvert.convert<String>(json['vod_tv']);
	if (vodTv != null) {
		vodInfoEntity.vodTv = vodTv;
	}
	final String? vodWeekday = jsonConvert.convert<String>(json['vod_weekday']);
	if (vodWeekday != null) {
		vodInfoEntity.vodWeekday = vodWeekday;
	}
	final String? vodArea = jsonConvert.convert<String>(json['vod_area']);
	if (vodArea != null) {
		vodInfoEntity.vodArea = vodArea;
	}
	final String? vodLang = jsonConvert.convert<String>(json['vod_lang']);
	if (vodLang != null) {
		vodInfoEntity.vodLang = vodLang;
	}
	final String? vodYear = jsonConvert.convert<String>(json['vod_year']);
	if (vodYear != null) {
		vodInfoEntity.vodYear = vodYear;
	}
	final String? vodVersion = jsonConvert.convert<String>(json['vod_version']);
	if (vodVersion != null) {
		vodInfoEntity.vodVersion = vodVersion;
	}
	final String? vodState = jsonConvert.convert<String>(json['vod_state']);
	if (vodState != null) {
		vodInfoEntity.vodState = vodState;
	}
	final String? vodAuthor = jsonConvert.convert<String>(json['vod_author']);
	if (vodAuthor != null) {
		vodInfoEntity.vodAuthor = vodAuthor;
	}
	final String? vodJumpurl = jsonConvert.convert<String>(json['vod_jumpurl']);
	if (vodJumpurl != null) {
		vodInfoEntity.vodJumpurl = vodJumpurl;
	}
	final String? vodTpl = jsonConvert.convert<String>(json['vod_tpl']);
	if (vodTpl != null) {
		vodInfoEntity.vodTpl = vodTpl;
	}
	final String? vodTplPlay = jsonConvert.convert<String>(json['vod_tpl_play']);
	if (vodTplPlay != null) {
		vodInfoEntity.vodTplPlay = vodTplPlay;
	}
	final String? vodTplDown = jsonConvert.convert<String>(json['vod_tpl_down']);
	if (vodTplDown != null) {
		vodInfoEntity.vodTplDown = vodTplDown;
	}
	final int? vodIsend = jsonConvert.convert<int>(json['vod_isend']);
	if (vodIsend != null) {
		vodInfoEntity.vodIsend = vodIsend;
	}
	final int? vodLock = jsonConvert.convert<int>(json['vod_lock']);
	if (vodLock != null) {
		vodInfoEntity.vodLock = vodLock;
	}
	final int? vodLevel = jsonConvert.convert<int>(json['vod_level']);
	if (vodLevel != null) {
		vodInfoEntity.vodLevel = vodLevel;
	}
	final int? vodCopyright = jsonConvert.convert<int>(json['vod_copyright']);
	if (vodCopyright != null) {
		vodInfoEntity.vodCopyright = vodCopyright;
	}
	final int? vodPoints = jsonConvert.convert<int>(json['vod_points']);
	if (vodPoints != null) {
		vodInfoEntity.vodPoints = vodPoints;
	}
	final int? vodPointsPlay = jsonConvert.convert<int>(json['vod_points_play']);
	if (vodPointsPlay != null) {
		vodInfoEntity.vodPointsPlay = vodPointsPlay;
	}
	final int? vodPointsDown = jsonConvert.convert<int>(json['vod_points_down']);
	if (vodPointsDown != null) {
		vodInfoEntity.vodPointsDown = vodPointsDown;
	}
	final int? vodHits = jsonConvert.convert<int>(json['vod_hits']);
	if (vodHits != null) {
		vodInfoEntity.vodHits = vodHits;
	}
	final int? vodHitsDay = jsonConvert.convert<int>(json['vod_hits_day']);
	if (vodHitsDay != null) {
		vodInfoEntity.vodHitsDay = vodHitsDay;
	}
	final int? vodHitsWeek = jsonConvert.convert<int>(json['vod_hits_week']);
	if (vodHitsWeek != null) {
		vodInfoEntity.vodHitsWeek = vodHitsWeek;
	}
	final int? vodHitsMonth = jsonConvert.convert<int>(json['vod_hits_month']);
	if (vodHitsMonth != null) {
		vodInfoEntity.vodHitsMonth = vodHitsMonth;
	}
	final String? vodDuration = jsonConvert.convert<String>(json['vod_duration']);
	if (vodDuration != null) {
		vodInfoEntity.vodDuration = vodDuration;
	}
	final int? vodUp = jsonConvert.convert<int>(json['vod_up']);
	if (vodUp != null) {
		vodInfoEntity.vodUp = vodUp;
	}
	final int? vodDown = jsonConvert.convert<int>(json['vod_down']);
	if (vodDown != null) {
		vodInfoEntity.vodDown = vodDown;
	}
	final String? vodScore = jsonConvert.convert<String>(json['vod_score']);
	if (vodScore != null) {
		vodInfoEntity.vodScore = vodScore;
	}
	final int? vodScoreAll = jsonConvert.convert<int>(json['vod_score_all']);
	if (vodScoreAll != null) {
		vodInfoEntity.vodScoreAll = vodScoreAll;
	}
	final int? vodScoreNum = jsonConvert.convert<int>(json['vod_score_num']);
	if (vodScoreNum != null) {
		vodInfoEntity.vodScoreNum = vodScoreNum;
	}
	final String? vodTime = jsonConvert.convert<String>(json['vod_time']);
	if (vodTime != null) {
		vodInfoEntity.vodTime = vodTime;
	}
	final int? vodTimeAdd = jsonConvert.convert<int>(json['vod_time_add']);
	if (vodTimeAdd != null) {
		vodInfoEntity.vodTimeAdd = vodTimeAdd;
	}
	final int? vodTimeHits = jsonConvert.convert<int>(json['vod_time_hits']);
	if (vodTimeHits != null) {
		vodInfoEntity.vodTimeHits = vodTimeHits;
	}
	final int? vodTimeMake = jsonConvert.convert<int>(json['vod_time_make']);
	if (vodTimeMake != null) {
		vodInfoEntity.vodTimeMake = vodTimeMake;
	}
	final int? vodTrysee = jsonConvert.convert<int>(json['vod_trysee']);
	if (vodTrysee != null) {
		vodInfoEntity.vodTrysee = vodTrysee;
	}
	final int? vodDoubanId = jsonConvert.convert<int>(json['vod_douban_id']);
	if (vodDoubanId != null) {
		vodInfoEntity.vodDoubanId = vodDoubanId;
	}
	final String? vodDoubanScore = jsonConvert.convert<String>(json['vod_douban_score']);
	if (vodDoubanScore != null) {
		vodInfoEntity.vodDoubanScore = vodDoubanScore;
	}
	final String? vodReurl = jsonConvert.convert<String>(json['vod_reurl']);
	if (vodReurl != null) {
		vodInfoEntity.vodReurl = vodReurl;
	}
	final String? vodRelVod = jsonConvert.convert<String>(json['vod_rel_vod']);
	if (vodRelVod != null) {
		vodInfoEntity.vodRelVod = vodRelVod;
	}
	final String? vodRelArt = jsonConvert.convert<String>(json['vod_rel_art']);
	if (vodRelArt != null) {
		vodInfoEntity.vodRelArt = vodRelArt;
	}
	final String? vodPwd = jsonConvert.convert<String>(json['vod_pwd']);
	if (vodPwd != null) {
		vodInfoEntity.vodPwd = vodPwd;
	}
	final String? vodPwdUrl = jsonConvert.convert<String>(json['vod_pwd_url']);
	if (vodPwdUrl != null) {
		vodInfoEntity.vodPwdUrl = vodPwdUrl;
	}
	final String? vodPwdPlay = jsonConvert.convert<String>(json['vod_pwd_play']);
	if (vodPwdPlay != null) {
		vodInfoEntity.vodPwdPlay = vodPwdPlay;
	}
	final String? vodPwdPlayUrl = jsonConvert.convert<String>(json['vod_pwd_play_url']);
	if (vodPwdPlayUrl != null) {
		vodInfoEntity.vodPwdPlayUrl = vodPwdPlayUrl;
	}
	final String? vodPwdDown = jsonConvert.convert<String>(json['vod_pwd_down']);
	if (vodPwdDown != null) {
		vodInfoEntity.vodPwdDown = vodPwdDown;
	}
	final String? vodPwdDownUrl = jsonConvert.convert<String>(json['vod_pwd_down_url']);
	if (vodPwdDownUrl != null) {
		vodInfoEntity.vodPwdDownUrl = vodPwdDownUrl;
	}
	final String? vodContent = jsonConvert.convert<String>(json['vod_content']);
	if (vodContent != null) {
		vodInfoEntity.vodContent = vodContent;
	}
	final String? vodPlayFrom = jsonConvert.convert<String>(json['vod_play_from']);
	if (vodPlayFrom != null) {
		vodInfoEntity.vodPlayFrom = vodPlayFrom;
	}
	final String? vodPlayServer = jsonConvert.convert<String>(json['vod_play_server']);
	if (vodPlayServer != null) {
		vodInfoEntity.vodPlayServer = vodPlayServer;
	}
	final String? vodPlayNote = jsonConvert.convert<String>(json['vod_play_note']);
	if (vodPlayNote != null) {
		vodInfoEntity.vodPlayNote = vodPlayNote;
	}
	final String? vodPlayUrl = jsonConvert.convert<String>(json['vod_play_url']);
	if (vodPlayUrl != null) {
		vodInfoEntity.vodPlayUrl = vodPlayUrl;
	}
	final String? vodDownFrom = jsonConvert.convert<String>(json['vod_down_from']);
	if (vodDownFrom != null) {
		vodInfoEntity.vodDownFrom = vodDownFrom;
	}
	final String? vodDownServer = jsonConvert.convert<String>(json['vod_down_server']);
	if (vodDownServer != null) {
		vodInfoEntity.vodDownServer = vodDownServer;
	}
	final String? vodDownNote = jsonConvert.convert<String>(json['vod_down_note']);
	if (vodDownNote != null) {
		vodInfoEntity.vodDownNote = vodDownNote;
	}
	final String? vodDownUrl = jsonConvert.convert<String>(json['vod_down_url']);
	if (vodDownUrl != null) {
		vodInfoEntity.vodDownUrl = vodDownUrl;
	}
	final int? vodPlot = jsonConvert.convert<int>(json['vod_plot']);
	if (vodPlot != null) {
		vodInfoEntity.vodPlot = vodPlot;
	}
	final String? vodPlotName = jsonConvert.convert<String>(json['vod_plot_name']);
	if (vodPlotName != null) {
		vodInfoEntity.vodPlotName = vodPlotName;
	}
	final String? vodPlotDetail = jsonConvert.convert<String>(json['vod_plot_detail']);
	if (vodPlotDetail != null) {
		vodInfoEntity.vodPlotDetail = vodPlotDetail;
	}
	final String? typeName = jsonConvert.convert<String>(json['type_name']);
	if (typeName != null) {
		vodInfoEntity.typeName = typeName;
	}
	return vodInfoEntity;
}

Map<String, dynamic> $VodInfoEntityToJson(VodInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['vod_id'] = entity.vodId;
	data['type_id'] = entity.typeId;
	data['type_id_1'] = entity.typeId1;
	data['group_id'] = entity.groupId;
	data['vod_name'] = entity.vodName;
	data['vod_sub'] = entity.vodSub;
	data['vod_en'] = entity.vodEn;
	data['vod_status'] = entity.vodStatus;
	data['vod_letter'] = entity.vodLetter;
	data['vod_color'] = entity.vodColor;
	data['vod_tag'] = entity.vodTag;
	data['vod_class'] = entity.vodClass;
	data['vod_pic'] = entity.vodPic;
	data['vod_pic_thumb'] = entity.vodPicThumb;
	data['vod_pic_slide'] = entity.vodPicSlide;
	data['vod_pic_screenshot'] = entity.vodPicScreenshot;
	data['vod_actor'] = entity.vodActor;
	data['vod_director'] = entity.vodDirector;
	data['vod_writer'] = entity.vodWriter;
	data['vod_behind'] = entity.vodBehind;
	data['vod_blurb'] = entity.vodBlurb;
	data['vod_remarks'] = entity.vodRemarks;
	data['vod_pubdate'] = entity.vodPubdate;
	data['vod_total'] = entity.vodTotal;
	data['vod_serial'] = entity.vodSerial;
	data['vod_tv'] = entity.vodTv;
	data['vod_weekday'] = entity.vodWeekday;
	data['vod_area'] = entity.vodArea;
	data['vod_lang'] = entity.vodLang;
	data['vod_year'] = entity.vodYear;
	data['vod_version'] = entity.vodVersion;
	data['vod_state'] = entity.vodState;
	data['vod_author'] = entity.vodAuthor;
	data['vod_jumpurl'] = entity.vodJumpurl;
	data['vod_tpl'] = entity.vodTpl;
	data['vod_tpl_play'] = entity.vodTplPlay;
	data['vod_tpl_down'] = entity.vodTplDown;
	data['vod_isend'] = entity.vodIsend;
	data['vod_lock'] = entity.vodLock;
	data['vod_level'] = entity.vodLevel;
	data['vod_copyright'] = entity.vodCopyright;
	data['vod_points'] = entity.vodPoints;
	data['vod_points_play'] = entity.vodPointsPlay;
	data['vod_points_down'] = entity.vodPointsDown;
	data['vod_hits'] = entity.vodHits;
	data['vod_hits_day'] = entity.vodHitsDay;
	data['vod_hits_week'] = entity.vodHitsWeek;
	data['vod_hits_month'] = entity.vodHitsMonth;
	data['vod_duration'] = entity.vodDuration;
	data['vod_up'] = entity.vodUp;
	data['vod_down'] = entity.vodDown;
	data['vod_score'] = entity.vodScore;
	data['vod_score_all'] = entity.vodScoreAll;
	data['vod_score_num'] = entity.vodScoreNum;
	data['vod_time'] = entity.vodTime;
	data['vod_time_add'] = entity.vodTimeAdd;
	data['vod_time_hits'] = entity.vodTimeHits;
	data['vod_time_make'] = entity.vodTimeMake;
	data['vod_trysee'] = entity.vodTrysee;
	data['vod_douban_id'] = entity.vodDoubanId;
	data['vod_douban_score'] = entity.vodDoubanScore;
	data['vod_reurl'] = entity.vodReurl;
	data['vod_rel_vod'] = entity.vodRelVod;
	data['vod_rel_art'] = entity.vodRelArt;
	data['vod_pwd'] = entity.vodPwd;
	data['vod_pwd_url'] = entity.vodPwdUrl;
	data['vod_pwd_play'] = entity.vodPwdPlay;
	data['vod_pwd_play_url'] = entity.vodPwdPlayUrl;
	data['vod_pwd_down'] = entity.vodPwdDown;
	data['vod_pwd_down_url'] = entity.vodPwdDownUrl;
	data['vod_content'] = entity.vodContent;
	data['vod_play_from'] = entity.vodPlayFrom;
	data['vod_play_server'] = entity.vodPlayServer;
	data['vod_play_note'] = entity.vodPlayNote;
	data['vod_play_url'] = entity.vodPlayUrl;
	data['vod_down_from'] = entity.vodDownFrom;
	data['vod_down_server'] = entity.vodDownServer;
	data['vod_down_note'] = entity.vodDownNote;
	data['vod_down_url'] = entity.vodDownUrl;
	data['vod_plot'] = entity.vodPlot;
	data['vod_plot_name'] = entity.vodPlotName;
	data['vod_plot_detail'] = entity.vodPlotDetail;
	data['type_name'] = entity.typeName;
	return data;
}