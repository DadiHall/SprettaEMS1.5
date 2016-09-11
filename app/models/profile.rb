class Profile < ActiveRecord::Base

belongs_to :user
has_many :friendships
has_many :friends, through: :friendships

has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  		BUISNESS_TYPES = [
  			['1. Orkuiðnaður', [['1.1.  Brennslustöðvar með meiri nafnhitaafköst en 50 MW', '2'], 
  								['1.2.  Jarðolíu- og gashreinsunarstöðvar', '2'], 
  								['1.3.  Koksverksmiðjur', '3'], 
  								['1.4.  Iðjuver þar sem kolagösun og þétting fer fram', '4']]], 
  			['2. Framleiðsla og vinnsla málma', [['2.1.  Álframleiðsla', '5'],
  												 ['2.2.  Kísiljárnframleiðsla', '6'],
  												 ['2.3.  Kísilmálmframleiðsla', '7'],
  												 ['2.4.  Kísil- og kísilgúrframleiðsla', '8'],
  												 ['2.5.  Járn- og stálframleiðsla', '9'],
  												 ['2.6.  Sinkframleiðsla', '10'],
  												 ['2.7.  Framleiðsla á magnesíum og efnasamböndum sem innihalda magnesíum', '11']]], 
  			['3. Jarðefnaiðnaður', [['3.1.  Sements- og kalkframleiðsla', '12'],
  								    ['3.2.  Stöðvar þar sem vinnsla asbests og framleiðsla vara sem innihalda asbest fer fram', '13'],
  								    ['3.3.  Glerullarframleiðsla. Stöðvar þar sem framleiðsla glers, einnig glertrefja, fer fram og sem geta brætt meira en 20 tonn á dag', '14'],
  								    ['3.4.  Steinullarframleiðsla. Stöðvar þar sem bræðsla jarðefna, einnig steinullartrefja, fer fram og sem geta brætt meira en 20 tonn á dag', '15'],
  								    ['Stöðvar þar sem framleiðsla leirvara fer fram með brennslu, einkum þakflísa, múrsteina, eldfastra múrsteina, flísa, leirmuna eða postulíns, sem geta framleitt meira en 75 tonn á dag og/eða rúmtak ofns er meira en 4 m³ og setþéttleiki hans er meiri en 300 kg/m³', '16']]], 
  	        ['4. Efnaiðnaður', [['4.1.  Efnaverksmiðjur sem framleiða lífræn grunnefni, sjá lista', '17'],
  	        					['4.2.  Efnaverksmiðjur sem framleiða ólífræn grunnefni, sjá lista', '18'],
  	        					['4.3.  Áburðarframleiðsla. Efnaverksmiðjur sem framleiða áburð sem inniheldur fosfór, köfnunarefni eða kalíum (einnig áburðarblöndur)', '19'],
  	        					['4.4.  Efnaverksmiðjur sem framleiða grunnvörur fyrir plöntuheilbrigði og sæfiefni', '20'],
  	        					['4.5.  Stöðvar þar sem notaðar eru efnafræðilegar og líffræðilegar aðferðir við framleiðslu grunnlyfjavara', '21'],
  	        					['4.6.  Efnaverksmiðjur sem framleiða sprengiefni', '22'],
  	        					['4.7.  Kítín- og kítosanframleiðsla', '23'],
  	        					['4.8.  Lím- og málningarvöruframleiðsla', '24']]], 
  	        ['5. Úrgangsstarfsemi', [['5.1.  Stöðvar fyrir meðhöndlun, förgun eða endurnýtingu spilliefna', '25'],
  	        						 ['5.2.  Stöðvar fyrir sorpbrennslu sem geta afkastað meira en 3 tonnum á klukkustund', '26'],
  	        						 ['5.3.  Stöðvar fyrir förgun úrgangs annars en spilliefna sem geta afkastað meira en 50 tonnum á dag', '27'],
  	        						 ['5.4.  Urðunarstaðir sem taka við meira en 10 tonnum á dag eða geta afkastað meira í heild en 25.000 tonnum af óvirkum úrgangi', '28']]], 
  	        ['6. Önnur starfsemi', [['6.1.  Pappírs- og trjákvoðuframleiðsla. Iðjuver sem framleiða: a)  deig úr viði eða önnur trefjaefni', '29' ],
									['6.1.  Pappírs- og trjákvoðuframleiðsla. Iðjuver sem framleiða: b)  pappír og pappa og geta framleitt meira en 20 tonn á dag', '30'],
									['6.2.  Stöðvar þar sem fram fer formeðferð eða litun trefja eða textílefna og vinnslugeta er meiri en 10 tonn á dag', '31'],
									['6.3.  Sútunarverksmiðjur. Stöðvar þar sem fram fer sútun á húðum og skinnum og vinnslugeta er meiri en 12 tonn af fullunninni vöru á dag', '32'],
									['6.4.a.  Matvælavinnsla: Sláturhús sem geta framleitt meira en 50 tonn af skrokkum á dag', '33'],
									['6.4.b1.  Matvælavinnsla: Meðferð og vinnsla fyrir matvælaframleiðslu úr: hráefnum af dýrum, öðrum en mjólk, þar sem hægt er að framleiða meira en 75 tonn af fullunninni vöru á dag', '34'],
									['6.4.b2.  hráefnum af jurtum þar sem hægt er að framleiða að meðaltali meira en 300 tonn af fullunninni vöru á dag', '35'],
									['6.4.c Meðferð og vinnsla mjólkur, tekið er á móti meira en 200 tonnum af mjólk á dag miðað við meðaltal á ársgrundvelli', '36'],
									['6.5. Stöðvar þar sem förgun eða endurvinnsla skrokka og úrgangs af dýrum fer fram og afkastageta er meiri en 10 tonn á dag', '37'],
									['6.6.a  Stöðvar þar sem þauleldi alifugla eða svína fer fram með fleiri en: 40.000 stæði fyrir alifugla', '38'],
									['6.6.b  Stöðvar þar sem þauleldi alifugla eða svína fer fram með fleiri en: 2.000 stæði fyrir alisvín yfir 30 kg', '39'],
									['6.6.c  Stöðvar þar sem þauleldi alifugla eða svína fer fram með fleiri en: 750 stæði fyrir gyltur', '40'],
									['6.7.  Stöðvar þar sem fram fer yfirborðsmeðferð efna, hluta eða afurða með lífrænum leysiefnum, einkum pressun, prentun, húðun, fituhreinsun, vatnsþétting, meðhöndlun eða þakning með límvatni, málun, hreinsun eða gegndreyping og meira en 150 kg eru notuð á klukkustund eða meira en 200 tonn á ári', '41'],
									['6.8.  Stöðvar þar sem fram fer framleiðsla kolefna eða rafgrafíts með brennslu eða umbreytingu í grafít', '42'],
									['6.9.  Fiskimjölsverksmiðjur með meiri framleiðsluafköst en 400 tonn á sólarhring', '43'],
									['6.10. Eldi sjávar- og ferskvatnslífvera þar sem ársframleiðsla er meiri en 200 tonn og fráveita til sjávar eða ársframleiðsla er meiri en 20 tonn og fráveita í ferskvatn' '44'],
									['6.11. Olíumalar- og malbikunarstöðvar með fasta staðsetningu', '44']]], 
								]


end