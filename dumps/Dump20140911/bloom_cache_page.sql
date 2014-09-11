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
INSERT INTO `cache_page` VALUES ('https://bloom-dev.meei.harvard.edu/?q=js/admin_menu/cache/ad44d0eb84f69d01b2949da1e2117aaf','a:5:{s:4:\"path\";s:52:\"js/admin_menu/cache/ad44d0eb84f69d01b2949da1e2117aaf\";s:4:\"body\";s:7114:\"�\0\0\0\0\0�]is⼲�~��[uj��eH2�휙�bHH�6LY�~p	[��m9^X��Z���f�RA��tK�j���5}�t�G	k�n�Mb�%�\Z�u�IeW�H�cPj�52diD/��3ĎV&���8��5ݵ\r���G����E�����M����|���L]�֔��P[�#��zO�0\"c[\Z��=�Q�!��\n�foI�r�=T�����KP�/�>��[�H��W���u��a�Jh�k^�Gi����D��=�\\Q��P��{�Z&U(���p+���q�?P�{��*�\\ٰ�5�t\r��U��ɿ�i�ǣb��?�G��>8};6�?�{�r<|���\\��תy������Sg�&�_#��[��Y�Ձ�)�Pq7����(9��>o�p��L����?����C��֏�o�����~9�\r�Fյ,W!]w=��<o�TL:�����߻7�չ>�=;�y!wM���#>>}�o7g����g���\Zd����ܱ��sc�U_�er:x��뻇�:�5�হ�V�ǽ�c�SN��eǸm�^�[����k<�-��moc��{��OΝ.V��U�>�k�w�������w�������h-ww�Hs��}�7^/N~�����N��u�prxxQ���j�_�����w��]��2��=�ۋ.٘3�O�8gw���e�x|������[��ݟX��.�;y��6�}}ת�[u-g���������8o�ϋ��ϪY��:hO����d�{\'ף����up�>�����u-om��?1V��V�e�s2$�&SL���iP�h�A��������[�|�uHV��(��+�j�{6ti��GD֕��lȽ�g�ؼj�\Z��2�Չ���NE�E�C,�I��[*7�Ӵ��3H����%�~��� �G60�\\m�`1n�T��-L�\'�AY�i���u+�o�ؙ���D$�hs�v��!��aʰV�H�יD �]/�r=6*��\r�DA�������𢾅 �^�]��j�\0\Z�dD�uŸ���͕(͜7�[�u\r�<���{�I�6I��Cl�xLc<��n�vv��𨈻��G{=��Q�l�1��=`���O��U\'�ǫ��u��Ϸ��_ý���\Z�\'k[�\\wy�h\'I5Vz�}ϳ�]�h�oc�uzt\ZN�!.`Tl��ի��?�s���\Z�T?��0g��A���w��K��Zl�i�W���R���G���O-��^�B5T�yj��j�G\rڣ�7G���L�5t�s%�R����� ��t݇�H���;���1@c02(�m��Q�����?�K0��9d���E94���9\Z�$��[s���6�L��DJa�|z\n���H�z�[C��=������6f2�6K��J!@�t�$Z���K�$\n�<G!>&���st�Xp	����k��\'ъr��AF;���7�j2�-C��\"t]�Rǜ#��Q��u�/���(.���4�״�Za�R0*+�tf����,�ω�f��؉���mj�\\E�1sf�M폋D��� �{j_[ ǲP�%�x�s$ 	�e.��I�Q[<C����1��9QTw8K�1�A���MЉ�4���c*�P�9d�\\<�b#�#{@Y��皳m�gs�	ba�\Z�()�#a��(Ha�w��J��qK>Gxq����i�a!/ќ������eN2�̲nM�gCI�R3�b��R�7f**�<661^V·�b���I$�)\"5dr�\nv���\"�|=bZ��=��O�)�S�P:`E���%���Uʇ˰�\'J�Y���lx�2��9f�\nr��P#JK���m]g��jUi6\Z)�1�	��2���AQģ)������߁MN1�Π�����3�||�e��:�~M3�u�x{p��m�ٙ;\nfY�	��@G��>��թk�z����e�i��S�p+܃��6o�9�����Ĥ�ºL_�Y@ۮ����-v��˫MM�����s��\"-U�dѱ8i�	_+g?r��#�h�)І\r�n%=F���В��fw6n^obÆP0�\"�ж�� �a��Y1��F���8�����#�����\n�Ǔ��ʵ�+�2GC����Md7\\�����]1�Z���1!�FW���-����-#�e\n�ɰ��*�t�{�\r3psU�P!���WpqJ;����q��Uz@�@�qrEȎZ/:�B�3\'Sĥ3����A�G��o��2�d��f2�.|Ќ�aĜGϧ�.P��m���B���q\Z��ӄ� ��ܺ)/��ƈ��M����T$w��\"��P�|�i�F��tvVFU\0qE�iiw�W����Q�p��sY��عY�B�&y�r��O�����q�2��o���c�7�@��߈v�#AL��3�\n5b�LI�c&����r�(	��6-KY��oN(�l���y��H9{���d[��n�+l�X!�Q܉i{�d�~�T����\ZE)A���(�+��@!&Da��:\Zq@#&����\"�Î4b���Ub���uB�������\r#3� �b��6/i��d7ʱ�E���@�H4�u��1]N�X�b)�G��T1���\r�R(����(��(ؚ(��G��)X����٧�ϨjM�D\"���uld�f�8� ���z��]OW�A�A*��?��Ub{��&��{�NXg�l�x��v}R?#�E^_w����_3Ȗ/֔U�ɞm̆l��1z�<aU���)BØ�\"݋��Uc�|��0O�%���;ɋc���~���-�۳���g�+�Y�I}���!�9�)��	�`B?؝�;:5���j0ڰT�_�(���P,����G��cN	\\�3��J���ۜC��r�j���bTh;T\'�MO��wP���H�\n-X�d���������j�Ŋ6���5�v&V�8`@T�[lHR���-�բ�J�L:��˹*TV�Q�~�``w\Z�{���J\0W�*n X�`���D��!S�+|���?��<u����+�(FKV0�3��b������\n02��\Z�#T��;���)��E�F����M��+҈lA���N��a0cV��S��u~a5�Q�(C��q뎭	��\r;pG!�)o#���b�d9i�rv�E�n�m`K��0T�΄���i��by��9+TkV�Q�֬``wZCM\"nۄ{�M\".��[!�D�U��lA��L����\"�b;�R��Pt[,h��o\"5�<���������G���+�(FMV0�3�a���y��q9�$�~D�aG�v&[�h��\r�!*u����HF<987���Y)T���ɴw���So���\n�ℋ~�pA2��ܙ�m��S���3�t��_���g�*�9�ň|��΄�p�UaQ�ET߁[1�r�bz��(�N�߻oy�o�sR���+n�^�ڙ��W�$l\Z�ΞDޚ͝�A�p��6��,�,�A�:���bi;Ӯ��!eqs3�5]�;*Q��� 4�ՙy�\"�R{�iڧ�í�9g�Y�`�ʳ��b�g�S�B\'�_�[��-V\"�	<\"�[S>.�\"&|��\\�d/Fpg�����=�w��Be	�\"P*�E�蝺��O�\'T�k��U�ʲ��e�p�Fn�(�R)�5�$��D�w��%��XOV�1XO0���Cxӭ�r�X�ϊ�E$WI\'Q/P�䋐|\"�H���ǅk�2ޱ(�i�2��ta2���ua�k]��N����U�<\\�pz;SA�x�����Ѡ�a`w���/����/���θ�ª�%��#�G���ؙ�?v 菿dܶ	G��7��D�C��!<����.v0���/rpn�*ߕ�Db�����.ʨ[����ߔ@�+s��ab.�����N���[u�|�F*ʒ-E*����l����TO\"T�4�X�M�Q���wB|����9� ��y,߮�[dǜ�[H���X��4����t6\Z�3U7�F;|\"C�2�)���{5�����:1������M4W|�\r>%��L�V��\Z�nRm\"���7b��f�)�+�Y��n\"�J�5[�!�M��!T��S����$��1T�6��WNk	̥�&�CsR5唩P�|��{�Q�#���tqX��#p�ڽR�g$\"���\\�~FM�#eч8�t���K֍E��4$P\r�:!A2kA>��C�\n�ڦQ:�ռ��%p@�(p�E�@��9�d��0��G\\F�g�@2J�Cd�4�.i�*Y�1�b$���a���յ1��9D����T��V���H��D/�G�_��<OӔ,���`M���\r�81;��4q7	\\t��g��ʴ�b�4��k9\Z���H6���g8b�ЭAz�,�v��6��h:t�*����BJ\\�J�ѶS,i�;E̿�M�[堃�����6�B�h�LZ+G�E43��eד%Z�\\NKO�$6�3����P����4,��#pmC���1���\Z���|p�T���B�h�LZ;G���9pn;6�\0q�Ɍ\'��8�	$��\'�Prq)]ob�0=h�u��a��cjQs3ʲ@D}jHU��\r�L��	�����k�u�+�U�q���`�y&��c,=#�܊�f��#k�h/�X���D�d�k!g��(��\Z���5��U�5�YGH¹�u$6;���:�E}�U������|���/�%�.`g�|�����\"�,K��\\�<m����������Sp��d�M$�Y�ɨ�D�)K������`>qO�D-�\09H&yqY��`I#%����y���b;[\0���\0D�2=qG�����d�QQ�)V�j\"�A��h�������&A�w���s��0��-Ib\Z�dĔ�	~2H��D=�\"#I�+8(�����3.���5Q��)�yf���_lj�w5āHD����@5�ž�\nD�U�Ici�T���4;�ܹS4Ƿ��x�gX;�aˀOt�9�B��K,}zd�x;z�ಝ� ��>���@�9&�FF,�7��\'\Z��9��>���� ���Z���9��M0��\n�����3��ޥEh�a+�X#����$��b�q$�bN�D��al�;�8��4�q�D0�r=l�	�v��s�Q������l��n�1,	�O@�t�����O��A�\"�d(o��K�����%C�8Ï$Ű	�!��7n1Q|�(��nu�<@b���]�x~/yٖ�^š�����|&{��Ǳ��C~}>Oߘ�\0/�w��u�B,�[+KYS��0�ɽR���{�¯��/���#:����Du&��\0QET�U���Ua�yCA\0a��S���m� V�L)|�悇�)�@p,��{L�Q�:&j�\\,�\\v\0}�1�/cbf�d� �����|\n.��\n��\\߃s���?t�xw+��)6L�c�\"�\\�u.�2lNº	 2�\ra��5�����i��(<΃��U���g�~�V򷥫�ƶ�.>��_��o��_Cx{E����=B8�M0:�?��(.\"��Ɛ`t�-�I�E�J����k�Q$�=�C��k����٭�k���P��\r�1��E÷�.~P0�MN�X�\r�7�A\n\nR���r�h�/�ŋV�����	S�\ZM� �	�o��1�龸N\\�	>�����}�cT��A���]>��.,�m�[�|����	Đ�e�7�\r�<��\"Bl��.R�<�́�5�2D��$l�\nVU�[�UEhƄl#�9��6\n�`e�\'���=ʌ;���,�˰�f���QaO�k��	SHF7C��rǠꀏ5�f��M&��\'��t��c4����V�g-���C��R�?iLڎi=��1`���\"�h�P�6iX��-��h\n�-xc\r��y�K���a�	~�8L�a��n�F�3Kv;��6���[�\r�ۏD1�H~sc�P�A�U�p�kF��~qSn�\Z��Wg��[BU��J���XJJ��y����+>Y&a��\Z_���Y���F;�\r�`{M�2���P�D������1_�2&ȷ�w�Sa���ꀔk��	5?�̿m���t�øD[>K��A�+��붂\\\n>}�O�A�dZn��൴��+�!2�bf&7�T0²g��07�����-�(_q\\�l�Cw�ܙzh�P�!�j�kБ��B�6�����Y�+�^+?2���R��s����h9��EG	�)�����^��T桳oH�N�+-��b8a�x��灍+\0pO��\0�E\"y�V��FxC�|Q;HښŠ��m8D�t�����͗N���*,�Ï�<������f�lb��f�F4cv\n���q��ook������2�Cc~���j̾.T�7D�6_1�9�\\�^ \"	��\n�l�s�̧ӡ�?R������Gd �!�R.W��6,jY�+w�o�`C�sJ<g+p��\n0T�N�iˇ�N(,���;�L.\r�P��{���CAt�&\nj`o�?����A�0�^��İKgW��l�-t�G�?�_\",�f��.���b:7C�_R���2�0�B�-r���|Ne�t��l��ŭ�H�Ծ؋�6��xt@��\'�W����sӼ�;��/�y��[���Fm�2��Ik�?X\'��jh�MD�`�������w���᣶�\\�>54� ��5L��R��ẃ�>�|ۉq޻j�G�������\"�_�G��[�ï�х�6.����z微�|���8�D��\\�R�}U�{5���������������\Z����y��\\���znzJ^���|���(�������WZ���4��޸m^����:���8c�Uў�sï�^/���<�(ژՎ1t}e������ry��tqz��3������s��v���f>[��h-C!|Jn<ƹ����\\\r��m����������qL�V���o.ܛ����{W��ZnB�\r��b�<���A�ӻ�}=��Z]o}��rk/��z��}y�u;�y�zx:I͎�)?�q��������}���;\"ꚲ�vx�x`��~��Q��|������)y\Z9��X�1��#���n�ߺ�#�k���]�z�_Z_�����e���>��e(�ߐ�xF�:��_�~S[��߇����ǖN��\Z�w���]e�dp����k�0���7#\\�^�\0\0\";s:5:\"title\";s:0:\"\";s:7:\"headers\";a:4:{s:7:\"Expires\";s:31:\"Fri, 11 Sep 2015 16:53:12 +0000\";s:13:\"Cache-Control\";s:25:\"private, max-age=31536000\";s:12:\"Content-Type\";s:24:\"text/html; charset=utf-8\";s:16:\"Content-Language\";s:2:\"en\";}s:15:\"page_compressed\";b:1;}',1441990392,1410454392,1);
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
