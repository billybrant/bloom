CREATE DATABASE  IF NOT EXISTS `bloom` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bloom`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: rit-wamp-dev    Database: bloom
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache_page`
--

DROP TABLE IF EXISTS `cache_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table used to store compressed pages for anonymous...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_page`
--

LOCK TABLES `cache_page` WRITE;
/*!40000 ALTER TABLE `cache_page` DISABLE KEYS */;
INSERT INTO `cache_page` VALUES ('https://bloom-dev.meei.harvard.edu/?q=js/admin_menu/cache/ad44d0eb84f69d01b2949da1e2117aaf','a:5:{s:4:\"path\";s:52:\"js/admin_menu/cache/ad44d0eb84f69d01b2949da1e2117aaf\";s:4:\"body\";s:7114:\"‹\0\0\0\0\0Í]isâ¼²þ~…Š[uj¦êeH2“íœ™œbHHÈ6LYæ~p	[€ƒm9^Xòë¯Z²±ËfªRA‹õtKÝjµËß5}ˆtíG	k¦n•Mbù%¤\ZØuãIeW÷H¹cPj–52diD/÷±3ÄŽV&šè8ž”5Ýµ\r¬’²GíÒÙ÷EðòÈÁ¶MœÒÙÿ|÷ùL]¥Ö”¼æP[£#‹ázOð0\"c[\Zî„=†Qß!Ý¥\nëfoI™r•=T™ÖçÔçKPŸ/¬>¨¯[ÑHû†Wéê‹uñŠaÿJh¤k^ÿGiÿ¨„úDïõ=Æ\\Q“”Påì{‹Z&U(Æíßp+º¥‘qé¬?Pø{ž‹*Ÿ\\Ù°¸5¬t\rßí—U¬öÉ¿°iÿÇ£býè?ØG—äª>8};6í?†{ñr<|¾¹š\\íû×ªyþ‚¯ÚÍëSgŸ&‰_#®§[ØÓYëÕ«)«Pq7­æŸ•(9Æò>o¶pÿ¼L¿½¿Ý?¨õëÞC¯ÞÖŸo‡Ãó–ýô~9¾\röFÕµ,W!]w=‡Ç<oßTL:¤“‹¯¿ß»7žÕ¹>¯=;Øy!wMçõÏ#>>}Ýo7gÔè÷ÍgºžÅ\Zd£ÈÆÜ±ÂÄsc¼U_êer:x»½ë»‡¸:¡5õà¦¹×V®Ç½ñcÇSN•îeÇ¸mþ^Ï[«…˜â¡k<Ä-ÕÑmocþæ„{º»OÎ.Vë¦U×>ökwÇô´×îÙí»wÖ›õËîÑãh-wwÛHs¾ƒ}Ü7^/N~Ôæù‡NÝêuõprxxQïíÿj·_ôñÞÅäw­«]¶×2ÔÄ=ÂÛ‹.Ù˜3¯OÌ8gwþeõx|€Íûåíå[õÊÝŸXý¯.½;y®½6¾}}×ªµ[u-g€½½’ù¶†½8oîÏ‹ßÇÏªY¿¿:hOÎ÷‡ûdì{\'×£¯Õë¶ýupé>ÛúûÞøu-omŽØ?1VñÕVÐeá³s2$µ&SLž’ÒiP°h„A°“¢›²§„á[Þ|–uHV®ç–(Œ¯+Çj¡{6tiéì‚GDÖ•³ûlÈ½ÕgÍØ¼j¢\ZÕÖ2ÙÕ‰¡´êNEŠE‰C,•I î[*7ªÓ´µõ3HŠµË¥%Œ~ú¼® ×G60›\\mÌ`1nšTóÙ-L‚\'ÖAY¬i¬ªÄu+®ošØ™”Îî£D$¦hsÑv¬½!²aÊ°V×HÇ×™D Ç]/Ýr=6*§€\ržDA»­…ö­²êð¢¾… ´^õ]—Ój‰\0\ZêdDœuÅ¸é›´éÍ•(Íœ7[…u\rð<ˆˆ¦{ÔI¶6Iþ™ClêxLc<ìùnúvvóï ð¨ˆ»©ì¯G{=ƒ”QÅlï1¾«=`óâùO³ìU\'å›Ç«ó£ÉuóäÏ·›ý_Ã½×ÅÔ\Z·\'k[ä\\wyƒhÂ\'I5Vz¡}Ï³ÿ]©hŽocãuzt\ZNé!.`Tl‡¾Õ«è®ëƒ?ÎsþËæ\Z T?Ž¿0gù§AÕâ wŸøKÌÏZl¬i¬WºÜÎR¨Š˜G©”»O-²Š^B5T©yj®±j¾G\rÚ£¾7G¥›L÷5tËs%‘RÀž³Ò ‰ätÝ‡¸Hª¥†;§‡¾1@c02(„mš¥Q»¹à©€š?ïK0˜9dîþôˆE94ˆ‰õ9\Z$šû[sØÂ«6ÒL¥DJa®|z\nŒÄÊH×zÄ[Cû‰=‰žù“øè6f2»6K´¤J!@´t–$ZñØØKœ$\n<G!>&ôêÛstøXp	ÒÈ±¡kÜê\'ÑŠr³ÑAF;êæ¼Â7îj2€-C·ˆ\"t]éRÇœ#ÃóQ âu–/èí(.›‚£4§×´ƒZa–R0*+ðtféðùŽ,ˆÏ‰Áf©ÀØ‰ˆ¬¡mjŠ\\EÓ1sf‰Mí‹D¶’Ô Ê{j_[ Ç²P˜%ƒxÍs$ 	µe.ë“ÄIðQ[<Cš‹êá1µ¨9QTw8Kè1ÈAµÖÒMÐ‰Š4Õðˆc*ÑPå9dÎ\\<²b#Ô#{@Yß×çš³mégsä	baŽ\Zç’()É#a»Í(Haœw•óJ˜ÐqK>GxqÇõ×ôi¤a!/Ñœ²ÌÝÄòüeN2‰Ì²nMõgCI»R3›b‰»R«7f**µ<661^VÎ‡×b‚†I$Ÿ)\"5drù\nvØÌà«\"°|=bZÄÆ=öüOì²)„SéP:`EØÿ´%ÀÝ®UÊ‡Ë°ä\'J¬Yý›ëlxý2¬Ù9f°\nrÅÓP#JK¤Û—m]gåÍjUi6\Z)Š1Ó	“ü2·èÌAQÄ£)ŠÇÆê™ñùßMN1¢Î ÌÆ×ÒÙ3Á||ƒe÷¥:Î~M3ÐuØx{p©‚mÖÙ™;\nfY„	¨½@GŸö>¯îÕ©kàzŽ¯‚ùeÃiÌÖSçp+Üƒ–¬6o—9œÈðèšÅÄ¤ÒÂºL_üY@Û®š¬°ë‰-v¾¬Ë«MM¾¤›¹êsØ›\"-UÓdÑ±8i—	_+g?rš†#Êh•)Ð†\r²n%=FŒ¹åÐ’ÅÑfw6n^obÃ†P0à\"ÍÐ¶¼üÂ Ëa³³Y1±ÅFÆÄñ8¿³¸Ä#°¿ÒùË\n°Ç“‘ˆÊµ +è2GC›€£¡Md7\\Œ€—£½]1åZ¿·»1!±FW†çØ-–áæõ-#‰e\n‘É°­¢*žt“{‘\r3psUŒP!‹ÓËWpqJ;’Ÿ‡¡qÏÍUz@¦@áqrEÈŽZ/:ùB‡3\'SÄ¥3¶âìÂAÏGþ›o“æ¥2êd¯êf2˜.|ÐŒÍaÄœGÏ§ÿ.P‘Ümð‹ì­Båòíªq\Z…öÓ„Å õØÜº)/º›ÆˆæÐMçÑóé¦T$wÓü\"»©P¹|»iœF¡ÝtvVFU\0qEÝiiw”Wÿ¼…§Q¸p•„sY•âØ¹YãˆBÑ&yžràÎO“¸üåq¤2ŠÈoÜõäcÑ7â@²µßˆv‘#ALçó·3„\n5bÇLI±c&£®‹Ôr³(	¤Š6-KY”œoN(ºl¢ ÆyŽíœH9{’šºd[’šnþ+lëX!ØQÜ‰i{Ôd­~T£–¦ó³\ZE)Aœ‡Ý(Â+Ãí¿@!&DaöŸ:\Zq@#&‡ÑÂ\"ÎÃŽ4b†…¢Ub†øîuB¼‚ÎòÙ¼’\r#3¤ Ýbƒó6/iËâd7Ê±ÀEÁú±@¿H4ÉuÊ×1]N±XŽb)‹G±¤T1ÄÎÏ\rR(Üûœ£(±â(Øš(ÔëGñù)XæÁûÒÙ§‡Ï¨jMÏD\"‰Ìî„uldùf‡8ÿ µ¬zÄÑ]OWÿAÔA*ÕÈ?ˆŒUb{»È&Ž©{ðNXg‚löxÏÁv}R?#ÚE^_w™¹ïÿ_3È–/Ö”UÏÉžmÌ†lƒ¶1zÉ<aU¥¾å)BÃ˜ª\"Ý‹„œUcŽ|¡ú0O»%˜§º;É‹cþ®Ï~ô¢ì-¼Û³Ÿ·Ügˆ+öYÒI}–èß!ôƒ9¡)ôƒÝ	ý`B?ØÐ;:5‰çèj0Ú°TÇ_Ú(ýóP,ï™¾®G—ýcN	\\À3¤ºJíèÛœC—År¡j³‚bTh;T\'‡MOà•wP†·Hî\n-X¦d‹ø”àîœßúøj‚ÅŠ6¯Õð5äv&V•8`@T¦[lHR‰å’À-Õ¢¼JL:ó¶ôË¹*TV°QŒ~¬``w\Z£{¦ìÞJ\0W´*n X`ÔÎD¨‘!S¦ï+|ñœçÅ?îæ±<uÿåüª+Ø(FKV0°3Ýéb¸¿¤ú’³\n02…Ê\Zè#T ´;ééŽë)†—EëF÷ØÌÛMˆ+ÒˆlA’îNÀ¾a0cVÃîSòu~a5àQÃ(CŠåqëŽ­	¼î\r;pG!õ)o#¿œÓbµd9iÍrv¦EÁn£m`Ké‹0TÇÎ„ùžÓi‡by¹Ë9+TkV°QŒÖ¬``wZCM\"nÛ„{‡M\".ÖÌ[!¦D‹U€ˆlAîLÀºåÇ\"žb;ÌR©ÔPt[,hÃýo\"5ƒ<ô©ÑüŒ‚åîÜG“å¬ª+Ø(FMV0°3µa¡Ïy‹‹q9§$•~DµaGôv&[“hºŠ\rÅ!*u´éÒáHF<987³ÌY)TþÉ£É´w§´£SoàŽÇ\nñâ„‹~œpA2“Ü™¨mæõS‹©¿3ºtÖâˆ_³¸g‰*ð9ÒÅˆ|ŽèÎ„îºpUaQ¸ETß[1óŒr¡bzÅÈ(íN ß»oyùoÛsRÅÊÐ+n³^ÐÚ™‡¤WÄ$l\Z”ÎžDÞšÍøAŸpÛ×6à³Å,ñ,¯A¡:³‚bi;Ó®éÀ!eqs3ó5]ê;*Qª²† 4½Õ™yþ\"ÝR{”iÚ§öÃ­û9gåYÎ`¡Ê³‚b”g»SêB\'‘_ˆ[„ƒ-V\"²	<\"¸[S>.à\"&|Ñâ\\äd/FpgþÐíÒÙ=ïwƒ™Be	ôŠ\"P*ôEÅèºœßOœ\'Tèk‰ÁUïÊ²«ÞeÔp†Fn¯(ÎR)ú5Å$êÓDùw¤­%—XOV²1XO0‹žÈCxÓ­Èr¨X€ÏŠ”E$WI\'Q/Pâ‰ä‹|\"á¿H”ñŒ”Ç…k2Þ±(ãi‚2þ«ta2«“âua²k]˜ìNþ’‘ÁU±<\\ pz;SA½xùº…ðÃÑ Èa`wö†ÿ/±ø¡©/ÒÆïÎ¸ïÂªÿ%æü#ôG‚þØ™ ?v è¿dÜ¶	G±¨7–µDÝC´È!<ÎÆî†ò.v0¤ÏÐ/rpné*ß•ÀDb…®ò•ò…Ï.Ê¨[ˆœÛòß”@Ñ+s„Ãab.ƒëêáNÔãÒ[uí|¬F*Ê’-E*šùólˆÕÝ®TO\"TŒ4óXÊM¤Q¼´ÂwB|ÇåƒÐ9¯ †žy,ß®§[dÇœ¡[H·œ¡Xä4ùŽÖót6\Z¨3U7üF;|\"C„2Ô)«¨á{5þ‹‚ôô:1Šºµ ÊëM4W|Ä\r>%íLœV¾\Z¢nRm\"¶¤ø7b¦øf¼)á+±YÊ×n\"¨Jø5[ñ!ÛMëÉ!TƒŸS©Á•$ú€1T›6ïüWNk	Ì¥&­CsR5å”©Pí¼|š™{–QØ#‹´‚tqXÉòŽƒ#pøÚ½Rºg$\"ùÈ\\£~FMˆ#eÑ‡8Žt­ˆƒKÖEèâ4$P\r‰:!A2kA>âÏCî…\nœÚ¦Q:ûÕ¼»•%p@Ì(p‘Eà@ºÀ9ªdÇ0‹¸G\\Fþgæ@2JšCd‘4.iŽ*YÒ1Ìb$íóÉa›ý—Õµ1£À9Dû«®TËÔV²ÃÜHàÙD/ÞGÂ†®_¥‹<OÓ”,õš¯`MãÓØ\r„81;‘•4q7	\\tÇþg™­Ê´Šb™4Ãk9\ZƒßàH6ËËÊg8bÚÐ­Azá,Ív´…6ØŽh:tö*³´£¯BJ\\ªJ–Ñ¶S,iÍ;EÌ¿…M¬[å ƒ±à”Œ„6žBËhäLZ+GE43ü€e×“%Z‰\\NKOÑ$6õ3ÿ¶¶ðPïÃåý4,©­#pmC“ÖÖ1ÌüÛ\Z¼¢À|p×T¢ù˜BËhèLZ;G©š9pn;6“\0q¼ÉŒ\'Ùå8“	$¶ð\'“Prq)]obè0=h¡uÁòaÕÃcjQs3Ê²@D}jHUÜñ\rìL²¦	»Ôñák¾uþ+ƒUqìÇÜ`¯y&ê¬Ûc,=#´ÜŠf‰ú#kƒh/³X‚¦D©d¬k!g¹’(†ß\ZàËï5šíUØ5äYGHÂ¹u$6;è±±‚:™E}ËU¼±·¿§œ|û¶û/¾%Å.`gî|‹ˆ™Ìã\"œ,K¹ˆ\\<m‡ØÔŸ¤ú§Êþ·Spž¢d¢M$“Y¼É¨™Dœ)KÌÉè‰ÚÃ`>qOŠD-³\09H&yqYâá`I#%°ê•Ðy®µžb;[\0…«ó\0DÆ2=qGïõø–‚dÒQQ©)V…j\"°A„h“ó²îÄõˆÉ&AüwóòÉs“Í0¢-Ib\ZêdÄ”ý	~2HˆÃD=Ø\"#Ié+8(³¶å÷ø3.–Žº5Q˜¾)æ²yfºÒð_lj‰w5ÄHDŸ¦ÁÏ@5ÒÅ¾á¹\nDU’IciúT£–Ç4;’Ü¹S4Ç·±¡xºgX;ðaË€OtÐ9ÏBK,}zdæx;zõà²Ò ÈÈ>‡’£@€9&FF,Ç7¼Ý\'\Z±®9—€>µ‚ † ‹À†ZŒ û9ÓìM0‘¼\n–©‡¬3±¥Þ¥Eh›a+ÖX#¢÷úÞ$¸®bäq$®bN’D¦alÛ;À8«Á4¼qûD0Ýr=lð	àvÎës­QŠø¶øþl›ÿn¡1,	âO@«t°ãéƒÒÙOþ»AÝ\"ød(o™àK¬¶ÒÉ%C—8Ã$Å°	µ!«É7n1Q|æ(»ïnuþ<@býÁÔ]üx~/yÙ–³^Å¡˜÷ø‘Ô|&{æ–ÂÇ±êéC~}>Oß˜ë\0/¹w‰ÌuŠB,ï[+KYSÒí0˜É½R©ÕÕ{à¦Â¯ï¬ß/Ø¸Â#:³±ÁîDu&¾±\0QETÛU³²ïUaðyCA\0aßëS‡õûmë VÔL)|øæ‚‡Ö)Ã@p,¿û{LËQ:&j¥\\,œ\\v\0}³1‡/cbfãdì¡ –µ˜ø¤|\n.å\nÿª\\ßƒs¸ðÙ?tõxw+‹ó)6LÂcç\"\\—u.Í2lNÂº	 2Û\raŽ¾5¬ïëšäi·ç(<ÎƒàëU½¨“gí~ÂVò·¥«ÍÆ¶í.>øÎ_¦¶o‡¯_Cx{Eá ¥†à=B8‹M0:Ò?°¾(.\"’ÆÆ`t¸-ÛI·E¼Jðúµðk›Q$¥=ŠC±¹k™²ÒÙ­ðkö‰ãPÇÝ\rŽ1ŒÝEÃ·á.~P0õMNXÄ\r˜7—A\n\nR²€ŠrŠh†/·Å‹V‰¦˜°š	S¬\ZMñ š	oƒ»1Äé¾¸N\\–	>…Å÷¹ð¶}†cTººAÊáÊ]>ïä.,ßmÁ[…|¶‡øê	Äˆeã7Ž\r¾<¾ñ˜\"BlÜÕ.RŠ<ÎÍî…5¢2D¼Á$là\nVUê[àUEhÆ„l# 9àí6\n–`eÞ\'˜Ãõ=ÊŒ;õ™äª,·Ë°ÈfÌÁÔQaOík°ò	SHF7CÒírÇ ê€5fø¹M&ÊÐ\'‡ôtøäc4ñÑÌÀVÏg-º­ÐCØØRË?iLÚŽiî–”=Ýý1`¢ûÅ\"­hæPÏ6iX™°-Ýíh\nö-xc\rÃÍyœK°£öaÙ	~¹8Lâa¸nÛF3Kv;»È6öÇí‡[„\r»ÛD1¼H~scñPªA°UöpçkFð•Ý~qSn«\ZóÒWgš¥[BUùÊJ‹¥ XJJ»ây¬ëéª+>Y&Â›aÀê\Z_¬ªÓYšªòF;ñ\r‹`{M“2¶á¼PŸD›©‘À†É1_£2&È·ôwæSa›µ®ê€”kŽœ	5?åÌ¿mÜÅàt‰Ã¸D[>KˆÏAÄ+Þüë¶‚\\\n>}•OÂAdZnŸáªàµ´‚+©!2ßbf&7ð«ƒT0Â²g¨«07€Ž…±í-²(_q\\·lûCwûÜ™zhµP—!¸j©kÐ‘¸–Bõ6û¦ŒýµYð+Ñ^+?2„·ÂRðÙsÓô”–h9ìÜEG	À)Íç‰Ð³^„¶Tæ¡³oH®N¹+-éåb8açxÜçç+\0pOÀ¼\0ßE\"y‹VñÄFxC¬|Q;HÚšÅ üªm8DtÛÝó˜›íËÍ—NûªÏ*,­Ãï<ö™àüŽÉf lbè¦åfæF4cv\n¼¡ôÂ•qúœook©ÇÂù¨â2¿Cc~Çò‰ÑjÌ¾.Tž7DÒ6_1è9˜\\¾^ \"	ú¾\n«l¨sËÌ§Ó¡Ÿ?Rýë÷¾žþGd ‘!’R.W‡Ð6,jYÔ+w©oÍ`C‚sJ<g+p–Ì\n0TàN£iË‡“N(,ÂÈî;áL.\r‚PÛð{ºžêCAt“&\nj`oÒ?†ºû¬AÑ0–^ûúÄ°KgWìÿlÞ-tíG‰?Æ_\",ëf¥•.ÃÌób:7C–_R®’Ý2‹0·B¶-r‚–ö|Ne¿tÆËlÐÍÅ­îH÷Ô¾Ø‹ÿ6íÿxt@¬§\'ÊWïö¹¾sÓ¼¹;¨Û/–yÿŒ[·¿ÌFmÜ2ÎñIkì?X\'¥„jh„MD­`ŠûÝõØô§wö˜á£¶Á\\æ>54˜ Œ“5LøèR•˜áºƒí>¶|Û‰qÞ»j¿GïíÃêðþÐ\"“_õGÏ÷[ÝÃ¯ÃÑ…î6.ÆÛé…zå¾®å|ŠŸ–8ˆDâÜ\\ÜRª}U¯{5ëáù—ÿÛýøùõ£ß¿žÞ\Z§÷£ãŽy¡¼\\ŸúîznzJ^ºŽïŽ|Ó÷ð(ÆÏäôçÉÓWZõÊÄ4ÇýÞ¸m^¶ß÷:õ¶§8cíUÑžÉsÃ¯ý^/×…”<õ(Ú˜ÕŽ1t}eÝÔß÷½ùryñôtqzþË3«æÑÞÁËsëà¸v±·ÿf>[æãh-C!|Jn<Æ¹…ßâÜ\\\rµÆmõøäõáý®úõ°qLùVßµo.Ü›ÃÚÏú{Wó†êZnBø\r¹ñbì<½‘ÃA³Ó»ÿ}=ÜëºZ]o}»¿rk/·“zíÙ}yÿu;üyÑzx:IÍŽ·)?ŽqôÓÿæßÛóì}ã©þÞ;\"êš²ÿvxôx`¼˜~ãÏQë¡¨|üîì¥çÈÁ)y\Z9¸‡X1¤é#Ý½ün—ßºÍ#ýk÷í»]úzà_Z_÷òÛeýþñ®>¨®e(„ß›xF:ŸÜ_ÿ~S[í÷ß‡ÏÝçÛÇ–N•Ë\Z©wÇû§]eïdp’š·kú0øÿÿ7#\\º^ï\0\0\";s:5:\"title\";s:0:\"\";s:7:\"headers\";a:4:{s:7:\"Expires\";s:31:\"Fri, 11 Sep 2015 16:53:12 +0000\";s:13:\"Cache-Control\";s:25:\"private, max-age=31536000\";s:12:\"Content-Type\";s:24:\"text/html; charset=utf-8\";s:16:\"Content-Language\";s:2:\"en\";}s:15:\"page_compressed\";b:1;}',1441990392,1410454392,1);
/*!40000 ALTER TABLE `cache_page` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-11 13:45:51
