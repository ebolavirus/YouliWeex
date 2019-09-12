//
//  tooles.m
//  huoche
//
//  Created by kan xu on 11-1-22.
//  Copyright 2011 paduu. All rights reserved.
//

#import "stories.h"

@implementation stories

+(NSArray*)loadStoryByDayFlag:(NSInteger)aDayFlag {
	switch (aDayFlag) {
			// 规则
			// 普通剧本
			// 第一个元素：storyb/w-祐莉衣服-背景-初始bgm-0（好感度变化）
			// 第二个元素开始: 0/1/2/3(是否展示祐莉，2为标题,3为场景图片)-12（祐莉表情）-speaker-text（文本）-bgm（新bgm）
			// 最后一个元素：end-index（下一个元素index）
			// dialog
			// 第一个元素：dialogb/w-问句
			// 第三个元素：选项一-index（下一个元素）,index为end
			// 第四个元素：选项二-index（下一个元素）
		case 0: {
			NSArray *array0dialog =
			[NSArray arrayWithObjects:
			@"dialogb-現在開始將進行片頭劇情。您可以選擇跳過，但是將會錯過重要的劇情與遊戲提示。請問您確定要跳過嗎？",
			 @"不，進行片頭劇情-1",
			 @"是，直接開始遊戲-end",
			 nil];
			NSArray *array1prologue =
			[NSArray arrayWithObjects:
			 @"storyb-face01001-scene_cinema-0-0",
			 @"2-0-0-Prologue\n告白-0",
			 @"0-lt-0-那是壹次很普通的約會。-lt",
			 @"0-lt-0-相識多年的女孩祐莉，壹如往常的和我看電影。-lt",
			 @"0-lt-0-不過，就在道別時，她說了令我意想不到的話。-lt",
			 @"0-lt-0-這是，我倆新關系的開始……-lt",
			 @"1-0-祐莉-今天謝謝你陪我。今天這部電影真好看。-bgm009",
			 @"1-lt-我-倒是我才要謝謝妳呢。本來這部片想自己來看的呢！-lt",
			 @"1-lt-我-不過……沒想到，妳也會對這種陽剛的動作片有興趣啊？-lt",
			 @"1-face02002-祐莉-說得也是呢。不過，畢竟是大卡司的強片，我也會想看看啊！-lt",
			 @"1-lt-我-總之，今天謝謝妳陪我。下次……再一起去看電影吧！-lt",
			 @"1-lt-0-每一次想要約祐莉下次約會，總是這樣提心吊膽的。-lt",
			 @"1-lt-0-沒辦法，像祐莉這樣的美女，身邊總是有許多實力堅強的追求者呢。-lt",
			 @"1-face02007-祐莉-嗯……-lt",
			 @"1-lt-0-通常，祐莉總是會模稜兩可的說『看情況囉』含混地帶過。-lt",
			 @"1-lt-0-不過，今天，祐莉的神情看起來似乎不太一樣。-lt",
			 @"1-lt-我-怎麼啦？妳似乎有什麼心事是嗎？-lt",
			 @"1-face02006-祐莉-啊！？你……看得出來嗎？-lt",
			 @"1-face02010-我-這還用說！認識妳這麼久了，平常的妳總是會開心地跟我揮手說拜拜啊！-lt",
			 @"1-lt-我-今天是怎麼了？我好歹也是妳的好朋友，有什麼事要幫忙儘管說吧！-lt",
			 @"1-lt-0-是的，就像這樣，我對祐莉而言是個有難可以共苦的好朋友。-lt",
			 @"1-lt-0-不過…至於會不會有更進一步的發展呢？……答案不用說也知道。-lt",
			 @"1-lt-0-就像人家說的，我對她而言，就是個『好人』吧。-lt",
			 @"1-lt-0-我唯一能要求的，頂多只是像這樣不具任何意義的約會罷了。-lt",
			 @"1-face02007-祐莉-是啊……好朋友……嗎……-lt",
			 @"1-lt-我-當然啦！一切包在我身上！-lt",
			 @"1-face02007-祐莉-我說……平常你總是很樂意幫我任何事情。我想……這次有個大忙想請你幫忙……-lt",
			 @"1-lt-0-平常祐莉有任何想要我幫忙的事時，總是會用快讓我融化的語調請求我。-lt",
			 @"1-lt-0-光是這樣就足以讓我心甘情願為她赴湯蹈火。即使最後得到的，只有那甜到我心頭的笑容。-lt",
			 @"1-lt-0-現在聽到祐莉這樣語重心長地說，總覺得有什麼大事要發生。-lt",
			 @"1-face02008-祐莉-你住的地方……還有空的房間嗎？-lt",
			 @"1-lt-我-空的房間？呃……是有一間啦。怎麼？是妳的衣服太多，要我幫妳保管嗎？哈哈……-lt",
			 @"1-lt-0-我承認，剛剛的發言很遜。我總是這樣，在祐莉面前時，一旦心裡慌了，就會說出這種自以為風趣的冷笑話。-lt",
			 @"1-face02007-祐莉-我想……搬過去跟你一起住！-lt",
			 @"1-lt-我-哦，這樣啊。那當然是沒問題……咦！？-lt",
			 @"1-lt-0-平常我對她的請求總是二話不說地答應下來。但是，這次……我以為我聽錯了。-lt",
			 @"1-lt-我-跟……跟我一起住！？我……我沒聽錯吧？-lt",
			 @"1-face02010-祐莉-……是真的！-lt",
			 @"1-lt-我-這……不太好吧？我們又不是男女朋友，像這樣住在一起……-lt",
			 @"1-face02007-祐莉-所以…我想…我們可以不必再當普通朋友了。-lt",
			 @"1-lt-我-呃！？-lt",
			 @"1-face02008-祐莉-我想……我們是不是可以開始當……男女朋友？-lt",
			 @"1-lt-0-聽到她這麼說，一時之間我還真不敢相信。-lt",
			 @"1-lt-0-是啊！在我面前的，是從以前同班以來，就一直不乏追求者的女神．祐莉啊！-lt",
			 @"1-lt-0-不僅是已知的追求者，暗戀她的人更不勝枚舉。……是的，也包括我在內。-lt",
			 @"1-lt-我-哈…哈哈……，妳…妳這麼說……我還真不知道該怎麼辦……-lt",
			 @"1-lt-祐莉-我不是開玩笑的！只有你……不把我當成別人眼中，只靠金錢與外表來決定對象的膚淺女人……。-lt",
			 @"1-lt-0-聽祐莉這麼說，我能想像，即使像她這樣的女生，也會碰到許多愛情上的挫折。-lt",
			 @"1-lt-0-是的，我都知道。那些她交往過的男人，儘管再多金、帥氣，卻沒一個是真心疼惜祐莉的。-lt",
			 @"1-lt-我-不！當然不是！在我心中，妳一直是最耀眼的！只是……-lt",
			 @"1-lt-我-就因為妳太耀眼了……，光是能跟妳當普通朋友，我以為這樣就很好了！-lt",
			 @"1-lt-我-跟妳成為男女朋友，更是心中遙遠的夢想！……只是，一直當成夢想而已……-lt",
			 @"1-face02005-祐莉-因為…只有你，不會只把我當成想追求的女生，用最虛假的一面來對待我。-lt",
			 @"1-lt-祐莉-你總是在我最需要幫助的時候，不經意的陪伴我，甚至給我最需要的幫助！-lt",
			 @"1-lt-我-哈哈，我一直以為，你只是把我當成一個很好差遣的好人而已呢！-lt",
			 @"1-lt-祐莉-嗯嗯……，就是因為你太老實了，讓我到現在才發現你的好啊！-lt",
			 @"1-lt-我-祐莉……-lt",
			 @"1-face02008-祐莉-那麼…我可以從現在開始…用“達令”來稱呼你嗎？-lt",
			 @"1-lt-我-“達令”！？會不會有點怪怪的？又不是外國人……-lt",
			 @"1-face02002-祐莉-不會啊！因為，我小時候住國外時，大家都這樣叫的啊！-lt",
			 @"1-lt-0-對哦…我差點忘了。祐莉是從小就在國外長大，可說是家境優渥的千金小姐呢。-lt",
			 @"1-face02007-祐莉-反正，人家就是想這樣稱呼你嘛！-lt",
			 @"1-lt-我-這…這樣啊……那，只要妳喜歡就可以的……-lt",
			 @"1-face02003-祐莉-嘻嘻！那就這麼決定囉，達～令！-lt",
			 @"1-lt-我-……不過，馬上就說要搬來一起住，會不會太突然了？是不是有什麼……-lt",
			 @"1-face02007-祐莉-拜託你……就這件事……請你不要追究……好嗎？-lt",
			 @"1-lt-我-這……-lt",
			 @"1-lt-祐莉-還是說……你不想…跟我一起住？-lt",
			 @"1-lt-我-絕、絕對沒這回事！我……我很樂意！-lt",
			 @"1-face02005-祐莉-這麼說你是答應了？　我的請求……-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0dialog, array1prologue, nil];
		}
		case 10: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-home_first-0-0",
			 @"0-lt-0-就這樣，我跟相識、暗戀多年，心中永遠最美麗的女神，成為男女朋友了。-lt",
			 @"0-lt-0-兩個禮拜後……-lt",
			 @"0-lt-0-終於，到了她要搬來跟我一起同住的日子。-lt",
			 
			 @"1-0-祐莉-達令！從今天開始就要住進你家了。往後就請多指教哦！-bgm002",
			 @"1-lt-我-呃……哪裡，我一個大男生住，房子可能沒那麼舒適，就請妳多包涵了！-lt",
			 @"1-face02009-祐莉-那麼，我進來了哦。-lt",
			 @"1-face02006-祐莉-哇～，達令，沒想到…你家裡弄得挺漂亮呢！根本不像男生獨居的樣子呢！-lt",
			 @"1-lt-0-那是當然的。在她搬來之前，我每天晚上可是拼了命地整理我這個豬窩呢。-lt",
			 @"1-lt-0-目前的我是個快畢業的大四學生。托老爸老媽的福，我得以住在這間還算不錯的公寓裡頭。-lt",
			 @"1-lt-0-平常的花費只靠打工的收入就夠花用了，還能有一些些積蓄。-lt",
			 @"1-lt-0-不過為了讓祐莉可以舒適地居住，我又添購了許多家具，身上的積蓄幾乎都快花光了。-lt",
			 @"1-lt-0-不過，為了祐莉…我想這一切都是值得的。-lt",
			 @"1-lt-我-祐莉，這邊的環境還可以嗎？-lt",
			 @"1-face02002-祐莉-嗯嗯，你的家感覺很舒適，真的讓我有家的感覺呢。我很喜歡！-lt",
			 @"1-lt-我-那麼，我幫妳搬東西吧！-lt",
			 @"0-0-0-我幫忙把祐莉的行李搬到她的房間去。-lt",
			 @"0-0-0-祐莉的行李也不少，其中除了漂亮女生必備的各種行頭、化妝品之外，也有不少書籍。-lt",
			 @"0-0-0-祐莉目前正在攻讀服裝設計，除了學校本身就是知名的大學之外，祐莉本身成績似乎也相當不錯。-lt",
			 @"0-0-0-也因為這樣，原本就長得漂亮的祐莉，加上優秀的時尚品味包裝，讓她顯得更加亮麗。-lt",
			 @"0-0-0-不過…雖然祐莉跟我已經是男女朋友的關係，不過同居卻住在不同的房間……-lt",
			 @"0-0-0-不行……絕對不能猴急。今天能有這樣的局面，已經是很不得了的進步，也不好再強求什麼了。-lt",
			 @"1-face02009-祐莉-我們從今天開始就要一起生活了，不過，不知道你平常是怎樣度過每一天的呢？-lt",
			 @"1-lt-我-說得也是。如果沒有解說的話，玩家也不知道該怎麼進行遊戲吧？-lt",
			 @"1-face02006-祐莉-玩家？你在說什麼啊？-lt",
			 @"1-lt-我-沒事沒事，不要在意。總之，現在開始將解說遊戲的基本進行方式。-lt",
			 @"1-lt-0-【重要提示】\n如果您是第一次玩本遊戲，建議您耐心看完解說，對遊戲的進行會更有幫助。-lt",
			 @"end-1",
			 nil];
			NSArray *array1dialog =
			[NSArray arrayWithObjects:
			 @"dialogw-【重要提示】\n請問您要觀看遊戲解說嗎？",
			 @"是，觀看解說-3",
			 @"否，跳過解說-2",
			 nil];
			NSArray *array2story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-home_first-0-0",
			 @"0-0-0-【遊戲解說】\n關於遊戲解說的部分就此略過。遊戲將正式開始。-lt",
			 @"end-end",
			 nil];
			NSArray *array3story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-home_first-bgm002-0",
			 @"0-0-0-【存檔功能】-lt",
			 @"0-lt-我-在系統選單內選擇『儲存進度』，就可以儲存目前遊戲的進度。-lt",
			 @"0-lt-我-儲存的進度『LOAD』就可繼續進行遊戲。-lt",
			 @"0-lt-0-【遊戲的流程】-lt",
			 @"0-lt-我-遊戲中是以“天”為單位進行的。-lt",
			 @"0-lt-我-每一天在我從學校回來以後，就是可以自由選擇行動的時間。-lt",
			 @"0-lt-我-玩家可從四個行動中選擇一個來進行。分別是『打工』、『論文』、『逛街』、『休息』。-lt",
			 @"0-lt-我-選擇進行其中一個行動之後，就會自動進入晚上的休息時間，然後到第二天。-lt",
			 @"0-lt-我-這就是遊戲中基本的進行流程。-lt",
			 @"1-0-祐莉-嗯嗯。-lt",
			 @"0-0-0-『打工』是我主要的收入來源。-lt",
			 @"0-lt-我-每一天的收入狀況會根據我的疲勞度而變動。基本上疲勞度越低，打工收入就越高。-lt",
			 @"0-lt-我-由於每一天都有５００圓的必要花費。如果錢花光的話，就沒辦法維持生活了。-lt",
			 @"1-0-祐莉-既然我住在你這裡，那麼家裡的伙食費用就由我來負責吧。-lt",
			 @"1-lt-我-真的嗎？那太好了。-lt",
			 @"1-lt-我-對了，記得你是攻讀時裝設計的吧？你不是得經常到街上去收集流行情報嗎？-lt",
			 @"1-lt-祐莉-是啊。這對我的學業有很重要的影響呢。-lt",
			 @"1-lt-我-所以，選擇『逛街』的話，我會陪妳到市區的流行街收集流行情報。-lt",
			 @"1-face02002-祐莉-太好了，這樣對提升我的美感度有很大幫助呢！-lt",
			 @"1-lt-0-關於選擇『論文』-lt",
			 @"1-lt-我-由於我也是在準備畢業論文的階段，因此也必須花點時間來寫論文才行。-lt",
			 @"1-0-祐莉-嗯嗯。看來我們兩個都處於學業的重要階段呢。-lt",
			 @"1-lt-我-哦？怎麼說呢？-lt",
			 @"1-0-祐莉-因為我這個月也得參加學系的設計徵選。如果能在徵選獲得好的名次，就有機會進入一流公司。這對我而言是很難得的機會。-lt",
			 @"1-lt-我-真的嗎？那我們兩個都要好好加油囉！-lt",
			 @"1-face02002-祐莉-嗯！-lt",
			 @"1-lt-我-如果疲勞度太高的話，就可以選擇『休息』。-lt",
			 @"1-face02003-祐莉-那就讓我做些好吃的給你吃吧！我的手藝還不錯哦！-lt",
			 @"1-lt-我-哇，那太好了！我很期待哦！-lt",
			 @"1-face02009-祐莉-剛剛講到的『疲勞度』到底是什麼呢？-lt",
			 @"1-lt-我-顧名思義，就是指我的疲勞狀況。基本上我所選擇的行動，獲得結果都會受到疲勞度所影響。-lt",
			 @"1-lt-我-而每一天執行的行動，除了『休息』之外，都會增加一些疲勞度。-lt",
			 @"1-lt-我-每一天睡醒時，疲勞度都會降低一定程度。但是如果疲勞度累積太多的話，即使睡醒也無法完全回復。-lt",
			 @"1-face02005-祐莉-原來如此。那麼，每天早上我也幫忙留意你的疲勞狀況吧！-lt",
			 @"0-0-0-【遊戲解說】\n關於遊戲解說的部分就到此為止。遊戲將正式開始。-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, array1dialog, array2story, array3story, nil];
		}
		case 19: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-0-0",
			 @"2-0-0-出浴事件-0",
			 @"0-lt-0-就這樣，我們花了一些時間，總算把祐莉的行李都整理好。-bgm004",
			 @"1-face02009-祐莉-呼～總算完成了。-lt",
			 @"1-face02002-祐莉-達令，謝謝你幫我！-lt",
			 @"1-lt-我-哪裡，今天是妳搬來的日子，我可是很高興的呢。-lt",
			 @"1-face02009-祐莉-呼～流了滿身汗，那我先去洗澡哦！-lt",
			 @"0-0-0-祐莉開心地拿著浴巾，準備要進浴室洗澡。這時，她突然轉過身來對著我說。-lt",
			 @"1-face02005-祐莉-……達令，你不會偷看吧？-lt",
			 @"1-lt-我-我……我才不會做這種事！-lt",
			 @"1-face02002-祐莉-嘻嘻，我知道你不是那種人，我相信你！-lt",
			 @"0-0-0-祐莉說完，便進了浴室，而我則回到自己的房間。-lt",
			 @"end-1",
			 nil];
			NSArray *array1story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-scene_room-bgm004-0",
			 @"0-0-0-虽然說我們已經是男女朋友的關係了，但是這時候又讓我感覺，我們的關係似乎沒有那麼的親密。-lt",
			 @"0-0-0-交往至今２個禮拜了，雖然祐莉用達令來稱呼我，不過……目前的進展也只不過是牽牽手而已。-lt",
			 @"0-0-0-是的，就連接吻這種男女朋友間再自然不過的行為，也都沒有發生過。-lt",
			 @"0-0-0-儘管…我們現在已經同住一個屋簷下，但是對於“男女朋友”這層關係，卻沒有什麼實際感。-lt",
			 @"0-0-0-话說回來……面對祐莉這種大美女在自己家裡沖澡的場面，我腦中不由得出現許多妄想的畫面。-lt",
			 @"0-0-祐莉-啊啊！！！-lt",
			 @"0-0-0-祐莉突然在浴室裡大叫。-lt",
			 @"0-0-我-怎麼啦！？發生什麼事了？-lt",
			 @"0-0-祐莉-……我忘了把換洗的衣物拿進去了！-lt",
			 @"0-0-我-那…那怎麼辦？……要我幫你拿嗎？-lt",
			 @"0-0-祐莉-不、不用了！我、我自己拿好了！-lt",
			 @"0-0-我-那、那麼……-lt",
			 @"0-0-祐莉-達令，我自己回房間拿，你先回你房間，不要偷看哦！-lt",
			 @"0-0-我-哦、哦……-lt",
			 @"0-0-0-雖然嘴巴上這麼說，但是要我別偷看，這簡直違背生物本能！-lt",
			 @"end-2",
			 nil];
			NSArray *array2dialog =
			[NSArray arrayWithObjects:
			 @"dialogb-這下我該怎麼辦……",
			 @"乖乖地躲在房間-3",
			 @"從房間門縫偷看-4",
			 nil];
			NSArray *array3story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-bgm004-10",
			 @"0-0-0-虽然說心裡真的很想看看祐莉出浴後的樣子，但是…我畢竟是個紳士！答應女士的事情就要做到。-lt",
			 @"0-0-0-我想祐莉也是因為我的為人正直，才肯跟我在一起吧！……我自己是這樣想的。-lt",
			 @"0-0-0-不過，誰知道呢？-lt",
			 @"0-0-0-就在自己還胡思亂想的當下，祐莉已經換好衣服，走出浴室了。-lt",
			 @"0-0-祐莉-達令！我洗好了，你可以出來了！-lt",
			 @"0-0-0-我走出房門，看到的是祐莉笑嘻嘻的表情。-lt",
			 @"1-face02002-祐莉-達令果然很老實，真的沒有偷看呢！-lt",
			 @"1-lt-我-我本來就不會做那種事！我答應過妳的！-lt",
			 @"1-face02005-祐莉-嗯嗯。我就是欣賞達令你這一點！-lt",
			 @"1-lt-0-祐莉的好感度提高了！-lt",
			 @"end-end",
			 nil];
			NSArray *array4story =
			[NSArray arrayWithObjects:
			 @"storyb-face01005-test_home-0-0",
			 @"0-0-0-我終究還是抵擋不了好奇心，決定把門縫偷偷打開一點。畢竟，祐莉的出浴姿態，光是想像就夠撩人了。-lt",
			 @"0-0-0-我輕輕地把門推開一點點，只留一個小縫隙。從這縫隙裡偷偷地往浴室方向看。-lt",
			 @"1-face02007-0-这時只見到全身濕淋淋的祐莉，身上只裹著浴巾，躡手躡腳地回到房間。-bgm007",
			 @"1-lt-0-不一會兒，又拿著換洗的衣物，回到浴室前面。-lt",
			 @"1-lt-0-這時候，祐莉突然機警地看著我的房門。-lt",
			 @"1-lt-祐莉-……。-lt",
			 @"1-lt-0-祐莉靜靜地停在浴室門口，看著我的房門。不過，祐莉沒有多說什麼，又默默地回到浴室裡面。-lt",
			 @"0-0-0-糟糕……她是不是發現了？祐莉的沈默讓我感到有點擔心。-lt",
			 @"0-lt-0-過一會兒，祐莉終於洗完澡，走出了浴室。-lt",
			 @"end-5",
			 nil];
			NSArray *array5story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-bgm007-90",
			 @"1-face02013-祐莉-……達令，你剛剛偷看了吧！-lt",
			 @"1-lt-我-呃……這個……-lt",
			 @"1-lt-0-祐莉果然還是發現了。這時，還是老實地承認比較好吧。-lt",
			 @"1-lt-我-對、對不起！我沒有惡意！-lt",
			 @"1-face02011-祐莉-……沒辦法，我自己忘了拿衣服，我自己也不對。-lt",
			 @"1-lt-0-祐莉的好感度降低了！-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, array1story, array2dialog, array3story,array4story,array5story, nil];
		}
		case 39: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-0-0",
			 @"2-0-0-祐莉的過去-0",
			 @"0-lt-0-話說…祐莉為什麼會想到要搬來跟我一起住呢？-bgm004",
			 @"0-lt-0-這個疑問，其實從當初祐莉說出要跟我交往，並且要同居以來，就一直存在我腦海裡。-lt",
			 @"0-lt-0-不過，想要把這個疑問解開，可不是那麼容易的。至少我這麼認為。-lt",
			 @"0-lt-0-雖然說我跟祐莉已經同住，這樣的事實已經發生了。-lt",
			 @"0-lt-0-不過這畢竟不是我大膽、努力地歷經追求所得來的結果，感覺上完全不踏實。-lt",
			 @"0-lt-0-對男人來說，若心頭一直存在著這樣的疑問，是否也會影響到自己對對方付出的心意呢？-lt",
			 @"0-lt-0-我想，對我來說答案是肯定的。於是，我還是決定一探究竟。-lt",
			 @"1-0-我-祐莉……可以……問妳一件事嗎？-bgm010",
			 @"1-face02009-祐莉-哦？是什麼事啊？-lt",
			 @"1-lt-我-記得……前陣子才聽妳說過，妳還有跟一個男生在交往不是嗎？-lt",
			 @"1-face02005-祐莉-嗯……那是前陣子的事了。不過，我現在已經跟你在一起了，不是嗎？-lt",
			 @"1-lt-我-是、是啊。不過，為什麼……。-lt",
			 @"1-face02007-祐莉-…………。-lt",
			 @"1-lt-0-祐莉沈默了一會兒，沒有說話。表情看起來似乎有點複雜。-lt",
			 @"1-lt-我-呃……我……是不是問了不該問的事？如果妳不想回答的話，可以不用說……-lt",
			 @"1-lt-祐莉-嗯……。對不起，現在我還不想談這件事……。-lt",
			 @"1-lt-我-說、說得也是呢。真是的，我到底在想什麼啊，哈哈……。-lt",
			 @"1-face02005-祐莉-沒關係，不是達令的錯。來，達令，陪我看電視吧！-lt",
			 @"1-lt-0-祐莉又若無其事地，拉著我陪她看電視。-lt",
			 @"1-lt-0-看來，祐莉跟那個男生，似乎發生過什麼事。不過，現在似乎還沒辦法得知，也只好暫且放下了。-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, nil];
		}
		case 69: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-0-10",
			 @"2-0-0-用功的祐莉-0",
			 @"0-lt-我-祐莉，休息一下，喝點湯吧！-bgm004",
			 @"1-face02006-祐莉-啊！這個是……？-lt",
			 @"1-lt-我-我用冰箱裡的東西做的，不是什麼豪華的菜色，不過可以多少補充一點營養哦！-lt",
			 @"1-0-祐莉-嗯，我嚐嚐看！-lt",
			 @"1-lt-0-祐莉輕輕地嚐了一小口。-lt",
			 @"1-face02002-祐莉-嗯嗯，味道很清淡，很好喝呢！-lt",
			 @"1-lt-我-我想你們女生應該都不敢吃宵夜的吧！不過看妳這麼勞累，還是該給妳補充點營養才行。-lt",
			 @"1-lt-我-所以我口味做得比較清淡一點，不過都是很營養的哦！-lt",
			 @"1-face02008-祐莉-達令……-lt",
			 @"1-lt-我-……怎麼啦？不好吃嗎？-lt",
			 @"1-lt-祐莉-不……。達令，你是第一個做菜給我吃的人呢！-lt",
			 @"1-lt-我-是真的嗎？-lt",
			 @"1-face02005-祐莉-因為之前我交往的男生都是公子哥，幾乎都不進廚房的呢！-lt",
			 @"1-lt-我-是嗎？我也不太會做菜，我只是擔心你太勞累，想給妳補充一點營養……-lt",
			 @"1-face02002-祐莉-嗯！所以我覺得很高興！我會把它都吃光光！-lt",
			 @"1-lt-0-祐莉看起來真的很高興，而且一滴不剩地把我做的湯都喝完。-lt",
			 @"1-lt-0-祐莉的好感度上升了！-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, nil];
		}
		case 70: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-test_home-0-0",
			 @"2-0-0-電影約會-0",
			 @"0-lt-0-今天是週日。說到假日，少不了的就是約會了。-bgm002",
			 @"0-lt-0-雖然以前跟祐莉也偶爾約會，不過都只是去看電影而已。-lt",
			 @"0-lt-0-每一次想約她去別的地方，尤其是比較有情調的地方，往往都被她迴避掉了。-lt",
			 @"0-lt-0-然而，現在情況不一樣了。我們已經是男女朋友的關係了。-lt",
			 @"0-lt-我-所以……現在，可以光明正大地跟祐莉約會了！-lt",
			 @"1-face02009-祐莉-…你怎麼一個人在自言自語啊？-lt",
			 @"1-lt-我-咦！？妳什麼時候在的…！？-lt",
			 @"1-face02005-祐莉-……從男女朋友的關係那裡…-lt",
			 @"1-lt-我-呃……是這樣啊……-lt",
			 @"1-0-祐莉-其實，我也正想要問你……今天是禮拜天，我們要不要出去走走？-lt",
			 @"1-lt-我-嗯嗯，我正是這麼想的。妳有想要去什麼地方嗎？-lt",
			 @"1-face02003-祐莉-……我想去看電影！-lt",
			 @"1-lt-我-啊！？看電影？-lt",
			 @"1-face02009-祐莉-嗯嗯。不想跟我去看電影嗎？-lt",
			 @"1-lt-我-想、想啊！當然想！……那妳想看哪一部？-lt",
			 @"1-face02013-祐莉-哪一部都好，人家就是想看電影嘛！-lt",
			 @"1-lt-我-好、好吧。那我們準備一下，等會就出門吧！-lt",
			 @"1-face02003-祐莉-嗯嗯！那我去化妝換衣服囉！-lt",
			 @"end-1",
			 nil];
			NSArray *array1story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-frame320-0-0",
			 @"0-lt-0-我等待祐莉換好衣服、化好妝，準備出門時，已經是一個半小時後的事了。-lt",
			 @"0-lt-0-不過跟以往事先說好要看哪一部，並且約在電影院碰面的情況不同。-lt",
			 @"0-lt-0-這次祐莉挽著我的手，甜甜秘密地一起搭車、一起走到電影院。-lt",
			 @"0-lt-0-這樣才真的有在約會的感覺啊！-lt",
			 @"end-2",
			 nil];
			NSArray *array2story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-scene_cinema-bgm009-0",
			 @"0-lt-0-我們來到了電影院後，看到上映的許多片子，一時之間不知道該怎麼選擇。-lt",
			 @"0-lt-0-今天首輪的片子有三部。-lt",
			 @"0-lt-0-分別是知名遊戲改編的古裝神怪動作鉅片『蒼神錄』，是有不少大卡司明星演出的強片。-lt",
			 @"0-lt-0-還有講述一對男女同住一個屋簷下所發生的愛情喜劇『同居翹情人』。-lt",
			 @"0-lt-0-『同居翹情人』……怎麼這部片感覺跟我的處境很像？-lt",
			 @"0-lt-0-以及描述校園裡連續發生血案的恐怖電影『祭首』。血腥場面與恐怖氣氛一度引起話題。-lt",
			 @"1-face02009-祐莉-嗯……到底要看哪一部片呢？-lt",
			 @"end-3",
			 nil];
			NSArray *array3dialog =
			[NSArray arrayWithObjects:
			 @"dialogw-看哪一部片呢？",
			 @"蒼神錄-4",
			 @"祭首-5",
			 @"同居翹情人-6",
			 nil];
			NSArray *array4story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-scene_cinema-bgm009-0",
			 @"1-lt-我-那麼…我們看『蒼神錄』好嗎？這部有很多大卡司演出……-lt",
			 @"1-face02002-祐莉-嗯，好啊！-lt",
			 @"1-lt-0-我跟祐莉買了票，再買了些爆米花與飲料後，便進場觀賞。-lt",
			 @"end-7",
			 nil];
			NSArray *array5story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-scene_cinema-bgm009-0",
			 @"1-lt-我-那麼，我們看『祭首』好不好？聽說這部片很恐怖哦！-lt",
			 @"1-face02010-祐莉-這樣啊……好啊！-lt",
			 @"1-lt-0-我跟祐莉買了票，再買了些爆米花與飲料後，便進場觀賞。-lt",
			 @"end-8",
			 nil];
			NSArray *array6story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-scene_cinema-bgm009-0",
			 @"1-lt-我-那麼…我們看『同居翹情人』好嗎？看起來應該是滿有意思的愛情喜劇…-lt",
			 @"1-face02002-祐莉-嗯……嗯嗯。好啊！-lt",
			 @"1-lt-0-我跟祐莉買了票，再買了些爆米花與飲料後，便進場觀賞。-lt",
			 @"end-9",
			 nil];
			NSArray *array7story =
			[NSArray arrayWithObjects:
			 @"storyb-face01001-scene_cinema1-0-0",
			 @"0-0-戰廷雲-哥哥！？你是哥哥嗎！？-lt",
			 @"0-0-蘇芷嫣-廷雲！小心他的崙吾劍啊！-lt",
			 @"0-0-戰廷羿-太遲了！看我的～沈霞！-lt",
			 @"0-0-0-轟隆隆隆！！-lt",
			 @"0-0-0-電影在激烈的打鬥與感人的劇情中完結，是一部相當精彩的動作片。-lt",
			 @"end-10",
			 nil];
			NSArray *array8story =
			[NSArray arrayWithObjects:
			 @"storyb-face01001-scene_cinema3-0-0",
			 @"0-0-0-「磅！」地一聲，一具穿著染著鮮血制服的屍體頭下腳上的倒吊在出口，-lt",
			 @"0-0-0-離張晴的臉不到三公分…-lt",
			 @"0-0-0-沾滿鮮血的眼睛，仇恨地緊盯著張晴…-lt",
			 @"0-0-張晴-啊啊啊啊啊！！-lt",
			 @"0-0-0-電影內容真的很恐怖，不管是拍攝手法或音效、氣氛，都令人毛骨悚然。-lt",
			 @"0-0-0-通常，女生們遇到這種恐怖場面時，都會不由自主地尖叫，然後緊緊抱著旁邊的男生…-lt",
			 @"0-0-祐莉-………-lt",
			 @"0-0-0-不過我身旁的祐莉，似乎一點反應也沒有。她就這樣從頭到尾安靜地看完整部片。-lt",
			 @"end-11",
			 nil];
			NSArray *array9story =
			[NSArray arrayWithObjects:
			 @"storyb-face01005-test_home-0-0",
			 @"1-0-祐理-我想……我們是不是可以開始當……男女朋友？-lt",
			 @"1-lt-我-哈…哈哈……，妳…妳這麼說……我還真不知道該怎麼辦……-lt",
			 @"1-lt-祐理-你總是在我最需要幫助的時候，不經意的陪伴我…-lt",
			 @"1-lt-祐理-你答應嗎？我的請求……-lt",
			 @"0-0-0-電影裡面演出的情節簡直就是我倆的翻版。-lt",
			 @"0-0-0-不同的是……裡面有不少激情養眼的情節。看來這個男主角比我厲害多了！-lt",
			 @"0-0-0-只是……看到這樣的情節，祐莉會有怎樣的感想或反應呢？-lt",
			 @"0-0-0-我悄悄轉過頭去，試圖偷看祐莉的表情。-lt",
			 @"0-0-祐莉-………-lt",
			 @"0-0-0-祐莉突然緊緊地握著我的手。這在以往跟她看電影的時候，是從來沒發生過的。-lt",
			 @"0-0-0-看起來，祐莉應該相當融入電影裡的情節吧！-lt",
			 @"end-12",
			 nil];
			NSArray *array10story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-scene_cinema-bgm009-0",
			 @"1-face02003-祐莉-哇～真精彩，看得好過癮！-lt",
			 @"1-lt-我-嗯，是啊！不愧是知名手機遊戲改編的電影，真是好看呢！-lt",
			 @"1-face02005-祐莉-最後，女主角還是跟她喜歡的人在一起了。還是這樣的結局比較好！-lt",
			 @"1-face02008-祐莉-要是……我是那個女主角的話……-lt",
			 @"1-lt-我-如果妳是那個女主角的話…會怎樣呢？-lt",
			 @"1-face02010-祐莉-……沒什麼啦。你可別亂想哦！-lt",
			 @"1-lt-我-哦、哦哦……-lt",
			 @"1-face02003-祐莉-走吧！我們去吃點東西！-lt",
			 @"end-end",
			 nil];
			NSArray *array11story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-scene_cinema-bgm009-0",
			 @"0-0-0-電影最後，在一個令人頭皮發麻的結局下結束了。-lt",
			 @"0-0-我-今天這部片還真是恐怖呢！-lt",
			 @"1-face02010-祐莉-……嗯。-lt",
			 @"1-lt-我-妳看起來好像……還好嘛！難道，這種程度的恐怖片也嚇不倒妳嗎？-lt",
			 @"1-face02007-祐莉-我……其實不太敢看恐怖片……-lt",
			 @"1-lt-我-那、那妳剛才……-lt",
			 @"1-lt-祐莉-雖然我…從頭到尾都一直張大著眼睛……-lt",
			 @"1-lt-祐莉-可是其實我根本沒有在看螢幕，只是盯著其他地方，根本不敢看電影在演什麼……-lt",
			 @"1-lt-我-原來如此……。對不起，我竟然不知道妳不敢看……-lt",
			 @"1-face02005-祐莉-沒關係的。其實，只要能跟你一起看電影，就很愉快了！-lt",
			 @"1-lt-祐莉-走吧！我們去吃點東西！-lt",
			 @"1-lt-我-哦、哦哦！-lt",
			 @"end-end",
			 nil];
			NSArray *array12story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-scene_cinema-bgm009-0",
			 @"0-0-0-電影到最後，結局當然是皆大歡喜，男女主角最後也共步紅毯，可說是相當好看的一部片。-lt",
			 @"0-0-我-祐莉……今天這部片好看嗎？-lt",
			 @"1-face02008-祐莉-……嗯…嗯嗯，好看……-lt",
			 @"1-lt-0-祐莉的神情似乎有點複雜，而且看起來有些害羞。-lt",
			 @"1-lt-我-跟、跟我們兩個好像滿相像的嘛……-lt",
			 @"1-face02005-祐莉-………是有點像…。不過……-lt",
			 @"1-lt-我-嗯？-lt",
			 @"1-face02011-祐莉-達令……你在想色色的事對吧？-lt",
			 @"1-lt-我-呃…這、這個……-lt",
			 @"end-13",
			 nil];
			NSArray *array13dialog =
			[NSArray arrayWithObjects:
			@"dialogw-我應該怎麽說？",
			 @"妳誤會了-14",
			 @"的確……-15",
			 nil];
			NSArray *array14story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-scene_cinema-bgm009-0",
			 @"1-face02011-我-妳、妳誤會了！只是想到情境有點像而已，沒別的意思……-lt",
			 @"1-face02005-祐莉-……真的嗎？-lt",
			 @"1-lt-我-是真的！-lt",
			 @"1-face02002-祐莉-嘻嘻，我相信你。我想達令不是那種人的。-lt",
			 @"1-lt-0-……不，我就是那種人！只是，不能說出口而已！-lt",
			 @"1-face02005-祐莉-……如果…那一天到來的話……-lt",
			 @"1-lt-我-啊？妳剛剛說什麼？-lt",
			 @"1-face02003-祐莉-沒、沒事的！我們去吃飯吧！我肚子餓了！-lt",
			 @"1-lt-我-哦、哦哦！-lt",
			 @"end-end",
			 nil];
			NSArray *array15story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-scene_cinema-bgm009-10",
			 @"1-face02011-我-的確……是有想過啦！-lt",
			 @"1-lt-祐莉-哼……我就知道！-lt",
			 @"1-lt-我-祐莉！-lt",
			 @"1-lt-0-我突然一臉正經地抓住祐莉的肩膀，對著她說。-lt",
			 @"1-face02006-祐莉-什、什麼！？-lt",
			 @"1-lt-我-我……也是個正常的男人！我如果說不想，那是騙人的！-lt",
			 @"1-lt-祐莉-哦、哦哦……-lt",
			 @"1-lt-我-我很喜歡妳！所以我不想騙妳！-lt",
			 @"1-face02007-祐莉-但、但是……我現在還……-lt",
			 @"1-lt-0-她臉上的表情已經說明了，她現在還沒有那個意願。-lt",
			 @"1-lt-我-……沒關係的。這種事……絕不能勉強的。-lt",
			 @"1-lt-祐莉-嗯……嗯嗯……。對、對不起！-lt",
			 @"1-lt-我-沒關係，別提這件事了。走吧！我們去吃點好吃的！-lt",
			 @"1-face02005-祐莉-嗯嗯！-lt",
			 @"1-face02008-祐莉-……如果…那一天到來的話……-lt",
			 @"1-lt-我-啊？妳剛剛說什麼？-lt",
			 @"1-face02002-祐莉-沒、沒事的！我們去吃飯吧！我肚子餓了！-lt",
			 @"1-lt-我-哦、哦哦！-lt",
			 @"1-lt-0-祐莉的好感度上升了！-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, array1story,array2story,array3dialog,array4story,array5story,array6story,array7story,array8story,array9story,array10story,array11story, array12story,array13dialog,array14story,array15story,nil];
		}
		case 119: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-0-0",
			 @"2-0-0-跌倒-0",
			 @"0-lt-0-我走到祐莉房間，正巧看到祐莉正拿著紙箱站在椅子上，似乎打算把箱子放到櫃子上頭。-bgm004",
			 @"0-lt-0-不過因為祐莉的椅子是有輪子的辦公椅，站在上面搖搖晃晃，相當危險。-lt",
			 @"0-lt-我-咦？祐莉，妳在幹嘛？爬到那麼高的地方，很危險的！-lt",
			 @"1-0-祐莉-啊，達令！沒有啦，我只是想把整理好裝箱的雜物，放到櫃子上頭……-lt",
			 @"1-lt-我-妳這樣站在椅子上很危險的，快點下來，我幫妳放吧！-lt",
			 @"1-face02005-祐莉-好、好吧！-lt",
			 @"1-lt-0-祐莉小心地慢慢從椅子上爬下來。-lt",
			 @"1-face02009-祐莉-達令，那就麻煩你了。你也要小心哦！-lt",
			 @"1-lt-我-知道了，交給我吧！那也麻煩你幫我把椅子扶好哦！-lt",
			 @"1-lt-0-我站上椅子，小心翼翼地把祐莉的東西放上櫃子。-lt",
			 @"1-lt-我-呼～，這樣就可以了。-lt",
			 @"1-face02003-祐莉-謝謝達令！-lt",
			 @"1-lt-0-祐莉開心地向我道謝，沒想到她就這樣把雙手放開。-lt",
			 @"1-lt-我-哪裡……哦哦！-0",
			 @"0-0-0-失去重心的我突然從椅子上摔下來，後腦杓就不偏不倚地撞到桌子。-lt",
			 @"0-0-祐莉-達令！-lt",
			 @"0-0-0-…………-lt",
			 @"0-0-0-…………………………-lt",
			 @"0-0-0-……令……-lt",
			 @"0-0-0-……達令……-lt",
			 @"0-0-0-達令！-lt",
			 @"0-0-我-唔唔……。-lt",
			 @"0-0-祐莉-達令！醒醒啊！-lt",
			 @"0-0-我-唔……好痛……-lt",
			 @"0-0-祐莉-達令！太好了，你終於醒過來了！-lt",
			 @"0-0-我-！-lt",
			 @"end-1",
			 nil];
			NSArray *array1story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-hurt-bgm010-10",
			 @"3-0-0-我醒來時，發現自己躺在地板，頭則是靠在祐莉的大腿上。祐莉一副擔心的表情，一直望著我。-lt",
			 @"3-0-我-剛剛……發生什麼事了……？-lt",
			 @"3-0-祐莉-剛剛你從椅子上摔下來以後，就突然昏了過去呢！-lt",
			 @"3-0-祐莉-達令……對不起！都是我不小心，害你受了傷……-lt",
			 @"3-0-我-哪裡……有沒有撞到妳？妳沒事吧？-lt",
			 @"3-0-祐莉-我沒事的！達令真是的，自己都昏了過去，還在擔心我……-lt",
			 @"3-0-我-因為……妳是我最重要的人啊！-lt",
			 @"3-0-祐莉-傻瓜……-lt",
			 @"3-0-我-不過，我滿意外的…以前妳一有什麼事情，都會叫別人幫忙的…現在妳也會自己動手啊！-lt",
			 @"3-0-祐莉-我、我也不能老是依賴別人啊！這、這樣下去的話…-lt",
			 @"3-0-我-？-lt",
			 @"3-0-祐莉-沒、沒什麼啦……-lt",
			 @"3-0-我-祐莉……像這樣躺在妳懷裡，感覺真溫暖……-lt",
			 @"3-0-祐莉-達令……-lt",
			 @"3-0-我-可以……繼續再讓我躺一下嗎？-lt",
			 @"3-0-祐莉-嗯嗯……是達令的話……就可以的……-lt",
			 @"3-0-0-我就這樣，任性地躺在祐莉的大腿上，繼續享受這溫柔的時光。-lt",
			 @"3-0-0-祐莉的好感度提升了！-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, array1story, nil];
		}
		case 159: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-0-0",
			 @"2-0-0-祐莉的過去2-0",
			 @"1-face02003-祐莉-達令，我做了幾樣菜，不曉得你喜不喜歡，嚐嚐看吧？-bgm004",
			 @"1-lt-我-真的嗎？太好了。-lt",
			 @"1-lt-0-我跟祐莉坐在餐桌前，開心地享用著祐莉親手做的佳餚。-lt",
			 @"1-lt-0-這時候，祐莉的手機突然響了起來。不過，發出的鈴聲並不是平常聽到的那首鈴聲。-lt",
			 @"1-face02007-祐莉-…………。-lt",
			 @"1-lt-0-祐莉拿起手機後，看了看螢幕，又不發一語地把手機上的來電給切掉了。-lt",
			 @"1-lt-我-……不是妳的電話嗎？為什麼不接呢？-lt",
			 @"1-lt-祐莉-……不接…也沒關係。-lt",
			 @"1-lt-我-……是以前的男朋友打來的嗎？-lt",
			 @"1-face02006-祐莉-……你……為什麼知道？-lt",
			 @"1-lt-我-這個嘛……我能聯想到的只有這個了。-lt",
			 @"1-face02007-祐莉-嗯……。-lt",
			 @"1-lt-0-這時候，同樣的鈴聲又再度想起。想必是剛剛的人又打來了。-lt",
			 @"1-lt-我-如果妳想接的話，可以在妳的房間裡接。我……沒關係的。-lt",
			 @"1-lt-祐莉-不……我不想接那個人的電話……-lt",
			 @"1-lt-我-是因為現在跟我交往的關係嗎？-lt",
			 @"1-lt-祐莉-……嗯嗯。其實，我老實跟你說好了。現在打來的人，是很久以前交往過的男生。-lt",
			 @"1-lt-我-……該不會是以前隔壁班的男生吧？那已經是很久以前的事了吧？-lt",
			 @"1-face02006-祐莉-……沒想到真的給你猜中了！的確是他沒錯。-lt",
			 @"1-lt-我-妳還有在跟他來往嗎？-lt",
			 @"1-face02005-祐莉-不……幾年前分手後就沒再見過面了。只是，偶爾會再打電話來說說話而已。-lt",
			 @"1-lt-我-哈哈，祐莉妳可真是有異性緣啊。從以前，妳就一直是許多男生暗戀或追求的對象呢！-lt",
			 @"1-face02007-祐莉-這點我知道……可是……這也不全然是好事……-lt",
			 @"1-lt-我-哦？可是因為很多男生都會對妳獻殷勤，有多時候都很方便不是嗎？-lt",
			 @"1-lt-祐莉-的確是這樣啦……不過，也因為這樣的關係，大家反而都忽略了很重要的事……-lt",
			 @"1-lt-我-重要的事？是什麼呢？-lt",
			 @"1-face02005-祐莉-嗯……，這件事……暫且先不告訴你。-lt",
			 @"1-lt-我-………。-lt",
			 @"1-lt-祐莉-不過，達令有他們所沒有的優點，這一點，是我決定想跟你在一起的原因哦！-lt",
			 @"1-lt-我-他們所沒有的…優點？-lt",
			 @"1-face02002-祐莉-所以，請達令要對自己更有自信哦！-lt",
			 @"1-lt-我-……嗯嗯。-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, nil];
		}
		case 209: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-bgm004-0",
			 @"2-0-0-出浴事件2-0",
			 @"0-0-0-這天晚上，我跟祐莉兩人在家裡一起打掃。-lt",
			 @"1-face02009-祐莉-呼～好熱，流了滿身大汗呢！-lt",
			 @"1-lt-我-剩下的工作我來就好，妳先去洗澡吧！-lt",
			 @"0-0-0-祐莉說完，便開心地帶著換洗衣物進浴室洗澡了。-lt",
			 @"0-0-0-我則把剩下的一點打掃工作完成後，出門到附近的餐館買了簡單的晚餐。-lt",
			 @"0-0-0-回到家後，我在餐桌上把買回來的晚餐一一擺好，正打算去祐莉房間叫她時……-lt",
			 @"end-1",
			 nil];
			NSArray *array1story =
			[NSArray arrayWithObjects:
			 @"storyb-face01005-test_home-bgm007-10",
			 @"1-face02007-祐莉-啊！達令！-lt",
			 @"1-lt-我-啊！祐、祐莉！？-lt",
			 @"1-lt-0-只見祐莉身上只圍著一條浴巾，打算偷偷摸摸地從浴室回到她房間。-lt",
			 @"1-lt-祐莉-達令……你這麼快就回來啦？-lt",
			 @"1-lt-我-是、是啊。-lt",
			 @"1-lt-0-心裡完全沒有準備會碰上這種場面，讓我一時之間有點尷尬，不知道該說什麼。-lt",
			 @"1-0-祐莉-那麼……達令，等我一下，我穿好衣服就一起吃吧！-lt",
			 @"1-lt-我-哦、哦哦！-lt",
			 @"0-0-0-祐莉洗完澡後只圍條浴巾的樣子真是太性感了。也讓我心中開始無限遐想她浴巾底下的樣子。-lt",
			 @"0-0-0-不過……剛剛的祐莉，似乎並不是那麼的驚訝。-lt",
			 @"0-0-0-是否……她已經不會介意讓我見到她這樣子的姿態呢？或許真是這樣也說不定。-lt",
			 @"0-0-0-感覺最近的祐莉，在我身邊似乎更放得開、更沒有距離了。-lt",
			 @"0-0-0-不管如何，心裡感覺都相當不錯。-lt",
			 @"0-0-0-祐莉的好感度提升了！-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, array1story, nil];
		}
		case 239: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-bgm004-0",
			 @"2-0-0-生理期的祐莉-0",
			 @"0-0-我-祐莉～我回來了！-lt",
			 @"0-0-0-剛剛出門去辦一點事，花了我兩個多小時。因此，一忙完便迫不及待地趕回家。-lt",
			 @"0-0-0-回到家的我，一如往常地期待祐莉以她甜美的聲音迎接我。-lt",
			 @"0-0-0-不過，現在卻沒有聽到她的聲音。-lt",
			 @"0-0-我-祐莉……出去了嗎？-lt",
			 @"0-0-0-我走到她的房間門口一看，發現祐莉正躺在床上。-lt",
			 @"end-1",
			 nil];
			NSArray *array1story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-sleep1-bgm015-0",
			 @"3-0-我-祐莉…妳怎麼了？-lt",
			 @"3-0-祐莉-嗯嗯…突然覺得很不舒服…-lt",
			 @"3-0-我-不舒服？感冒了嗎……？-lt",
			 @"3-0-祐莉-……是……肚子痛……-lt",
			 @"3-0-我-肚子痛…？-lt",
			 @"3-0-我-妳去看過醫生了嗎？-lt",
			 @"3-0-祐莉-不…不用看醫生……-lt",
			 @"3-0-我-可是…看妳的樣子好像很嚴重啊！不看醫生的話……-lt",
			 @"3-0-0-祐莉臉色蒼白，表情十分痛苦，臉上滿是汗珠。-lt",
			 @"3-0-我-除了肚子痛之外，還有哪裡不舒服嗎？-lt",
			 @"3-0-祐莉-頭……會暈，也沒有力氣，站不起來……-lt",
			 @"3-0-0-這時，我突然想到，這種情形該不會是……-lt",
			 @"3-0-我-祐莉……妳是…生理痛嗎？-lt",
			 @"3-0-祐莉-……嗯嗯。-lt",
			 @"3-0-0-我還是第一次碰到，女生的生理痛像祐莉這麼嚴重的。-lt",
			 @"3-0-我-不行…這樣下去不是辦法……。祐莉，我還是帶妳去看醫生吧！-lt",
			 @"3-0-祐莉-不、不用了……而且我也沒辦法走路……-lt",
			 @"3-0-祐莉-我、我想………只要休息一下…就好了……-lt",
			 @"3-0-0-祐莉有氣無力地說著，很明顯是在逞強。-lt",
			 @"3-0-我-沒關係，我背妳去！-lt",
			 @"3-0-祐莉-可、可是……這樣太麻煩你了……-lt",
			 @"3-0-我-說這是什麼話，連妳生病都照顧不了，我還算是妳男朋友嗎？-lt",
			 @"3-0-祐莉-達令……-lt",
			 @"3-0-我-來……我扶妳起來吧！-lt",
			 @"end-2",
			 nil];
			NSArray *array2story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-bgm015-0",
			 @"0-0-0-我把祐莉從床上攙扶起來，讓全身無力的她趴在我背後。-lt",
			 @"0-0-我-好了，把手抱著。如果還有哪裡不舒服的話要跟我說哦！-lt",
			 @"0-0-0-我抓住祐莉的兩腿，一個使勁地把她背了起來。-lt",
			 @"0-0-0-纖瘦的祐莉背起來其實很輕鬆，但是現在心裡的感覺卻很沈重。-lt",
			 @"0-0-0-雖然背後可以清楚感覺到祐莉胸部的柔軟觸感，但此時可沒心情去胡思亂想。-lt",
			 @"0-0-0-身上碰到祐莉的每一吋肌膚，都是冷汗傳來的冰冷感。-lt",
			 @"0-0-0-由於平日上學、工作都是搭車，因此我沒有自己的代步工具。-lt",
			 @"0-0-0-看了看現在的時間，已經是晚上十點多，診所與藥局大多已經關門了。-lt",
			 @"0-0-0-我也不知道有機會就醫的地方多不多，情急之下趕緊先到附近的診所看看。-lt",
			 @"end-3",
			 nil];
			NSArray *array3story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-act_04-bgm015-0",
			 @"0-0-0-我背著祐莉跑到附近兩條街距離的一家診所，正如我所預料，診所已經關門休診了。-lt",
			 @"0-0-0-我上前按了電鈴，但是按了許久都沒有人回應。-lt",
			 @"0-0-我-祐莉……對不起，這家診所休息了。妳再忍耐一下，我再找另一家！-lt",
			 @"1-face02007-祐莉-嗯……嗯嗯。-lt",
			 @"0-0-0-我又背著祐莉，繼續跑向另一家診所。但是，還是一樣，沒有人在診所裡。-lt",
			 @"0-0-0-我想，這下大概只有大醫院的急診室才能看診了吧。-lt",
			 @"0-0-0-於是我繼續走到大馬路上，打算攔下一台計程車到大醫院去。-lt",
			 @"0-0-0-也不知道是不是巧合，今天路上的計程車幾乎都已載了客。-lt",
			 @"0-0-0-加上背著祐莉的關係，兩手無法舉起來，因此即使有一兩台空車經過，也只能眼睜睜地看著它溜走。-lt",
			 @"0-0-0-眼看著又有一台空車出現，情急之下我只好不斷地原地跳著並不斷大叫，希望引起司機注意。-lt",
			 @"0-0-祐莉-達、達令……-lt",
			 @"0-0-0-看來我這可笑的舉動終於引起那台計程車的注意，總算慢慢地來到我面前。-lt",
			 @"0-0-0-就這樣，我總算平安地將祐莉帶到大醫院的急診室就醫。-lt",
			 @"end-4",
			 nil];
			NSArray *array4story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-scene_hospital-bgm015-0",
			 @"0-0-0-當我們到達醫院急診室時，祐莉已經虛弱到幾乎說不出話。-lt",
			 @"0-0-0-醫生為祐莉打了點滴之後，就讓她躺在病床上休息。-lt",
			 @"0-0-0-祐莉在經過約三個鐘頭的沈睡與休息之後，終於醒了過來。-lt",
			 @"end-5",
			 nil];
			NSArray *array5story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-sleep-bgm010-10",
			 @"3-0-祐莉-達令……我睡了多久？-lt",
			 @"3-0-我-嗯……大概三個小時吧。妳感覺好點了嗎？-lt",
			 @"3-0-祐莉-嗯嗯。好多了。不會像剛才那樣，頭也不會暈了。-lt",
			 @"3-0-我-是嗎？太好了……。-lt",
			 @"3-0-0-我伸手摸摸她的額頭，手心還感受得到頭髮被汗水沾濕的感覺。-lt",
			 @"3-0-我-剛剛我真是擔心死了…沒想到會這麼的嚴重……-lt",
			 @"3-0-我-明明之前知道妳有貧血的毛病，卻還是沒留意到妳生理期可能會很嚴重……-lt",
			 @"3-0-我-對不起，都是我沒有好好照顧妳……-lt",
			 @"3-0-祐莉-不…達令……請你不要自責……-lt",
			 @"3-0-祐莉-你知道嗎？以前我每一次生理痛，痛到像今天這種程度時…-lt",
			 @"3-0-祐莉-都是爸爸請他朋友開的醫院派救護車來載我就醫的。-lt",
			 @"3-0-0-直接派救護車送醫？有錢人家真是不一樣。-lt",
			 @"3-0-祐莉-今天你背著我跑了這麼多地方，我又那麼重，一定很辛苦吧？-lt",
			 @"3-0-我-不！不會的！祐莉妳那麼輕，一點都不辛苦！-lt",
			 @"3-0-祐莉-嘻嘻……-lt",
			 @"3-0-祐莉-達令……謝謝你！我好高興！-lt",
			 @"3-0-我-……為什麼？-lt",
			 @"3-0-祐莉-因為從小到大，每一次我生病時，總是勞師動眾，造成很多人的困擾……-lt",
			 @"3-0-祐莉-但是今天，第一次有人為了我這麼的拼命。說真的，我好感動！-lt",
			 @"3-0-我-這真的沒什麼啦！倒是妳，真是快嚇死我了！-lt",
			 @"3-0-祐莉-達令……答應我好嗎？以後要好好保護我哦！-lt",
			 @"3-0-我-嗯！不管妳在哪裡，我都會趕去保護妳！-lt",
			 @"3-0-0-祐莉的好感度上升了！-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, array1story, array2story, array3story, array4story, array5story,nil];
		}
		case 240: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-test_home-0-0",
			 @"2-0-0-生理期的祐莉/翌日-0",
