-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 07. 10:57
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `autovasarlas`
--
CREATE DATABASE IF NOT EXISTS `autovasarlas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `autovasarlas`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `buy`
--

CREATE TABLE `buy` (
  `rent_id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `vegosszeg` int(255) NOT NULL,
  `fizetesi_status` enum('Kifizetve','Függőben','Nincs kifizetve') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `buy`
--

INSERT INTO `buy` (`rent_id`, `cars_id`, `users_id`, `vegosszeg`, `fizetesi_status`) VALUES
(3, 7, 2, 45000000, 'Kifizetve');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `car`
--

CREATE TABLE `car` (
  `cars_id` int(11) NOT NULL,
  `gyarto_es_modell` varchar(100) NOT NULL,
  `evjarat` int(11) NOT NULL,
  `szin` varchar(20) NOT NULL,
  `uzemanyag` enum('Diesel','Benzin','Elektromos') NOT NULL,
  `valto_tipus` enum('Automata','Kézi 5 sebességes','Kézi 6 sebességes') NOT NULL,
  `utasok_szama` enum('5','7') NOT NULL,
  `ar` int(255) NOT NULL,
  `images` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `car`
--

INSERT INTO `car` (`cars_id`, `gyarto_es_modell`, `evjarat`, `szin`, `uzemanyag`, `valto_tipus`, `utasok_szama`, `ar`, `images`) VALUES
(1, 'Audi A6', 2023, 'fehér', 'Elektromos', 'Automata', '7', 3000000, 0xffd8ffe000104a46494600010100000100010000ffdb0084000a0708161615181616161819181a1c1c1e1c1c1c1a1a1a1c1c211c1a1c1c1e1c1e1a1d252e251e232d211c1e2638262b2f313535351f243b403b343f2e343531010c0c0c100f101f12121e3424242b3434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434ffc000110800b1011c03012200021101031101ffc4001b00000202030100000000000000000000000203010400050607ffc4004c1000010204030405080608040504030000010211000321310412410551617122328191b106135272a1c1d1f0142342b2e1f1153343628292c2d2243473a207445383933563b3c3161725ffc4001801010101010100000000000000000000000001020304ffc4002311010100020104030101010100000000000001021112213141510381f071139142ffda000c03010002110311003f00f3e92805944022ec7ed70a1a77c6fa46290c12192a49a20a484faa033f0678e7b1dd120312ee411b9f583968ce9012a0162ac5dcf14906a785e3cf94e536f4637575ddbe54c96a51565ab36548000ec2c4da34f8e479b5829145805ac371f777c62b153582565446fcc3b466b8315f15d25b02a23ec851721eb131c6f9ad65963ae90680024ba14fbde83e690b08bf7fb8d2264a96839564b31604541edd20953b3314a775ad0b2c4962c6070aa209400521897fde565000d4fc2071726ac19ca5c25dc96766ec060a44d524951510376edd476d4d39c4ca96a5679a9cc72105c2490d9bd360068ee2b58cf5dedbdcd681b3b30037281ee829094a96eb7614dfbc86e119879a54485512ed4604125e80905af68248625c5fc7e5e17bd5ff00ccd1b8e429033a08caaa3b754d6edf2f05b1dd79f3127a2c1cd8a804bf1b8f911889ce829ca0a554cb4f69e17df789d9d30a1649c99541a85c5983773c3c698b795d831586285a9086a10dbc0eb77d23622524a01cc4160149d0b136361a76406d20ea4cc48b84955a8588ee6f18142ce4a0142c43d5eb57dd589bdc5e3a661e64d29259214ca09a8dc480efc7c635cbc49cbe6900b80ca20bf3481bcc1cfdaa495040604016b30cba6acf58761f67ad081310cf4396b98002a69af278b26bba5ead7fd1c2831cc90465a8a0502589e6ed5e31557b3ca141c116201afe6236b88c63a8e7019601614a80edceba44e114e8de0b841b942858b767b758df2b18d4ad57985b0502cdabb1adadc22de0e6ac24d68d722c1daa375e1b8ac6950095a492925f2e5625540525f7e9c22a61a6e42402f4b9d2a2c35ed8bd6c4ed543692979d40904051b5470ec8192a52a828d47e67746e31d850425697e91215a247a2dabd0d0c56170c90900353525ef179744d14a94b2f994eddeef16f0c84282b387005f57e1c214b985d8392280d58718b326504a5d47a5700dbe6b19caf46a772178419868f77b73e709c5ca29604d08a1a56ed6f798eb709b3a5ad28597aa42b467203dc444dd9728a54e5742351bf94627c9aaeb7e1b6747252332ba2e49adcbdb4ac59190a485b852486dfa861ec8df27644a0504660ec7adbc8e1c61b37674b2a5b8347d78c2e709f164d2e74b0371aaac557bb9ed85cf5289494b945884d35228778e31bd18197943e6626cfb8963cefdf06767ca51524b8001342db8e913945ff3beda5c4eca1910b4ae843287da42b5a7683db1af38b5860ae9000849ec66ecdd1d29c2a132faca3bc139acf67ed879d91273f54d457a46e093ca133d774ff2b7b3949332ca3a51f51bb9c5ff00a5f498b14917d74f846e51b2e42415049a103ac7501fc63266cf924a3a14501626c617397c2ff9653cb4f3cb248fb2e0e8e296275d4c6ba64ead5201a59dad1d4230529e60ca7a0037495c78da911276648524128ad7556f3c624ca45bf1e57cc72eb989345025ac41782f3419fbaf4e6d08cad650ee87a261058d74a501ec6df1dbf8e06ac2d4c0addb7316e7e1580521601395556eb021fe1132d414e5c8ddf9ead0dccbf49240b124e9ca1bd2f1dab2a61594e6593969424902f48b09caccd948dcc697abd49e304a94e903c2b7e7f18c4610e501d2fad8b57d1a87872871ac32035169d287e6bc4f28b4bda13a623cd159094268948480bcba92fd2e43ba2a14966637dcc19ecff08912cba6dbc8cdd953a44d43aa1129602826a9d4800b16f9d60d055663989cc34a1d32f7c44c4a924e522b6de3896e30b5ac3f483bf17af1689c76bcb4b484e5752835cb760ddad4c4e1d59d0c7addcec5fdf08ce5ba079b1005aa1834439d14400d56f7561c693292b638e59c89005583f0014f7177f84061d495051059fb2c001da6b51c22a9c516233e6019d807be9623944a147328a50901b310490101372e4beb18e374d734990006423752a492455c8eeed8294b5a4a400129d5399cf607a444b582958ced4dc4eaed9ae2c2b084adc84b5947b5ec0f0a931757b1b9dd6b1f9097cb6a806c5c57918d6ca53387e8b92017a1f9d636fe714a36cada50d34e20d2b14b14942dc821c119cefadf9df9c6a5e8994d75580a4640b2011d24a8b3e525d49503da7be2bed1c2041052ecaaf36671ef8428b66407292c52ab53ac0107b7b5e36922666424a5dd0dcf35588d19a917aceac6e53a52d0a4251310a0e0f4cdd2ecc48160181f1d634f8c92652f2280252038162f62fb8d23698edacaa650339cc0f458906da5f88f64271f342d08248cccdc72b59daa01f7c49d06af3be86a37ebbf943178852832abb9fbb4a4024568fdb124e91743add9aa6932c0b654f84066a2f894f8986603f552c7eea62a89a92898732590439cc1831abf18e36757aa5e9068b4b2f609f1106baa975b8f798ae31090258cc97504e50e3a5634df0427a495b293d11d2a8e8d49aee859499434a3a29e055f78c10a2d5c527dd15ce2921083993d251cb51d275500df06ac427ce2c05025293986e700d626a9ca22621e59ad8a8f1a0545f501e7436a3dca8d52f188f359f38caa2a00e84b1a7b236066813d29719b2e6cbab31ab42ca4b0a427ead7eb8f04c4ad43ea4ee4a3c209093e6d7eba7c1108557cd72478448b7a225de717dde2b86e16674076fde30a960fd7721f79705851d114dfe262a6dc5dcd086035d3e5e1e805248046e7de3b21f8bc1a9090a60c7837c985cd96c58b5b4b57b8c77dbca7489214424292093ad01e140f0cc4e1b21c848a31a39be80811565a3bb70a43d49433052c2a8ef5e76d3b21e5a3558729a258d01a1cc52f5a8d0f0e3090851199b56a5fb4764589685a08c8b209dcd5e0c687b442d740ee7c056cc2fa188bd8689aa34b31b59b9e6e1af0889601fb4e45f306f68312a20be6ca14185004834b785452f0b59ca588a5ee0f816859e897d8529636a6f0c3b8c3109ccec4d8bd9bb043112c5728268ea259b466d62518545dea0efbf796f0bc370d152a4f4802a01dc0b54ee6142f4112a4744bba2ac0f494e4ee3a1f968123a5d26215421e80d5aa6dba918a50601830a50b971a7c98d5ac49a62665814d4312abe66b1ad1b46815a12473bd1b5ee316d391696cc28e1896bd81dd568044aab125b4d2b489b5d5bd8890c9346501a1d5eba58fc205ea3a4c3d82b7615a45b1877a1705ae6c7d9158a0d3e7be2a76179f00aaca0e6ce3787e97480a5b94358749a8aa383435f91151408ddf0f7186cb55466efabd85f5b690d046230610a152f4700b8fc69ee87e026282d80749aa86ba0a5b78899e924660e12c47778e968aa89852b0a05943578778966a8b69a1485949eabb8b39edbfe711226a804bd426adccbb0f9df0fc5ad4b75170c1c03baa48e773da6294d5be4bdb9bb1e10856c67941095240672e35ad6113c32aad503da290a424ef64beb7b6e009864d059ca83060900826f41c210bb75982fd54a6f413e11cea50461f143d259fbc23a1d9c4f9a45ba897dd611a8cbf553fd7f788e53a5bfd8ef7ac9fc54520e6c17047f4a605092f8ee23fa5517d69e96138247dd4c2822b8ba69ee5c6f97efb678f5fde95163ea307c2627c62da3fcce28ef40fb820327d5617d74f8c5a48ff001389e281f7530dfefb35fbe9a7586c0caa7db3ed2b8dfb7ffd14ff00a15ef31a9c5a7fc1ca1fbe3c171b701f68a7fd0f7986f72fd92759f4b58651f3533d74f82612bfd9f24f83c3642ba0b1fbe3c130b989a4b34b0f0ac7077a3c2fedbd51e2b82c29e80edd78988416f3ade88f15c2a40394537f898a8e7e7e30ae514a9f305034032ee77d393354da288ce59db86f3dd0d9321dddefa1e04bb6ad0d324f01eb51df7523bee4ecf2ead44b98a2c902ce49a56d53ec8b333099403992cc5448214c34208630a54bb825b9397e10844b1aa8354d786ee261169e12a5b3234a572e6a3fda37a46225924e549040abdc369584aca4754bea2fd1f9e11b3d9b855ce56596852d5a9b0037926c39c2cf4b2fb535c950bb16de2a7be2fe0f60cd9dd34f4503edaf2847613d6ec06363930f87a531539377fd44b3c7d350ddca82f1571d8e9934fd62ca8eeb2123d14a05071b962cf78eb8fc77bd72cbe49e0e5e030483d39b367a817cb2c0421f76722bec867e91909ea60e5ffdc5ae61ee2e3ba35663121cb47498e33c395cb2be5ba93b615d10991864b90001286bcf8027b2360768affe9e19438ca6f031a5c02732f90f6aa83fda0f7c5b5cc24d2d1ae8cdb5b293b4f0eff5f849691aad084a9239a40cc077c5cdb78ac161d285af0be71133aab4250535b024a8338b68639d2b8b7b2a7a066c34e19b0f3ba2c6c85ab71d013a8b298ef312c8b32a84edad987fe56627d5f363c1718bc56cb5fecf108e4527facc719b7f64af0b395294e45d0af4d26c79e846f062a2435cc38e2bcb276f3709b348a622721fd24150ff00688427c9f90bacac6ca56ece95cb3de4472b2a60f4a90ff3a3eca8f160c7b77f6c4e1179d6f713e4e62427284a26a34289895b6bd52471d1eb1a2c7e0972c80b429038a541cd75b1f84741b131eb4228b3db68e9f09b582c649894a9268694318ff3f4d73dbcd6797000a1d5f95fd91532375869dfd91db6daf23d49495e189988be4fb691fbad4586d0311b951c6e5d15a1e37b107badc231ab1a976648cb95f2b29e8e9cc0d7bc376c58985ae59f5cac4ea050539de233103a9952a05885900e843022aef710a5f46b44bf55998ef241d7468cb6ebb65a7ea91c1091c6d1ac6faa9febfbc46db660faa4177748d3e7ba352a3f5388f5fde2394ef7faed7b4fe0967a7856f447dd4c001fe6f97b9704b1d3c27a83ee88140ae33803e0b8a9e7f7a2d5faac2fae9f18b08ff313fd41f753083fa9c2fae8f18b921be9388f507dd4c3dfd9e9adc48ff072fd7f72e36682fb447fa1ef8d6e24ff008397ebff007c6c65ff00ea3ff63faa2ced7ed2778b5287d54cf5c78263163f523780fdd0684fd52fd71e09815aab2b8253f76393b265a5fcf8e5f7971321032275a5fb4c210b3f59c5a9daa8b1844744413bb935c952ac92db9e9f8c0a813a77b5b8bc394580282dee8dde00cb9d28266212568a1554120d412431af6d63aedc2f473ea36394541a801c3781e716a460d73484a11996df640d4dc9d3b62fed0d968082a40b7135a3d9f4af38e9bc97c12a5c919982947352eda6626e6378e3caa65758ed47657910b2c67ad081a8490567ba83db05b5e4620bc89128cac38f40a734cde54a05c0f69e1af6787286b9075b7c21b354940cca5b245c9cb472c2adc63be38e31e7b95af3293b326a48064ac2468134a583084fd0275cca5b9a9e828d4d4e91ea92969558beeea97ee30ef34370ee8da3c81785982e858e6857c2169a3e6a1b07a5f9c7b11909f4477080561d1b83774079a6ca03a47893dc903c5e29ed0daa9967297cccf65357908f5199b3a52855095730fe31a7dabe4b61a68654a483a1400850ed48f65a09a79b7e9352ad3258e6149fbc22dc8c5858295a90a71f65495781a6f8de62fc82465579b5cc4a9ba39941497e219db9452d8be462fa7f48584b829ca821ee1c9510c2da7e113ac352af993fa470451438991d526ea1a02772806e601b479e4e25dacd71a83b88df1ebbb0fc981865a5689ab5000a485149749760481bd8ff000885ed1f2270d3a62e6ad2b0a597212b090fa96e37e64c15e4a0c38298b8e7dbf9c7a67ffafb09ff00ba3f8c9f08857fc3dc368a99fce478c51c261a71496d08cc9f78f18d861f6831bc7567fe1ec960cb9b4b32c167e62167c814693a727f90ff004c055d9bb6148343f03173696cc918d05496973fd26e8afd703adcfac3d9103c8729eacf59e69947de21e8f2627a3ab315db2c1fbab112c948e1b19835c85e59c92950629a05a5405332490ca1edb388a014b2ed41c8a5b906bf18f51c4e096b9665cf40989e2928503e925598949e2238fc4f9313c2ce40148d33a8057f12474491be8f1cae1e9d265beed96c8fd4caa1ea0a77e91a9fd9623d7fea11bcc260e6a1094a925c26ac7356bba349325a932f11992a0eb70e087e90af18f3f1b2d7a794b218bfd6613d51f7530b407fa6f23e0b8c2ae9e13d51f75318915c5f107c170f1fbd9bebfbd232fd4617d74f8c58909ff133fd41f7531549faac28fdf4f898b723fcccff0050782227b3d35d351fe111eb9feb8bf2bfcf9ff47fa84529bfe4d1ebff007c5e943fc7abfd1fea11a9dafda4ef17a59642c7ef0f04c2f2f52ba27c0c3103a2bf587808950fd5f24f818e2ec521155f678aa1f8794328a8f9260103afc878aa2d6100c83ad12d2471a90a49048247ef53b2d78b49c99685685681c36fbee849e906528a83bb72ef814ca4eb5abea3b1c18f4d8f34cbdad6cb0b98b4a5654a4935b014a976ee8f4094a60e4b0152740d726391f2770e954c77cb9534e24d3b29ee86f9738d52652242491e7492b23d04353b49ed66d63afc7351cb3bbad923cb7c285e5cc542c5612a291db7ed668e833a5690a4905243822a083505f58f3294932251590c0148ca963450152fd63d2b52d1d5f9278a62b906c06740d002c5413fbbd24a80e2add1b7374525d0f9192f76004199abf4d5fcc60604aa0a6a66afd3577930ac46751044c5a59ed958bef0417880a82cd00dc3ce5a455415fc207b12d160630ea91ed11502a25e1b45c4e2d3aa4f631f846132945cb83da229bc43c5d9a6ce5a41ea9491b85fe6f04a446a808afb476aa70f2d5316b2948e2e49d1206a4c5d9a6e574b96e74884a9ec5f9178f2cc4f9598b9ca2a9494cb49b297d251e24aa9dc3be0b09e53e2a5a8198113122f946450e4a14ef10d9a7a98104147798d76c4dac8c4a02d05de950c41174a868a1dc45443f6ac85ae4ad32d4a4ad810525896209483a38052fa3c51694fb8181401a5380a7b235186d893572d1324e3a700a760b085d7d13985e878d0c73db4f1db530e5972d731acb44a1307fb42687b8c4d9a77616adf1257bc031e73ff00e798847eb2501eb4a992fc14af08b980ff00880262820494a89d13314ffcaa47be1b34edca506e81dcde10b561a59fb31a897e5183313295879c16aa803cdae9e9165ba471221d89f28f0f2d450b5149058d010fb9c121f83c03e76c490b2094871504a416e568a13fc939642f2d0cc04288241d6b5700d4c353e55e13fea7fb147c04391e52e18da61fe499fdb19b8e37c2ccaced5cce3bc929a94202196259700f45458bb3f54f783c234eb5a91356b520a54a4e5292e19986b5d23d151e5061cda61ffc6bfed8afb53e8d89455d474642f30dc43a639e5f14f0e98fc97cbcdd60194255592acc0ebadfbe0c62489de7986629c8d56677b3bbf6c1e264290b29502e37b5469085a238ba6e9ffa456c432589737e1c78467e905d2c32da9f8c533dd104c4e33d2f2cbdae8c7ac124356f4e24fbcc18da930501a728d7c4e68bc67a3965ec8c8fa18347085af05d2e8958a501ad5ed782fd1ebdea61721e9f08e9c5cf6dd793cae990ff0067dff8c55f2aa4aa6625084b38929672054ad675d4b0ee81d940ca5e751510ccd5b13c6c6913b7a72173d4a4e65012916041ebac91bf759e3a63d2698cbb95397f529ce92549294a927a2acd2c920126d9b326bcce90ed8b8a289d254a58512b5214458e66a72cd33869ccd4c184994564cc23ede6515ab2fd9ca0d88014a21f4476539f28485272ad2b19bce24a6819c69a174db846997abad6d085cf106a9a054871029c54b374f8188211381b11df0d0a8844ac32fac4a7887860d8a83fab9fd8e3c1e2810a8978956c79e9eaad2ae70a5499c9eb4b278a4c13663c483153e900759d3cc37b61c95c03d263cf7ca7c679fc4106b2e51c884e8b5fda511ab1e8f66958eee64fca952bd14a8f70263ccf08b527eb121d49200d2aaaa954176e7d6b18283158dc8b19c6665005dc20007a4900366a1a9b56da9dbe3f00d88c3c9422581310a517948619650495964d005a16aa36b1431699589489a81966804290a194a88f4742776eb726ccdaa42fce115186c803f486698e435ea56a444df56ae3ac65bff0ed8db591231a528250852b2a924929a9250a04d4292e1c1fde01a8fea7e7d443d3ba3c630bb0664d066ac1081d65170977aba802e6fd148277e5bc7aa6c4c5257210acd9811521aa4744ea45d268e635b658bc24e0b5193884cb4a9c942a579c4e63750e9a4a49201d6b5d4c6c1689cb09cc844c2948198cc5a49a5fa8a625b7c1a12836511ce1c84b596ddade1106b978198a6ebcbde533e62bf9520a47697e5048d90a0ed89c402433932c9ef520c6d12562ca07b5fc60573562e3d83dd01cd6dcc32707863e65494673d35a95d359625b3fa46bc802d1e6d8cc44b1954bcab274753a1c3b35030de2f1ea3e58614cec24e433a8273247ef20e61e0ddb1e5070d2d402b2bb806a57bb8186c2b1084957412aca520d1095a7bd401e2d1bad9c9925202a5a58212e552e5e62af3bd34b11d628ca13a0a91bc55c06c897354010d54a0366a6626ee63a4c3792125266144d5a5484ab37400396f465eb97d862d964da4b37a6936a6050524a132c3266925129049299a128ca05d2a49603f749df1490a952c0502b9531939541294a92e0bf4521c87075a3805e3a29be49c958cea54c592edd143964059fb6d6a785235fb67c9f91282148254092972e91d0092e32a8fa5ab465472f684dc4a0e7482b92066504b152544b288068cd5160e1a8f15d41a2ef9298648fa504861e6d00b1375159b9e51597840f7577c72cb1eaeb8e5d3a90dba00a61bf4403527b60be8a2eeaef89c5ae4afbe05c4591844f13db05f424f1ef89c4d961566dd73f9d452f00665e879b6f88be8389f93c60509e5afb23ab98fe91f3f3ce2178800a49b552aad828338e45a07cd39b1df4d794257850ad7dee212a55e9f99002d8309a33170c51e6c2337170ea6de4c73d8a9809396890e120e8341f86916d5809852c959291a1151ed8aabd9730d5d25f5afbc46b7134e9e5f97ab5100a2adb90d0e5795a8575d001de025fc638c56ca99c3b0b8ef852f67ac69e30dc34ee91e50493f688effca2ccbdb0836583cdbf08f36561162e93dd0391637fb608f5ac3ed723aabee511ec0f1b093b7a60fb4ffca7c6b1e2c99eb1652877c5995b5e726cb3db147b57e9ccc3a684a871047b6d0833a52aa8051c88508f2a91e554f4ea0fb236987f2e15fb49485f8fba03b5dad37ea2731af9b5b7f218e324cb50c39520d415a88e9572212a6a11c7ba36727cabc2cc052b4ae5e6041a922a1b808d6ec2c48520cacc1c12a490c6b9148533d0ba4eb461008c1913f2aa604845d4b52b284849aaa89256dbab561a88bcb95d14040580b0b32a6ad3f593112cbafa2e45934aea19cd229f9acee54908912c0531a99aa2ec544b74454b50324b00f4661f1532748993124e795304d48d32a532d197904253d8889235965bd6a69ae5af0eb53a96b5b3e54a96a648dc0283f605011e87e4514fd15213d50a581fce4e84fa5be387dafb293372cfc3d96d993e8955df91707918ecbc885018664d5216b00ef60973def1596ef6ae33cd489933d0429439805bdad1e3d80c6cd2a24ce9ba544c58a9e463d53ca2c1aa7e1e64a410952c259ec72ad2a62747cacfc6381d8de4ee75290a9a893352d9a5cd0507d64a8514925d9b46bde20246d8c4a5b2e2268b5d617a57ac08bc6e360794f89388972e64dcc859caf95008241cb5481ad3b6147c8ac49ea4d92afe33fd916f67790b3ccc42a6ad084254953a0952c94904338005af5e501dacfc6645cb42ea2628a016a66ca54127984abba3c931d24c99b324e53d05a921bd125d07f94a4c7a6f9633522429084cc54d74ad1950a504a90a0a0a2a01b4b5cc703b615f4a5f9c9983c4216c12a28072a9ac5968714a776e80ad84da2b92acc84e620835074a8a08d88f2b26dbcc22a0824f9c2483462a2b7d6351fa213a61b17fcbf04467e843a60f167f8543ff00ae2da4937b6e11e564e0cd251d12e1c4d2c68f759a501e75bc50c76dc5cc60b42101398a405e504ab283d776a245a132fc9d987fe4713dabcbe32a0d1b066a7fe41b8ae7a69ed4c40fc0e316892929397cfce6555c942000d9a8e09cda691756b72edcfbe83ba0d18642909f3aa968992dc4b44a988984b9247410a528758a4b9ad0b88aa66701cf4f87e719c9a86255770cdb878c49512050e90b4af88b17afb472f1103e74768f8f86b114c4beef84485f1238457ce0bdb5170fcb9c37e94d4a405041dce0f321eafdd68942eb9aa58d1ef4de748173a836a392fc3b2d4d209cbdd9eadaeacef7a6e8a0ca838150c06ae2a6ef6fc876e167a9a7b6bc2ff9c2d4bdf94a59c2806e1426b71004bea4937adf870ec807a8904b966a5bc0fcda24b8b92d766209e3bb403ba1057a049ef1f220d3314fe8d49761755fb2900d06f61de4d41ef77bf28148140e0737a5380f76b0b59e8dacd42e490cef6b7e10c9b312ce1df738b5778afe3ac04ad0eee00357a8b7385b2583b1e1d9ac405b90e001a376df8c1ca48a92e470d1ec49203f2716d2011330a92fd1079befec7bb7e50b3b3d04b651d8e1f7652cd5e3165448b0aef343666737f6c18452fafef971ad856afdd01ab9db292f470181a17f6b0fc22b4dd92d62637aa0f42cec1999ad473c8446e3435b5003dcd4a72bc37534e6978050b5790f7c1e1a62e59170c5c11a4742a4684d78b1f6d779ef851c3024b805b4d7d9e317668d97b4a54e4e4987cd93d65004853dddaa9243d58dd54ac5bd932f0d870bfaf052b1619966c40fb01aa41a8fb22350ad9b2ee01d6c783ea616765a49002d41ec1de1b4d1b8ada2944b32640504289254aeb2aa4e5a75521ed73da63366f96189c3cb129193224a8874b9e912a357de62a9d983452b57a6eece50b3b26acefda3e7f386ce2db1f2ff00147497fcb089be59e217d64cb3c0a0287718d60d984d9c9e15dff0883b34ee2ff2f5786e1aab47ca151eb49c31e26420c0af6d288609948f525841ef06290c11ddefbc11c090ee2a34b1a7030dc355653b617a4e58e4a99fdd0b99b6f102d3d64705afde616704694f9e1049c02b40ff0093da1b868076c623feb4cffc8af8c01da138fed261fe357c61e305bfdd0cfa094e95fcadbef0e50d0b098552883354a23766727b4da369270f2d154827992aed6348d7230ca15ad6b57ac3d2955dcdbe5fb616ae9b644c1b80b3d2a3d9f3c200cc2ef4a823aa15434b5aded63149016751f907a71d1be221b2d65b4bb97048e47b1e8d11564002a00a1a3135d69a8d2054c4862497e3c87e50bcf4dc6d4a9d3b1ff189f39d66720eb470685f86ea403b30f48034ab9229471a8678061e8fb2033b97d39d1af716ecdd119f813c5ff0804a14588e1467f69f8030786249208b24ee77634a726630a44da280001701d9e952c0e9cf5ec8841cd5cddf98860f5703db016ce50e94adce506a1212ef50ea3a03f84575cd0000329aef2076902d10010029e8d4a00fbd96758c25dc052783915abdc6b7e368033301f6d95737d38697880902cecdc4b8376bb72e1108935a0143729240b5e869ce31c12f9859f41c1aecfcc4060048172dec0ce75d2082b30b25ebe15a6ea6e8097455c9677a81a6848a5e9d9073177095299ace5a8ece3dd010970d4725ae0720c60d2873d20a48d400486a372b8ac0a332baa52598d581a68335c9ad13be044d2054166362fa9a11a5376fdf006c29d2218d7b386a5fb2090e5d8926ba3333bfb202610378208a8a02dfba6090a195c33fdaa825f7ef60c785b7c01050bb92daf13cc5e86958853004924d47073b810e3b7940936a87e15bbb17d054f0899d302955bb5b2d035c014d46e300295bea4e83dd5d2bcb583dc4f683c3f3805a134606b62cc2941bc5c9fc2252a2a2012068d61bd9c3376c0124568dbdf50df97b444a89200f6b72a1d0c4cd4f44120a6940a490149de0fdaee6a4066538000ab5728af78a331f91004952684e61466aefb8a6f368c5914ab9efe4f4887232dc1b92e0b87bb51f5bdf7d2310960fd1e0eeea7b8dce1fc7838094a5994dbe84167d681cf2b88c17e8e95e6695a9bc60551c3d7a2492c06addc35ddac4966243eac18f8770d6b0189bd12e6805051b8728c99280e1bf53de7bf7e902491a114f61d4f07869512c05806d4d6f776eee3da0b08a103a5ad03d3535a81f1815a6b4000f63bfcd34862aa06bd2ea8719459ed0590d33ba40dc2d5001a7e26016995a87bd587440e634ec1040072a66b901b8d2829ddca055337bbbd1d4e3bcf64352cc1946ac402376819fda1a0160513d11baa541f5ad6dc9b9c106d6a746cd4d5aadc6316bcdd5b5d9e8f7b6958971ad3bdfd94710d0067a0f1037697b08c2ee4b82cdd14803b87003e6b1895014a11bdfdedafcb4125248b3eebe8c29bf770805b6a091f176bfc2246ac2a3835294e64e9dd7861410c0b39b862086f8fc614a570045346f1f9e100c5293968e4862e02acd661c781e7048506eb27b4b1815d1f2a40ed3cd8021d9b7c2d0b2d63fca7e100b510862d56709a10c6ae18d397e50a492dd1048d69714a162433eb00c0070f5041a3768f9d2d0c0e0592c7893cbbf741124b066b9601df2b76f168243ad544b6b5232bfb9c51a272160a7cd4a8527aba5dcf00f4bc2d0b0e014efb33db8f640314683aac4b6f2904d4d053b04015914e0cfad60e424a83967a015a7580627ec8e2604744b16ec6228e0d5ebf2d0041d2c32dc072e2bf0e51931614ab92cec03b6b61ba00cd0543282038a0ab6f0fba2552804e6490183b331b9e88624960384042e6827a04867e1cbd8fcf74382c92965663b9dc8a160e6d5e6dc614a62dd6287ab0a8d2e6254051d99d922a3bee37ea602545c151caf66d777677c62921b35b910d5a0e22d6e00c049cc49290a243d8d2b43d8477da33392432450f58666a01463a5b41053c31a90dbc001a8dbaf00a58776651b3060682bdff9c0a135202ae4bd4848041ab338b86f7889948484a8135e4fbbed0228e2ec68f005296976209714d35b937b1d221776457f9893c2ad5f9e110a97988cc424935a301b9824b9af0ed882a525d398b3d7811476d2e40802558dcd9c9350ccc72bbb559ea2d68c412ef5b1702ad4672fcddc5b84431a65a38a74aa68f52296d231240abe60ddfa31069edd358010b3515d588ab9a7b21c85925b33d89292c430e0ef6346d6122b426e6a48767bb867ed8154c5243024055c8043b3df48062e70a0d2942eee295e3f1894cc243663c459c82f5dfed8048565a0b1bddd98db4abdef113272dc3a80228d940dfaf6bc10d51514d01602eee0e57d37376089502084f547220a77381e302262d29cace49cc4906b40c1ac685dda31330d1839abd4905e8294228d01856e729ccf462ec3e7b841a263d00092d76e5f037809731d828b0aa68c399bfb60894e51400a6818ef0e5c92e4db95452d054a963aaef57258d491c6d7358942c934be81c548d48d37eeee85e7d124b713bcfb05a264a8241a972934d01ba4b3d602562a547f8aa2e49cc436f2c6d10a9f463520d19b2816346a9b578718549cc3a4fd5e0ec2f503dfbe2660a0aea45add875af180729490924292ee06463c5cb9e8f656010be25ab4a0b369a8ec8294b0e1c9666eae6005ec78ea06fa6840a867a29d2082e0eea9eb07efb401aaa0d8d74b83c6c4f77840a40167229a9d34e3beb4f0812b525f30aa98d98dc8e0d18a21c29831d18063adefac012141dc8b1b2b57b716e506501cb94bbfa7fda5a033508218122a2c756ddd804266203dc777e300e4f507f1f888a93b5ecf08c8c8a8b527f507d74782a324fedbd5feb119190f2447da1cc7f4c28f50fae7c0c6464031564f23e10897a7257dd1191913c874ab2f927c4420e9eb7be323210abc2ffc0afea8a0ab9e48fbb191908b56e6dff88f8c11fd97a87c632322a067f517ce5f82a2b4eb1f5a2632207afa8ae63c570b9965fceb1919154ac675d1c87ba087547cef898c82183a8af5c7dd5c10b9e7ef4c64644a784e37ac3d51ee86ecdd7d51e3191909d94a97d71cd504bb23d557df5c64640bdcddadfaf5fadee114858fac3c6323201e8babd4578aa23ec1f5c7dd898c800fb23b7df0c9574fae3eea23232110a5587ac7dd15fd0f57fb632320373b7ba88ff4e57ff198d1633add8232322a3fffd9),
(2, 'Audi A4', 2004, 'piros', 'Benzin', 'Kézi 5 sebességes', '5', 2000000, ''),
(3, 'Mercedes CLA', 2021, 'fekete', 'Elektromos', 'Automata', '7', 4000000, ''),
(4, 'BMW X5', 2011, 'fehér', 'Benzin', 'Automata', '7', 2500000, ''),
(5, 'Audi Q3', 2013, 'fehér', 'Diesel', 'Kézi 6 sebességes', '7', 2000000, ''),
(6, 'Mercedes GLC', 2018, 'feher', 'Diesel', 'Automata', '5', 35000000, ''),
(7, 'Mercedes GT 63s', 2023, 'szürke', 'Benzin', 'Automata', '5', 45000000, ''),
(8, 'Audi RS Q8', 2023, 'fekete', 'Diesel', 'Automata', '7', 60000000, ''),
(10, 'Opel Corsa', 2003, 'fekete', 'Benzin', 'Automata', '5', 850000, ''),
(11, 'Ford Raptor', 2023, 'fekete', 'Benzin', 'Automata', '5', 4500000, ''),
(12, 'Suzuki Swift', 2000, 'fekete', 'Benzin', 'Kézi 5 sebességes', '5', 250000, ''),
(20, 'Audi Q7', 2023, 'fehér', 'Elektromos', 'Automata', '7', 2500000, ''),
(21, 'BMW M4', 2014, 'sárga', 'Benzin', 'Automata', '5', 3500000, ''),
(24, 'GMC Yukon', 2023, 'fekete', 'Diesel', 'Automata', '7', 4500000, ''),
(25, 'Mercedes A 160', 2023, 'Szürke', 'Elektromos', 'Automata', '5', 35000000, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`userid`, `fullname`, `username`, `password`) VALUES
(2, 'Szivós Patrik', 'patrik', '1234'),
(3, 'Kecsekméti Csenge', 'csenge', 'ATRxrp20');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`rent_id`),
  ADD UNIQUE KEY `cars_id` (`cars_id`),
  ADD UNIQUE KEY `users_id` (`users_id`),
  ADD UNIQUE KEY `vegosszeg` (`vegosszeg`);

--
-- A tábla indexei `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`cars_id`);

--
-- A tábla indexei `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `cars_id` (`cars_id`,`users_id`),
  ADD KEY `users_id` (`users_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `fullname` (`fullname`,`username`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `buy`
--
ALTER TABLE `buy`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `car`
--
ALTER TABLE `car`
  MODIFY `cars_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT a táblához `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`cars_id`) REFERENCES `car` (`cars_id`);

--
-- Megkötések a táblához `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cars_id`) REFERENCES `car` (`cars_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
