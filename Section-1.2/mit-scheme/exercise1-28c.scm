;;
;; Mills' prime
;;
;; Elliptic Curve Primality Proving (ECPP) is a method based on elliptic curves to prove the primality
;; of a number. ECPP is currently in practice the fastest known algorithm for testing the primality of 
;; general numbers, but the worst-case execution time is not known. 
;;
;; In 2006 the largest prime that had been proved with ECPP was the 20,562-digit Mills' prime:
;;
;; (((((((((2^3 + 3)^3 + 30)^3 + 6)^3 + 80)^3 + 12)^3 + 450)^3 + 894)^3 + 3636)^3 + 70756)^3 +97220
;;
;; Our interest in this number is in the recursive manner in which the number is defined. 
;;
;; To wit, consider the following procedure:
;;
(define (mills-iter x t)
  (cond ((> (length x) 0)
	 (mills-iter (cdr x) (+ (cube t) (car x))))
	(else t)))

(define (cube x) (* x x x))

;;
;; With this, we can define Mills' prime as follows:
;;
(define (mills-prime)
  (mills-iter (list 0 2 3 30 6 80 12 450 894 3636 70756 97220) 0))

;;
;; Let's see if we can get MIT-Scheme to calculate Mills-Prime:
;; 
(mills-prime)
;; --> Value: 175049840589391837793576869636630282687487868795376789295253428073334270434688134999125968026139390543910871978662703879908672900309477846234471260898315901137250286746017439819666550755165056255377926149901606226673376448218322416576264035249277817797775477188625305240537051825615164306680529434650063201323757773367501095634741003772015982193942957994762856892219237660046554185127347627921275535592307628777006922225841737012591382270717426709013821581956975461302109821547668641004492525715529985651051202873099657583770300139681409562427708589654872188583135316050795345794942830571060729914470361837808487520271249201057934896013828500896313285032413011454945373064319177214895240329829796606939891154504671948341249800939008520926007021638021667636736687589633620799869670663196369272540567170827674187474402546518019309161787433824678193835615199376083151429503930246001878031277682870834384655126476772667414425283868268414488581619432342754529295366937613262771762988812060263125085422085911596177214980090953568069012159107570122467892313399809144672345862250834636947507426712554564740686324292756616096983941549683435270740164350440872886836649405973564616048744661677604903300650476717750997301870435449015567025808386431174810755702620393344836119118035218811868959624318093407144008348814266122811038798076214315556444990052140952243417821306633709790850391804525870884896124189811228248159483101963106546352318039380729575958104007787788053180456344622317187645016318217113275525759412274882937261895474022721834387552074779125912207373207026036289032476299967096301099201403724847576417277953145785431234102606742230817686670058325674147005874890586051281138000602622765926646783348466122583580360407667566276806351699678747027786015358911728903319854926631282902843163112471935704410339820039661180624441370174622476731339753030786028786642180289192279615854051358689351993821321219681277136760343362401489716865065932904503099831517796493608989352689310998651433210094340137664544292951889286341556164957918065361123980193603471492620279327178328425406948319634785606739771802799334980193207565801671393658315922448009298799796528742429046836328790371184198457074306994434339133128049132380096135898825008905101327930322480999920599139235118198594358083503693536728517304691382538269092489478892219787074840500637262774230420292166387473147035031918223113678220463571268617689505790595980960477761172698433396461679394947676952298714016902371215504231672279214102083853891167744895732638759096404781245921828402357056705532657490928631823655860259191751806821050909334712179349610529904443432958277854739674155764211919089829939820070685462601844980641807955776474213493152845207833745016657651916059728669362263789172251359552838333312314019043263188905833697159825983930396590468742899851818816212776598041824702958435211613170590970882134333605109276044573978157941384678422414643251059397675971724902059952789221803758484242377141829379883591802309436296952391095072451682898295326420175855826842055175106223332963408689731703091918633163278380082673666261570758547885869757099892791042939968252361627065358031930684701800165215603974431058727950227350482935523344814955671480327252979643359630323554444988276491406184288650094448982372164666468728502091212086430137821008594207925756957139946125970032910742975053945553646686318141686253173297226435982351456290515670335803358633818947605651206324304939113256615195519471339312834316755394573060772371790623106774303792050357292197348297644061648802495006292054577545983796418125248433869697165578129541646538807189005183007486214312576282342841134318914954511112989512075456347055876474645680733350015995531232748687322435402826882309389849587713111202530174074091838979714089215669774764215717188763471995956010794639474029315139939385225945277106968666714210297514217496996185321330084759546423210875495529023226116811883615960837181611238213362280557367617954479119024513597601241907446892233158873631242469698433717614158661600590316696647316886589678652123305184116624786980021462341705410563860947279039300737806972455520897287257638024238364516926154904115412878878856263024783474075827796841381539273786216000359850928159035780166374617271838565001832313977270577206899964830418618507002312336522337939408701042024019137490941028539266193158282291329779144344995014016590593488809661639648779896090319134886907174453672966068511964878809266674037603320574078235934285493627867713953922729914980405062934824986432420282731051552766108293074021862571238436703889543148527325701169284604195160109782910646612549752635544999022620939193993186404051918348857774252543060636642571896618042304750054495598880640692092578537590860626707079002154733148502133189339264181240886176765693449142104590022745703094245886155678205943013395327948433675033383336476104345464302416203348963541062149615059863385852982816055549749778467960898427243241364844004541068214985562417744346087730252440217796383150096544520406171830856168156526145684984590008903003476193303582840886445439335570610300308941880021323821827638708698008099423618013081059580887819126348271036966969809077424836775059146929653963515535554947304990906055112156164962032211101830029507958016750822085923984290761528341661201495599462222584725929124842155739533086511588550075372158751519059880885288569915223838284512060513119721775321465697610758275291032678124356948969175177866932672923110390640163306998319180956053928034541860214023030105571149755525221460639893606591041504629838935694246477042858368282273265020101114684038007602376063907175790861626239886845353466908596514518767934630089841480729800124015208949043546509131188147023300438560570297230172603254188660078753610498865716338756378880936033478065550908866945987377890415476912948523604644497234202054497264866996660026074106879390912451653785703394996138631061245598236313780234473982177071295392682555654871705858655790651097464897385402816492563501841286624920260070143766601750869331483302779246994187046837770497382754602532044661122319185225448192049723086315160428975992216599871616759476944931400813404801737341653045712975174767077642917037971274159919308531306071014166678640053464446672020095458338448474484738761016821799922422228133172290113186481272462860821825571826200500911201795814734926905583003226716568860603451386691400312879450670360708590805089091102850423040665884599029981657306044493713473640565178798129420960441254402527801326399966558743536802107017367971808212772661177475472370657886817873950767865144309001199271799393410448597044424936263257977037296824274054900474619138049451311470509256033691879790954983096425721289650793213358243118118439750209617679146564250752322848678619677587399145397371704815890713879219248308828793248764147209756361294852817288191156745224437076795273501593026517877380580545672777341397322536334428329628827880812713490008778208239081784876346310910088448680208718810607935821995901895373836101239047756198209341699411715285189440087251131319840671274314404667067238571236678066079348936687099600516738305118039309468550291540977237539676789236391505130102419238771786306252308893093056818576817657159523908275143529690259026678064152024062895324210228146914526242303460679961760162024933865087771910219785742823458723352456704957232445941067363047776026131593656282878185426472173747845878068989883866635314680363614085590243525953046581651287008955180614436521133326038476358933967711359351260077222297762593887475568409403556045063595248697979513176112336473811027283186314078464031415423332346134802331737598793716296470491299042557580207187378238705665432352494352070060005036153583334731564245807926041824330285411301819327821596902156318208466508729978407327783947826976928095869685835836154193276332864154666603558033866568626700537375849512869921758213797137418199165955811421427781312076554701685269783500676426005225789656699097109445802928325090207531360036512289164835794260400115617749767526561759116903010057491172245829478599244991286490164143076473103560897123075180102610824848623588740446982346708077627623985924267835971533116805282560707905260927876579530526161336744776676812212812843032687025378610873420037055909181457541167873302734797236399314073233765678520859026492166444133494824216006663445088092963754369897758464063462615101346078731648121311009945092234309400089297650797835586243258889342803310789656253316006948098756220190311118586787513827730884441653613832057655813627758284521631788794939109569948431806884620774665116792896508403631747121096670556288117695143326460510317742379860076881105258078514774738485572847386066806342927665120983558842062977884164637553262602337093992622253037758677548758903827162215032428863096266542770242969049149885996608895874788641958544236309443073410638408060509166888212767764873878316325375188048819298236173295199263493888009599228216381512544638912323181504202000523163159819009428314358740023138627448735063804692832103570224351649391784561448735018233287811091443583555946220475719858311655746546193659383567679982567133268963657339811972345839567832162116128000468206800599313639181266834068368850481195960342249998246457127673031715996622789575386010359642466900376912661539884638616765796443434337037894984074003649451811337786186680047141258715814177028656474763851776077917988405278112927023176015225618216354268466442663698743321933172458686481236452279892066548206916704297658290580889501005701295770730914823196883360148007076705486822219026893587600089532526884976000524258420907657133876909850840927535638353406777020280023450084489912516709875322046609742202234645385046950919733336060182574754982357113297547028597312358678972016936006391333860432192420555751775845864809981687606460101001746638736732970724702356134503642930745810740066609542015747108099319684071544496948618393398338401512036850862108212014325551957252837082545461378192987654572597672538753465834845845011268720236490066070307409785926752346345201746067159829002768570782576896581177152661921400587395788737077310142551946454534442697853464470159108794035243214606787252046860174896719266959328514243887176263347975632937546554013751581234399512989714123950160858285746575760946021584869965251602656538432816921888194592141991852634753199177943656233953436276572090822943358684573477113350340268261823801415626151467994719443809611372719832497845399183050018767563153078340124846160372223757260933491677620524739535220600236199289965753012493431734515765638177146119238460491965750301499176922081635443428690620661826174772719835904508580772131412836593944386156390703117301440318473848221996411579253137089691213510674253393780464487523830948419477693155267324520904605991139978385199412661773636357468615369499651612421757053160146469354765197642469302255768601299280414522981120678141496623545467242634470808698763661968714702405308877410715911992667245653502979069403560655940839252998036837413204288313746218100380559304153468508288098405053099359455691685880376529432348431658988656171751152909796492453504402154969076862653990627824497378347612599648202115660272485982560974814130031289583133159901109608765829990507544772872027184170825575836574440161638078588136454458678385268608837290069480974428770970171299868669652288005927406946028385038879827519256787939985446199927333066505832445296904036608538024127533767891105351306041799355904306116767119515476592142536670421478084664687240921616232142589156088995599683914976123943723481633137893645476018144827977306857099534188391970647032774843679794772255991073883482961061428809978712060398122019690885585906879677039155731454536037429726972568778160200797211372005510684906840743573390383143710266385052457557825289429469773911639819540266002159461105001571308106288984536114790024687937946614996683539394622747646716759287522109580970444752503217913938417691328357549143752864463905208558988575259080344469768275465758036089285288488650515612831778324225393472535970450324001940004528292766600155198052927810622746613546592907227560279935286553592818969920989410833954384128240116582092014447134087997717659627373054600907995700723078417080147693290373445990344565327510842508512426843080955984486581501938759929791603964962701875887152337217523729126382634680143540061426601385589422275286311887172535166607202599313689866998099287972672790811244594263865935209479724161593132527373157574334387694905352989196562588112420119457605646976820637837155908846989105514025608799694986677734110775930273805005458259968950733028867513925535750398561031597289149677881567819759207426615165529362781115603024261718594316046796742534001713333792463281120938902459254775853391976496352208268799733857160736539539883281490009544581673173924969934593919140935287493672827763353240273424437478511813626708024447848215737840072353285201804628233493655949740238513068809034029738991156744186549856058573670512417538439014004348115107258438487497650839567147142314929235718369281169601236408696351985705248355408165441488324415313690265194964240480558440281550072433121027046474598758046691702108512241770300220366992319611930273687231327481290114694608626732428550093475957069281025779460329457681823469786520421877645946965795446863613845837983664382219143212736943812081944296597970323320239881512683177056589178463797125192838635739485705029824376275765285583978313538466238980106908617412044081867694005175329560992974494735584239559919330636023941357134587674656132495629619514844279614503277790238909975152323607518216864126305639155932235718522633868310798292571066456234546951296624331556964474401311462577299932124279067248838648620194434488759987170847516331102790054462588459598484112473856152590976130647042234864279534066215159582703943286158770499393458607755210324435890860290654543862586007146621869790331890000557194170342248309925945380558034575487929434229730984633154504422036415816928927056990604150434588184394797008025506144949836666830169059036236424118770795402039326773418521115462755576191801516928269007268113345492651464874819627864393897071462213666265251867734060208984809681446437910587442603792802945698268700780269062373364488312674063044883650205586227689831676828710428922030980130184471800250067583821812747145013367259029502878146842029610109809540931749382468045534654671343221478217843493835091779936811647427389421956181930072414612290883620802106385636832158394875899688722530188566706271752308779531479230713020764810112202242600912619035944812867645365462336108338301983215934223441458739970893735530010714985207533877512615148646433602713954674043080752007346288206936314445851842986136276248879995962759538719224598867681489787181671525836735040540375354809688176316334347050268455834294418065011996495709692603520734414055515022139114743890115988794443989005093606500482584562337548372137262492320282438550974574514321351531054796259295652695899678391174969655065584459546794321821108910394893911228285616748184231467117902348509881398401291825601056190028686515605757580143886995172762453862190763354368449274841713836826283532343407338058672176366219985251655796491442324895537755397903109675505515947650935033917029387585986616611018768615407823332230205909353782374482023936406554971619679580632857679179112690676809871351035171691851378734398141440609237049083024402854287093467360803199902930058137350790335592460223106033184021137947917540046683400754131378456717610384015363630181160663590251892631872715389784387924183332088014199885914522205375560948765136235048093357161356437137868546459421521552859025349238317907915294347766705046567043669048090029194507020769739356022217494460308432066858232080986307425506282436549728047367199216759123982881169683458168334299130288406339843886790644632562994244419933729020295408629635919588578449354720310710361223927430519767893772292699269101108601616599235364452578827473042291411026293234067380968594157351604172489371235209502444529928400559429160662820321977421095304003424512605606155981799157170981208028819888874891005123121634869649300671490028951540066708786833026433441422382579482654614890680042918136660183628170300824347792267444155357071645831271385400231493095038425644929009668475140783465531076660036719979186785525090679229591628290142075386001256650090100623577581803839560894082853025479716493203081596014970817934308881639728732624024799199211943633426017256806541930774734158513904874520175525287842513123411390550913320517852038448312265996944565044100565107538491709959179840741674138528917844239986445054521123359212701617358882309879711999873468593523572779451993254876769010800039827023917779738690561876062719998736281494232131787917794923567826657186431374220164457036550596098210825637340740253198318242750153264005410113206399574233109641059422789891511697945639986669748941876053852120225807241389018059050332640853088158558429479146448954206529356998299972001696796120019131765819725667409028885172393206325422369943301014754472096020715123837799507890130925200953186024077115654704393530281701214192774498524300679991355791182294097373273489123423182648803514267022557218883936488295141405965319098556757536323267510675548967345070308219516394931458056795374238813639961800548527020803287286410308260071052013224164938606669119612298675192958146073096663116759984625069358479812989876754729504938388023278471090652328775948548152460630417577703934867961584821607916719680593507939481651345268818765378804795479499146617064185901035518840270276126965197658649878359983013288491182529013177946830462678416372047781844907912544563411893979562384949857367804401954017250732853997225950792324111040543875197048653770480279969207122327684233931094853918514718015889224228635665476025076647217665594401783690564108506442879065128450903912815853823467059503579301221823509437048797134669933184211127165967950647874223751300713472273801793627237900033919106130888870197508248459865638109282911588390058781744912625213875503396595462802373631277846940655826701521418746350119576223297584163330127162976478812382205389694206326673866648308050227203456703198760406326527413558210920347055555793125624822298715176374503675479810328391235753172430416791163703650923565765282637023802550447827877520277992302141507038372228948964619120931161402653680565943691846704462330392385580550331049477936414273929946017913002312077303306216179504101599243592271747262833297253623044405057712652401014017508231898260468324349012622121869877892592150451520847505792502857427918887584572593131380106508215358381328598270789975837505728336865901278924858171724473385351047521768062274679345793132246530944473015576978827689832286731011330141802570417461730831126977245135855246249968064443070370077201404512025743420673695669781680656057410478150999981172735995958408898996426695359286677743631375970748471498595983962977757522721083776217894517526446638144191007333057722649858713602517455215322685969653498567303561086085917566884659928893915221865248101395354672303594895134861881772508754390034667772577612061117190664263484189327521792535463629249309891249647992436128814749761963232547020739948059427385486210656398717709607633246210273950434914669120444936356763360227872064562477585791165942736228656677025021249452665463995491428581167672714158645810821637281223844560344843226325706956847179867841991263641163225727997943155594752558424326596502847970100596464030222921397917653231554865772906679839868223595377786471327459335511719637660796822086640723246577228270472895009826553456219819020768800751991668670829629600666849013816521378068567695917715175976378681364258551149287559806772170978231446977673020340668936167103264741371401141660326161116519083740039228040322722931632373207788980979528331299848741967682167594728676442506521347736170586857185029476741473405134572598153499309315295156942963272324779211614418216517252493426972465099395382464729111764464757873407837413404188716153030521637039426936363593712917310777464572069378698604434992265774893270447669814235267674438519460496001134056233366920643106532430935916122820781207059828784527309890275200739262827297821222536036584506914037945337524955345582220315442094520961837458937236348676595269520192105008160826945804173507321181844911039977134955183613726546710163012027330237925782485444749288224795852523654902135066258931185305216595298779078722279400145044245357581625385775432686851583406189770743557573694569438439307913728686249176276427982332121396484111232386738954392964100758692159128730931713630163055567570218061333601839622944571856390783961127234301101373112963156042415693267

;;
;; IT WORKS!! (I think...)
;;

;;
;; It is also worth noting that many of the steps in the iteration generate prime numbers:
;;
(define mills-1 (list 0 2 3))
(mills-iter mills-1 0)
;; --> 11
(prime? 11)
;; --> #t

(define mills-2 (list 0 2 3 30))
(mills-iter mills-2 0)
;; --> 1361
(prime? 1361)
;; --> #t

(define mills-3 (list 0 2 3 30 6))
(mills-iter mills-3 0)
;; --> 2521008887
(prime? 2521008887) 
;; --> #t

(define mills-4 (list 0 2 3 30 6 80))
(prime? (mills-iter mills-4 0))
;; --> #t

(define mills-5 (list 0 2 3 30 6 80 12))
(prime? (mills-iter mills-5 0))
;; --> #t

(define mills-6 (list 0 2 3 30 6 80 12 450))
(prime? (mills-iter mills-6 0))
;; --> #t