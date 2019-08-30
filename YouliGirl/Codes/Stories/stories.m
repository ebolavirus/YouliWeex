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
			 @"storyb-face01005-scene_cinema3-0-0",
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
			 @"end-end",
			 nil];
			return [NSArray arrayWithObjects:array0story, nil];
		}
			我：
			那、那妳剛才……
			祐莉：
			雖然我…從頭到尾都一直張大著眼睛……
			祐莉：
			可是其實我根本沒有在看螢幕，只是盯著其他地方，根本不敢看電影在演什麼……
			我：
			原來如此……。對不起，我竟然不知道妳不敢看……
			祐莉：
			沒關係的。其實，只要能跟你一起看電影，就很愉快了！
			face02005.png
			祐莉：
			走吧！我們去吃點東西！
			我：
			哦、哦哦！
			
			
			電影約會-同居後
			scene_cinema.png
			bgm009.mid
			電影到最後，結局當然是皆大歡喜，男女主角最後也共步紅毯，可說是相當好看的一部片。
			我：
			祐莉……今天這部片好看嗎？
			祐莉：
			……嗯…嗯嗯，好看……
			face01001.png
			face02008.png
			祐莉的神情似乎有點複雜，而且看起來有些害羞。
			我：
			跟、跟我們兩個好像滿相像的嘛……
			祐莉：
			………是有點像…。不過……
			face02005.png
			我：
			嗯？
			祐莉：
			達令……你在想色色的事對吧？
			face02011.png
			我：
			呃…這、這個……
			妳誤會了
			的確……
			
			我：
			妳、妳誤會了！只是想到情境有點像而已，沒別的意思……
			祐莉：
			……真的嗎？
			face02005.png
			我：
			是真的！
			祐莉：
			嘻嘻，我相信你。我想達令不是那種人的。
			face02002.png
			……不，我就是那種人！只是，不能說出口而已！
			祐莉：
			……如果…那一天到來的話……
			face02005.png
			我：
			啊？妳剛剛說什麼？
			祐莉：
			沒、沒事的！我們去吃飯吧！我肚子餓了！
			face02003.png
			我：
			哦、哦哦！
			
			我：
			的確……是有想過啦！
			祐莉：
			哼……我就知道！
			我：
			祐莉！
			我突然一臉正經地抓住祐莉的肩膀，對著她說。
			祐莉：
			什、什麼！？
			face02006.png
			我：
			我……也是個正常的男人！我如果說不想，那是騙人的！
			祐莉：
			哦、哦哦……
			我：
			我很喜歡妳！所以我不想騙妳！
			祐莉：
			但、但是……我現在還……
			face02007.png
			她臉上的表情已經說明了，她現在還沒有那個意願。
			我：
			……沒關係的。這種事……絕不能勉強的。
			祐莉：
			嗯……嗯嗯……。對、對不起！
			我：
			沒關係，別提這件事了。走吧！我們去吃點好吃的！
			祐莉：
			嗯嗯！
			face02005.png
			祐莉：
			……如果…那一天到來的話……
			face02008.png
			我：
			啊？妳剛剛說什麼？
			祐莉：
			沒、沒事的！我們去吃飯吧！我肚子餓了！
			face02002.png
			我：
			哦、哦哦！
			祐莉的好感度上升了！
			
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
