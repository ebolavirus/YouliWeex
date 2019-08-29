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
			// 第二个元素开始: 0/1/2(是否展示祐莉，2为标题)-12（祐莉表情）-speaker-text（文本）-bgm（新bgm）
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
		default:
			return [NSArray array];
	}
}

+(UIImage*)getImageByColor:(UIColor*)aColor
{
	CGSize as = CGSizeMake(1, 1);
	UIImage *img = nil;
	CGRect rect = CGRectMake(0, 0, as.width, as.height);
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context,
																 aColor.CGColor);
	CGContextFillRect(context, rect);
	img = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return img;
}

+ (NSString *)defaultViewControllerWithNibName:(NSString *)nibNameOrNil
{
	if (KDeviceHeight==480) {
		//iphone 3G,4,4s
		return [NSString stringWithFormat:@"%@_4",nibNameOrNil];
	}
	return nibNameOrNil;
}

+(float)DeviceVersion
{
	return [[UIDevice currentDevice].systemVersion doubleValue];
}

+(UIImage *)grayImage:(UIImage *)sourceImage
{
	int bitmapInfo = kCGImageAlphaNone;
	int width = sourceImage.size.width;
	int height = sourceImage.size.height;
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	CGContextRef context = CGBitmapContextCreate (nil,
																								width,
																								height,
																								8,      // bits per component
																								0,
																								colorSpace,
																								bitmapInfo);
	CGColorSpaceRelease(colorSpace);
	if (context == NULL) {
		return nil;
	}
	CGContextDrawImage(context,
										 CGRectMake(0, 0, width, height), sourceImage.CGImage);
	UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
	CGContextRelease(context);
	return grayImage;
}

+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
	UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
	[image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
	UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return reSizeImage;
	
}

+(UIImage *)cropSquareImage:(UIImage *)image {
	CGFloat width = image.size.width;
	CGFloat height = image.size.height;
	CGFloat edge = MIN(width, height);
	CGRect rect = CGRectMake((edge-width)/2,(edge-height)/2, width,height);
	UIGraphicsBeginImageContext(CGSizeMake(edge, edge));
	[image drawInRect:rect];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return  newImage;
}

+(UIImage *)rotateImage:(UIImage *)aImage
{
	CGImageRef imgRef = aImage.CGImage;
	CGFloat width = CGImageGetWidth(imgRef);
	CGFloat height = CGImageGetHeight(imgRef);
	CGAffineTransform transform = CGAffineTransformIdentity;
	CGRect bounds = CGRectMake(0, 0, width, height);
	CGFloat scaleRatio = 1;
	CGFloat boundHeight;
	UIImageOrientation orient = aImage.imageOrientation;
	
	switch(orient)
	{
		case UIImageOrientationUp: //EXIF = 1
			transform = CGAffineTransformIdentity;
			break;
		case UIImageOrientationUpMirrored: //EXIF = 2
			transform = CGAffineTransformMakeTranslation(width, 0.0);
			transform = CGAffineTransformScale(transform, -1.0, 1.0);
			break;
		case UIImageOrientationDown: //EXIF = 3
			transform = CGAffineTransformMakeTranslation(width, height);
			transform = CGAffineTransformRotate(transform, M_PI);
			break;
		case UIImageOrientationDownMirrored: //EXIF = 4
			transform = CGAffineTransformMakeTranslation(0.0, height);
			transform = CGAffineTransformScale(transform, 1.0, -1.0);
			break;
		case UIImageOrientationLeftMirrored: //EXIF = 5
			boundHeight = bounds.size.height;
			bounds.size.height = bounds.size.width;
			bounds.size.width = boundHeight;
			transform = CGAffineTransformMakeTranslation(height, width);
			transform = CGAffineTransformScale(transform, -1.0, 1.0);
			transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
			break;
		case UIImageOrientationLeft: //EXIF = 6
			boundHeight = bounds.size.height;
			bounds.size.height = bounds.size.width;
			bounds.size.width = boundHeight;
			transform = CGAffineTransformMakeTranslation(0.0, width);
			transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
			break;
		case UIImageOrientationRightMirrored: //EXIF = 7
			boundHeight = bounds.size.height;
			bounds.size.height = bounds.size.width;
			bounds.size.width = boundHeight;
			transform = CGAffineTransformMakeScale(-1.0, 1.0);
			transform = CGAffineTransformRotate(transform, M_PI / 2.0);
			break;
		case UIImageOrientationRight: //EXIF = 8
			boundHeight = bounds.size.height;
			bounds.size.height = bounds.size.width;
			bounds.size.width = boundHeight;
			transform = CGAffineTransformMakeTranslation(height, 0.0);
			transform = CGAffineTransformRotate(transform, M_PI / 2.0);
			break;
		default:
			[NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
	}
	UIGraphicsBeginImageContext(bounds.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
		CGContextScaleCTM(context, -scaleRatio, scaleRatio);
		CGContextTranslateCTM(context, -height, 0);
	}
	else {
		CGContextScaleCTM(context, scaleRatio, -scaleRatio);
		CGContextTranslateCTM(context, 0, -height);
	}
	CGContextConcatCTM(context, transform);
	CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
	UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return imageCopy;
}

+(BOOL)isTheStr:(NSString *)aStr hasContainTheSubStr:(NSString *)bStr
{
	NSRange range=[aStr rangeOfString:bStr];
	return range.location != NSNotFound;
}

+(float)computeFloat:(float)f modulo:(float)m {
	float result = f - floor((f)/m)*m;
	if (result>m-0.2) result = 0;
	if (result<0) result = 0;
	return result;
}

@end