//			 @"0-0-0-扣除每日基本花費５００圓！-lt",
			 @"0-0-0-我陪祐莉在醫院的急診室休息了一晚。-lt",
			 @"0-0-0-祐莉的身體狀況也恢復得差不多了。之後，便帶著她回到家裡。-lt",
			 @"0-0-0-由於祐莉還需要靜養，因此我今天也決定留在家裡照顧她一整天。-bgm002",
			 @"0-0-0-大部分的時間，她都安靜地躺在床上，而我則是幫她整理房間，打理三餐。-lt",
			 @"0-0-0-祐莉有時則會從睡夢中醒過來，安靜地看著我在家裡忙東忙西的。-lt",
			 @"0-0-0-當我把家裡的工作都忙完，再到祐莉房間時，祐莉已經起身坐在床邊了。-lt",
			 @"0-0-我-妳起來啦？身體感覺好點了嗎？-lt",
			 @"1-face02002-祐莉-嗯嗯，睡了這麼久，還有你在旁邊照顧，我恢復得差不多了。-lt",
			 @"1-lt-我-真的嗎？可不要勉強哦，醫生說妳今天一整天都得好好休息的呢！-lt",
			 @"1-face02005-祐莉-我也不能再躺下去了，再躺下去身體都要生鏽了！-lt",
			 @"1-lt-我-嗯嗯，那就起來稍微活動一下吧！-lt",
			 @"1-face02008-祐莉-達令……我問你哦…-lt",
			 @"1-lt-我-嗯？-lt",
			 @"1-lt-祐莉-當你在為我做這些事情的時候…心裡想的是什麼？-lt",
			 @"1-lt-祐莉-不只是昨天的事，還有之前…所有…你為我做的事…-lt",
			 @"1-lt-我-啊？這、這個嘛……-lt",
			 @"end-1",
			 nil];
			NSArray *array1dialog =
			[NSArray arrayWithObjects:
			 @"dialogw-該如何回答呢",
			 @"什麼也沒想-2",
			 @"真沒辦法-3",
			 nil];
			NSArray *array2story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-test_home-bgm002-10",
			 @"1-lt-我-想什麼…老實說，我還真的什麼也沒想呢！-lt",
			 @"1-face02006-祐莉-真的？-lt",
			 @"1-lt-我-不然呢？因為是為了妳的關係啊！-lt",
			 @"1-face02007-祐莉-為了……我？難道你都不會覺得，有時為我付出這麼多，卻什麼也沒得到，是很不划算的事嗎？-lt",
			 @"1-lt-我-為了喜歡的人做的事，本來就不需要什麼回報的。-lt",
			 @"1-lt-我-況且，我確實是得到了妳的笑容啊。光是這樣，就很足夠了！-lt",
			 @"1-face02005-祐莉-達令……-lt",
			 @"1-lt-0-祐莉的好感度上升了！-lt",
			 @"end-end",
			 nil];
			NSArray *array3story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-test_home-bgm002-90",
			 @"1-lt-我-……我其實在想…真沒辦法…-lt",
			 @"1-face02010-祐莉-真沒辦法？-lt",
			 @"1-lt-我-事情遇上了，只能坦然面對囉！-lt",
			 @"1-face02007-祐莉-是、是這樣啊……-lt",
			 @"1-lt-0-祐莉的好感度降低了！-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story,array1dialog,array2story,array3story, nil];
		}
		case 259: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-0-0",
			 @"2-0-0-祐莉的志願-0",
			 @"0-0-0-用過晚餐後，祐莉在客廳裡讀著設計相關的書籍。-bgm002",
			 @"0-0-我-祐莉……可以問妳一件事嗎？-lt",
			 @"1-face02009-祐莉-嗯？是什麼事啊？-lt",
			 @"1-lt-我-祐莉當初是怎麼決定要攻讀服裝設計的呢？-lt",
			 @"1-face02006-祐莉-咦？為、為什麼？-lt",
			 @"1-lt-我-嗯。凡事總是有個契機或原因的吧？-lt",
			 @"1-face02005-祐莉-嗯……。其實，當初會念這個學系，是家裡幫我決定的。-lt",
			 @"1-lt-我-家裡決定的？不是妳自己想要念的啊？這是為什麼呢？-lt",
			 @"1-lt-祐莉-這、這個嘛……有很多原因啦……。-lt",
			 @"1-lt-我-嗯～。不過，看起來祐莉妳還滿有興趣的嘛。記得妳的成績還不錯吧？-lt",
			 @"1-face02002-祐莉-嗯，還可以啦。因為念著念著，也開始發現裡面的樂趣了……-lt",
			 @"1-lt-我-那麼，妳有想過將來要怎樣發展嗎？-lt",
			 @"1-face02006-祐莉-咦！？這、這個……老實說，我沒有想過耶……-lt",
			 @"1-lt-我-哦？這我倒是很意外。我以為妳連將來要做什麼都已經計畫好了呢！-lt",
			 @"1-lt-祐莉-……為什麼…你會這麼認為呢？-lt",
			 @"1-lt-我-呃……因為，祐莉在我眼中是很聰明，又有主見的人啊！-lt",
			 @"1-face02005-祐莉-……真是這樣嗎？-lt",
			 @"1-lt-我-是啊！-lt",
			 @"1-face02007-祐莉-……其實…根本不是這樣的……-lt",
			 @"1-lt-我-啊？-lt",
			 @"1-face02005-祐莉-算、算了，別說了。-lt",
			 @"1-lt-我-那麼……既然妳是念服裝設計的話，將來應該也是以成為設計師為目標吧？-lt",
			 @"1-0-祐莉-嗯、嗯。其實……也沒有想得那麼具體啦。只是……-lt",
			 @"1-face02002-祐莉-看到美麗的服裝從自己手中做出來，並且能讓別人因為自己的作品而變得更漂亮…-lt",
			 @"1-0-祐莉-若能讓別人因為自己的作品而感到高興，應該是很棒的事吧？-lt",
			 @"1-lt-我-嗯。能讓別人因為自己的作品而變得高興……一定是很棒的事！-lt",
			 @"1-face02002-祐莉-希望……將來能有達成的一天！-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, nil];
		}
		case 270: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-test_home-bgm002-0",
			 @"2-0-0-花嫁之夢-0",
			 @"0-0-0-今天又到了星期假日。這個禮拜該帶祐莉到哪裡約會才好呢？-lt",
			 @"0-0-0-就在我左思右想，還沒想到一個絕佳的計畫時，祐莉突然叫住了我。-lt",
			 @"1-face02006-祐莉-達令！今天你有安排什麼事情嗎？-lt",
			 @"1-lt-我-呃？這、這個嘛……是還沒有……-lt",
			 @"1-0-祐莉-太好了！陪我去一個地方吧！-lt",
			 @"1-lt-我-這、這樣啊？要去哪裡呢？-lt",
			 @"1-face02003-祐莉-先別管這麼多，陪我去就是了嘛！-lt",
			 @"1-lt-我-好……好吧。-lt",
			 @"1-lt-0-祐莉偶爾難得表現出這麼主動的態勢，我只好順著她的意思。-lt",
			 @"end-1",
			 nil];
			NSArray *array1story =
			[NSArray arrayWithObjects:
			 @"storyw-face01001-act_04-bgm009-0",
			 @"0-0-0-在祐莉帶領下，我們來到了以往常跟祐莉去的流行街。-lt",
			 @"0-0-我-這是……平常跟妳逛的地方，不是嗎？-lt",
			 @"1-face02007-祐莉-沒錯。不過……我的作業要設計婚紗，可是我不太清楚婚紗的設計都是怎樣…-lt",
			 @"1-0-祐莉-所以，我想實際來婚紗店看看！-lt",
			 @"1-lt-我-哦、哦哦……那麼，我們開始吧！-lt",
			 @"1-lt-0-於是，我陪著祐莉到各家婚紗禮服店，參觀了許多不同款式的婚紗造型。-lt",
			 @"1-lt-0-負責拍照記錄的我是閒不下來的。除了拍照之外，還要幫祐莉把許多細節記錄在筆記本上。-lt",
			 @"1-face02011-祐莉-嗯……-lt",
			 @"1-lt-我-怎麼了嗎？-lt",
			 @"1-face02012-祐莉-雖然款式大抵上都差不多，但是，我很想看看裡面的剪裁等細節部分是怎麼設計的……-lt",
			 @"1-face02007-祐莉-可以的話，能實際試穿就好了……-lt",
			 @"1-lt-我-那、那麼……-lt",
			 @"1-face02006-祐莉-…………有了！-lt",
			 @"1-lt-我-？-lt",
			 @"1-face02004-祐莉-我們就假裝是要結婚的新人，進去店裡面試穿看看！-lt",
			 @"1-lt-0-於是祐莉拉著我，就朝其中一家婚紗禮服店衝了進去。-lt",
			 @"1-face02009-祐莉-記得，等會就由我來說就好了哦！-lt",
			 @"1-lt-我-哦、哦哦！-lt",
			 @"0-0-0-在店員的詢問下，祐莉表現得十分逼真，宛如我們真的就像是即將結婚的新人一樣。-lt",
			 @"0-0-0-店員除了細心地為我們介紹他們的服務之外，也不時給予我們祝福。-lt",
			 @"0-0-0-原來……這就是要結婚的感覺啊……。感覺真是不錯。-lt",
			 @"1-face02004-祐莉-小姐，請妳讓我試穿那件禮服，我想要穿給我老公看！-lt",
			 @"1-lt-店員-好的，這邊請！-lt",
			 @"1-lt-0-被祐莉用“老公”稱呼，好像我們已經是非常親密的關係，這是從來都沒有過的感覺。-lt",
			 @"0-0-0-祐莉在店員的帶領下，進入樓上的更衣客房更換禮服。-lt",
			 @"0-0-0-經過約十分鐘之後，祐莉終於走出了更衣室。-lt",
			 @"0-0-祐莉-達令！你看！-lt",
			 @"end-2",
			 nil];
			NSArray *array2story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-Wedding-bgm010-0",
			 @"3-0-0-祐莉身上穿著純白色的結婚禮服，緩緩地走到我面前。-lt",
			 @"3-0-我-祐、祐莉……-lt",
			 @"3-0-祐莉-達令，我穿這套…好看嗎？-lt",
			 @"3-0-我-豈止好看…真是太美了！-lt",
			 @"3-0-祐莉-小姐，對不起，能否讓我跟我老公獨處一下？只要一下子就好！-lt",
			 @"3-0-店員-好的！-lt",
			 @"3-0-0-店員笑嘻嘻地離開更衣客房，只留下我跟祐莉兩人。-lt",
			 @"3-0-0-我趕緊把握機會，拿出相機幫祐莉拍下禮服的各處細節。-lt",
			 @"3-0-祐莉-達令……-lt",
			 @"3-0-我-嗯？怎麼啦？-lt",
			 @"3-0-祐莉-你知道嗎？穿上這身禮服……是每一個女孩心中共同的夢想呢！-lt",
			 @"3-0-我-……是啊。-lt",
			 @"3-0-祐莉-我也是……我一直希望，能給我最珍重的人，看到我穿上這禮服的樣子。-lt",
			 @"3-0-我-祐莉……我是……你所說的那個人嗎？-lt",
			 @"3-0-祐莉-達令……我希望是你……-lt",
			 @"3-0-祐莉-我………-lt",
			 @"3-0-0-祐莉似乎想要說什麼，但是卻沒有說出口。-lt",
			 @"3-0-祐莉-好了，我該把禮服還給他們了！-lt",
			 @"3-0-0-祐莉回到更衣室裡，換下了身上的結婚禮服。-lt",
			 @"end-3",
			 nil];
			NSArray *array3story =
			[NSArray arrayWithObjects:
			 @"storyw-face01002-act_04-bgm010-0",
			 @"0-0-0-祐莉最後所說的話，讓我心裡若有所思。-lt",
			 @"0-0-0-『我希望是你』究竟是什麼意思呢？-lt",
			 @"0-0-0-祐莉終究沒有給我答案。-lt",
			 @"end-1",
			 nil];
			return [NSArray arrayWithObjects:array0story, array1story, array2story, array3story, nil];
		}
		case 279: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-0-0",
			 @"2-0-0-神秘的電話-0",
			 @"0-0-0-這天晚上，我跟祐莉一起用過晚餐後，在家裡閒聊。-bgm004",
			 @"0-0-0-突然，祐莉的手機鈴聲響起。不過，從鈴聲聽來，跟之前的前男友鈴聲又不一樣。-lt",
			 @"1-face02007-祐莉-!-lt",
			 @"1-lt-0-祐莉的表情看起來有些驚訝，又有些憂鬱。-lt",
			 @"1-lt-我-祐莉……妳…不接電話嗎？-lt",
			 @"1-lt-祐莉-嗯……嗯。我回房間接……。-lt",
			 @"0-0-0-祐莉接了電話之後，匆匆地回到房間。-lt",
			 @"0-0-0-過了一會兒之後，祐莉從房間走了出來。祐莉的表情，看起來似乎有些複雜。-lt",
			 @"1-face02007-祐莉-…………-lt",
			 @"1-lt-我-……怎麼了？是誰的電話？-lt",
			 @"1-lt-祐莉-……沒什麼。-lt",
			 @"1-lt-我-………。-lt",
			 @"1-lt-0-祐莉很明顯的並不想告訴我來電者的身份。-lt",
			 @"1-lt-0-雖然心裡面很在意，不過既然祐莉不想提，我也不好再追問下去。-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, nil];
		}
		case 299: {
			NSArray *array0story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-0-0",
			 @"2-0-0-激情之夜-0",
			 @"0-0-0-這天晚上，我跟祐莉正在客廳觀賞電視節目。-bgm004",
			 @"1-face02003-哈哈哈，剛剛那個好好笑哦！-lt",
			 @"1-lt-0-這時候，祐莉的手機突然響起。從鈴聲聽來，應該是前男友打來的吧。-lt",
			 @"1-face02007-祐莉-…………-lt",
			 @"1-lt-0-看到來電的祐莉突然靜了下來，正拿起手機打算要把它關掉。-lt",
			 @"1-lt-我-祐莉……沒關係，妳去房間裡面接吧。-lt",
			 @"1-lt-祐莉-可是……-lt",
			 @"1-lt-我-我想他再度打來，應該是有什麼重要的事情要跟妳說吧？-lt",
			 @"1-lt-祐莉-可是，這樣對你……-lt",
			 @"1-lt-我-祐莉，我相信妳。現在妳在我身邊，就是讓我相信妳最好的原因。-lt",
			 @"1-lt-祐莉-……嗯嗯。-lt",
			 @"0-0-0-祐莉拿起手機，回到她的房間裡了。-lt",
			 @"0-0-0-過了一會兒，祐莉又不發一語地回到了客廳。-lt",
			 @"1-face02007-祐莉-…………-lt",
			 @"1-lt-我-……妳還好吧？-lt",
			 @"1-face02005-祐莉-……嗯嗯。我沒事的。-lt",
			 @"1-lt-我-………我說，祐莉啊！-lt",
			 @"1-face02007-祐莉-？-lt",
			 @"1-lt-我-妳上次說過，我有跟妳之前說的那些男生所沒有的優點，是吧？-lt",
			 @"1-face02005-祐莉-嗯嗯。-lt",
			 @"1-lt-我-我左想右想，實在想不到到底是什麼。我只想到，以前被其他女生拒絕的往事。-lt",
			 @"1-face02010-祐莉-被其他女生拒絕？-lt",
			 @"1-lt-我-嗯嗯。以前我曾經追過幾個女生，不過後來都被甩了。-lt",
			 @"1-face02006-祐莉-為什麼呢？-lt",
			 @"1-lt-我-妳別看我這個樣子，我追女生的時候可是很勤奮的！不管是幫忙修電腦、跑腿、接送，我都沒有一句怨言的。-lt",
			 @"1-lt-我-不過，到最後，對方總是回我一句“我知道你是個好人，我相信你一定會找到更好的女生”後，就不再跟我來往了。-lt",
			 @"1-lt-祐莉-啊！這該不會就是……-lt",
			 @"1-lt-我-哈哈，沒錯，就是人家說的好人卡囉！-lt",
			 @"1-lt-我-終究，那些女生，還是選擇了跟外型更帥氣，或者更多金的男生在一起了。-lt",
			 @"1-face02007-祐莉-……達令。我想，你剛剛所說的那些女生裡，一定包含我在內吧！-lt",
			 @"1-lt-我-不！我說的絕對不是妳，妳不要誤會啊！-lt",
			 @"1-face02005-祐莉-我很清楚的。儘管你沒有那個意思，但我的確就是會做那種事的女人。-lt",
			 @"1-face02007-祐莉-其實……我也都知道……你從以前……就喜歡我……-lt",
			 @"1-lt-我-祐莉……原來妳…早就知道了……？-lt",
			 @"1-face02005-祐莉-像我這種女生，對這種事本來就很敏感了。況且，你又是那麼不會掩飾的人……-lt",
			 @"1-lt-我-那麼，為什麼妳……-lt",
			 @"1-face02007-祐莉-一方面，我覺得跟你當好朋友時，你會很熱心地幫助我。我想，只要跟你維持這樣的關係，對我來說或許會比較自在點。-lt",
			 @"1-lt-我-……。-lt",
			 @"1-lt-祐莉-一方面，因為追求我的男生都是條件很好的人。跟他們在一起時，不論是物質面或心理面，都能滿足我的虛榮。-lt",
			 @"1-lt-祐莉-相比之下，像你這樣老實單純的男生，就不是那麼具有吸引力了。-lt",
			 @"1-lt-祐莉-而且……維持一個曖昧的關係，反而更能利用也說不定。-lt",
			 @"1-face02014-祐莉-你一定覺得，我真是個……自私又膚淺的女人對吧……？-bgm014",
			 @"1-lt-我-祐莉……-lt",
			 @"1-face02016-祐莉-也因為我是這樣自私又膚淺的女人，自然，我所得到的，也都是自私又膚淺的男人。-lt",
			 @"1-face02014-祐莉-達令……如果因為這樣，你要生我氣的話，我都接受的。因為，我知道我做了很多過份的事……-lt",
			 @"1-lt-我-祐莉……妳……應該知道，我絕不是會為了這種事跟妳生氣的人吧！-lt",
			 @"1-lt-祐莉-……。-lt",
			 @"1-lt-我-當喜歡上一個人時，為對方的付出都是心甘情願。儘管知道對方不見得會珍惜，這些其實都是甜美的過程。-lt",
			 @"1-lt-我-我不希望妳用補償的心理跟我在一起，因為並不需要這樣。-lt",
			 @"1-lt-我-我現在很快樂，也很幸福。因為有妳在我身邊。-lt",
			 @"1-lt-我-我沒有把握能把妳永遠留在我身邊，但是我會盡力去珍惜妳陪伴我的每一刻！-lt",
			 @"1-face02016-祐莉-達令……。-lt",
			 @"end-1",
			 nil];
			NSArray *array1story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-kissing-bgm010-0",
			 @"3-0-0-祐莉靠近我身邊，雙手溫柔地抱著我。lt",
			 @"3-0-祐莉-達令，我說過…你所擁有的…那些男生所沒有的優點，對吧？-lt",
			 @"3-0-祐莉-那就是……一顆真摯誠懇的心！-lt",
			 @"3-0-祐莉-這是我在感情路上跌跌撞撞之後，好不容易發現的道理。-lt",
			 @"3-0-祐莉-達令……對不起……為了我，讓你受苦了……-lt",
			 @"3-0-祐莉-我發誓……現在的我……是全心全意跟你在一起的！-lt",
			 @"3-0-祐莉-不是為了補償，而是為了珍惜……一直默默守在我身邊的你！-lt",
			 @"end-2",
			 nil];
			NSArray *array2story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-kissing1-bgm010-0",
			 @"3-0-0-祐莉撫摸著我的臉頰，溫柔地吻了我的嘴唇。-lt",
			 @"3-0-0-從祐莉柔軟的嘴唇中，傳來一股淡淡的甜味。這是我跟祐莉第一次接吻的滋味。-lt",
			 @"3-0-我-……有一點…甜甜的味道……-lt",
			 @"3-0-祐莉-嘻嘻……傻瓜，那是我唇蜜的味道啦……-lt",
			 @"3-0-我-……我想再嚐一次…那個味道……-lt",
			 @"3-0-祐莉-……嗯嗯。-lt",
			 @"3-0-0-這次，我不再被動。我抱著祐莉纖細的腰，一隻手溫柔地撫摸著她的雙頰，感受她臉上每一吋肌膚的脈動。-lt",
			 @"3-0-0-我倆的雙唇炙熱地吻著，彼此的舌尖在雙唇之間糾纏，熱意透過舌尖，溫暖了對方的身體。-lt",
			 @"end-3",
			 nil];
			NSArray *array3story =
			[NSArray arrayWithObjects:
			 @"storyb-face01002-test_home-bgm010-0",
			 @"0-0-0-我抱著祐莉，不知反覆熱吻了幾次。-lt",
			 @"0-0-0-我與她的臉緊緊貼在一起，祐莉就這樣陶醉在我零距離的無數甜言蜜語中。-lt",
			 @"0-0-0-此時此刻，我真正感受到，那卸下重重心防，對我敞開一切的，真正的她。-lt",
			 @"0-0-0-這是我有生以來，最甜蜜美好的夜晚。-lt",
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story,array1story,array2story,array3story, nil];
		}
		default:
			return [NSArray array];
	}
}

@end
