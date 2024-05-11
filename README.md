# Robot Framework testaus seminaarityönä

<details>
  <summary>Seminaarityön sisällysluettelo</summary>
  <ul>
    <li><a href="#taustaa">Taustaa</a></li>
    <li><a href="#tiivistelmä">Tiivistelmä</a></li>
    <li><a href="#1-johdanto">1. Johdanto</a></li>
    <li><a href="#2-käytetyt-tekniikat">2. Käytetyt tekniikat</a>
        <ul><li><a href="#21-robot-framework">2.1. Robot Framework</a></li></ul>
        <ul><li><a href="#22-selenium-library">2.2. Selenium Library</a></li></ul>
    </li>
    <li><a href="#3-testattava-käyttöjärjestelmä">3. Testattava käyttöjärjestelmä</a></li>
    <li><a href="#4-testit">4. Testit</a>
    <ul><li><a href="#41-Testitapaukset">4.1. Testitapaukset</a></li></ul>
        <ul><li><a href="#42-resource-tiedosto">4.2. Resource-tiedosto</a></li></ul>
        <ul><li><a href="#43-raportit">4.3. Raportit</a></li></ul>
    </li>
    <li><a href="#5-arkkitehtuuri">5. Arkkitehtuuri</a></li>
    <li><a href="#6-oppimisen-pohdinta">6. Oppimisen pohdinta</a>
    <ul><li><a href="#61-omat-huomiot">6.1. Omat huomiot</a></li></ul>
        <ul><li><a href="#62-xpath-määritelmän-käyttö-tärkeänä-oppina">6.2. Xpath-määritelmän käyttö tärkeänä oppina</a></li></ul>
        <ul><li><a href="#63-opit-koskien-kansiorakennetta">6.3. Opit koskien kansiorakennetta</a></li></ul>
    </li>
    <li><a href="#7-jatkokehitys">7. Jatkokehitys</a></li>
    <li><a href="#8-yhteenveto">8. Yhteenveto</a></li>
  </ul>
</details>


## Taustaa
Tämän seminaarityön on luonut Ulla Montonen Haaga-Helian Ammattikorkeakoulun kurssille Ohjelmistokehityksen Teknologiat. Kyseessä on kurssin lopputyö, jossa tutustuin tarkemmin Robot Framework -testaukseen. Testitapaukset on luotu Ohjelmistoprojekti 2 -kurssin lopputyölle, jota työstin yhdessä neljän muun hengen kanssa keväällä 2024. Linkki testattuun projektiin löytyy tästä: [TimeManagement software](https://github.com/TeamRed-Ohjelmistoprojekti2/TimeManagement). Alkuperäinen Robot Framework koodini löytyy myös kyseisen projektin repositiosta: [RobotTest-kansio](https://github.com/TeamRed-Ohjelmistoprojekti2/TimeManagement/tree/main/TimeManagementFE/robotTests). Olen lisännyt kopion testituloksineen myös tähän repoon, kansioon [RobotTest](/robotTests/). Testituloksia ei yleensä viedä repoon, mutta koska kyseessä on kouluprojekti niin kyseiset tiedot löytyvät tämän repon Reports-kansion takaa.

Kyseinen Robot Framework koodi on kokonaan minun kirjoittamaani eikä kirjoituksen apuna ole käytetty tutoriaaleja. Robot Framework testauksen oppeihin syvennyin Udemyn kurssilla ["Robot Framework Test Automation - Level 2"](https://www.udemy.com/course/robot-framework-2/?couponCode=ST20MT50724), jonka opettajana toimii Bryan Lamb.

## Tiivistelmä
End-to-end-testaus on kiinnostanut minua aina ja Robot Frameworkiin sain ensikosketukseni Haaga-Helian Ohjelmistotestaus-kurssilla, jossa aihetta sivuttiin. Halusin syventyä aiheeseen vielä tarkemmin ja tavoitteenani oli oppia rakentamaan kattava testikokonaisuus toisen kurssin projektillemme. Tarkoituksena oli testata käyttöjärjestelmän HTTP-menetelmien toimivuutta. 

Koodissa on hyödynnetty Robot Frameworkin omien kirjastojen lisäksi Selenium-kirjastoa. Rakensin testit niin lokaalin koodin kuin julkaistun version testaamiseen. Molemmat koodit löytyvät reposta. Koska Ohjelmistoprojekti 2 -kurssin julkaistu versio on ajettu alas, ei testHeroku -testejä pysty enää ajamaan, kuitenkin testLocalhost -testit pystyy ajamaan sen jälkeen kun TimeManagement -sovelluksen on asentanut omalle koneelleen.

Onnistuin rakentamaan tavoitteideni mukaisen testikokonaisuuden ja kaikki testitapaukset menivät onnistuneesti läpi ja testasivat juuri sitä ominaisuutta mitä niiden oli tarkoituskin testata. 

## 1. Johdanto
Projektin tarkoituksena oli perehtyä Robot Framework testaukseen tarkemmin ja rakentaa sen avulla testikokonaisuus kehityksen alla olevalle käyttöjärjestelmälle. Tämän avulla pystyin samalla syventämään oppiani, sillä kyseinen käyttöjärjestelmä muuttui matkan varrella ja sitä oli kehittämässä minun lisäkseni neljä muuta henkilöä. Jouduin siis muutamaan testejä kurssin edetessä ja opin miten koodin muuttuminen saattaa vaikuttaa testien toimivuuteen. 

Testien rakenne kehittyi matkan varrella todella paljon ja aluksi testit olivat hyvin yksinkertaisia ja käytössä olleet muutamat muuttujat (variables) ja avainsanat (keywords) olivat samassa tiedostossa testien kanssa. Opin karttuessa pääsin hyödyntämään enemmän muuttujia sekä avainsanoja ja nämä siirtyivätkin sitten omaan tiedostoon. Huomasin myös, miten tärkeää on nimetä testit, muuttujat ja avainsanat kuvaavasti, jotta niiden ylläpito helpottuu. Käyttöjärjestelmän kehityttyä myös testien laajuus kasvoi. Käyttöjärjestelmää työstettiin sprinteissä ja jokaisen sprintin päätteeksi huolehdin, että testit toimivat ja että ne testaavat uusia kehitettyjä ominaisuuksia. Kaikki kirjoittamani testit menevät läpi onnistuneesti.

## 2. Käytetyt tekniikat
Testien rakennuksessa käytettiin `Robot Frameworkkia` sekä `Selenium-kirjastoa`. Testattava käyttöjärjestelmä rakennettiin `Reactilla`.

## 2.1. Robot Framework
Robot Framework on avainsanapohjainen automaatiokehys, jonka avulla voidaan automatisoida end-to-end testausta. Kyseessä on avoimen lähdekoodin automaatiokehikko, joka perustuu Pythoniin. Koodi kirjoitetaan ihmisystävällisesti, eli sitä lukemalla on helppoa päätellä mitä mikin osio tekee. Testikehyksestä löytyy myös kattava [dokumentaatio](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html). Robot Frameworkiin on tehty myös useita ulkoisia kirjastoja, joita voi asentaa aina omien tarpeiden mukaan. Kirjastoja pystyy myös itse luomaan. Lähde: [RobotFramework.org](https://robotframework.org/)

Robot Frameworkin testien suorittamista varten tarvitaan testit suorittavalle koneelle Python ja pip asennukset. Voit tarkistaa onko koneellasi pip asennettuna antamalla komentoriville komennon `pip --version`. Lisätietoa pip:in asennuksesta löytyy [pip dokumentaatiosta]( https://pip.pypa.io/en/stable/installation/). Voit tarkistaa onko Python jo koneellasi asennettuna komennolla `python --version` tai `python3 --version`. [Pythonin dokumentaatiosta]( https://www.python.org/downloads/) löytyy lisätietoja sen asentamisesta. 

## 2.2. Selenium Library
Tässä projektissa on hyödynnetty Selenium kirjastoa, sillä se on tehokas työkalu web-sovellusten testaamiseen ja sitä on erittäin helppo käyttää. [Kirjaston virallinen dokumentaatio]( https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Locating%20elements) tarjoaa paljon tietoa eri tavoista käyttää kirjastoa. Sieltä löytyy esimerkiksi käskyt klikata linkkiä tai elementtiä ja näissä määritelmissä pystyy käyttämään niin koodin puolelta löytyviä id tai name viittauksia kuin tekstiä, joka näkyy käyttäjälle. Xpath-määritelmiä voi myös käyttää.  Esimerkiksi kirjaston avulla voidaan käyttää helposti pyyntöjä `paina nappia, jossa lukee tallenna` tai `klikkaa elementtiä, joka löytyy tästä polusta`.  Samoin valmiina löytyy lomakkeiden täyttämistä varten tarvittavia toimintoja kuten `input text` tai sivun lukemista varten tarvittavia `page should contain` -toimintoja. Tämä kirjasto soveltui siis hyvin työn alla olleen käyttöjärjestelmän testaamiseen. 

## 3. Testattava käyttöjärjestelmä
[TimeManagement](https://github.com/TeamRed-Ohjelmistoprojekti2/TimeManagement/blob/main/README.md) on käyttöjärjestelmä, jossa käyttäjä voi kirjata työaikakirjauksia projekteille. Käyttäjän tulee rekisteröityä palveluun, jonka jälkeen hän pääsee lisäämään itselleen projekteja ja kirjaamaan työaikakirjauksia niille. Käyttäjä voi myös muokata ja poistaa omia projektejaan ja kirjauksiaan. Jokaiselle projektille voi lisätä muita käyttäjiä ja määritellä minkälaiset käyttöoikeudet heille annetaan. Projektikohtaisina rooleina ovat omistaja, käyttäjä ja seuraaja. Omistajalla on kaikki oikeudet, käyttäjä ei voi muokata tai poistaa projektia, mutta hän voi tehdä projekteille työaikakirjauksia ja seuraaja nimensä mukaisesti pääsee katselemaan tietoja, mutta ei voi lisätä seuraamilleen projekteille työaikakirjauksia. Käyttöjärjestelmän käyttöliittymä on rakennettu Reactilla.

Käyttöjärjestelmästä valikoitui testaukseen HTTP-menetelmät, sillä niiden toimivuus oli kyseiselle projektille se kaikkein kriittisin osio ja tätä pystyi hyvin testaamaan end-to-end testauksella. 

## 4. Testit
Tässä osiossa käydään läpi tarkemmin käyttöjärjestelmään kirjoitettuja testejä sekä resource-tiedoston sisältöä. Lopussa käydään myös läpi testien raportointia.

Testit voidaan ajaa komennolla `robot --name LocalhostTest -d robotTests/reports robotTests/tests/testLocalhost.robot`. Tässä on huomioituna, että käyttäjä voi ajaa testit pääkansiosta, ilman että hänen pitää navigoida testikansioon. Raporttien nimeämistä varten komennossa käytetään `--name` määrettä, jonka avulla raporttien nimessä lukee annettu LocalHostTest -otsikko. Samoin komennon osa `-d robotTests/reports` määrittää minne raportit tallennetaan. Tässä tapauksessa ne tallentuvat reports-kansion alle. Tänne myös tallentuu mahdolliset kuvankaappaukset virhetilanteissa.

## 4.1. Testitapaukset
Testien avulla on haluttu testata käyttöjärjestelmän entityjen get, post, put ja delete toiminnallisuuksia. Testattavassa käyttöjärjestelmässä näitä ovat projektit ja työaikakirjaukset. Käyttäjän omat tiedot testataan put ja post toiminnallisuuksien osalta, sillä delete ominaisuutta ei vielä käyttöjärjestelmään ole tehty. Testit voi tehdä joko kokonaisuudessaan, tai hyödyntää tageja, mikäli vain tiettyjä ominaisuuksia haluaa testata. Tagien käytön vuoksia testeistä löytyy myös muutamia toiminnallisuuksia kommenttien takaa, mikäli siis rekisteröinnin on jo tehnyt eikä halua tietokantaa tyhjentää käynnistämällä backendin uudelleen, niin voi kirjautumistestin alusta ottaa kommenttimerkin pois, jotta testi osaa avata webbiselaimen ja suunnata oikeaan osoitteeseen. Testeissä näkyy myös `Sleep` toiminnallisuutta, joka on lisätty ainoastaan demotarkoituksessa, jotta on helpompi nähdä mitä robotti tekee. Niitä ei kannata turhaan käyttää, sillä ne hidastavat testien tekemistä. 

Testit on rakennettu loogisessa järjestyksessä niin että kaikkia toiminnallisuuksia voidaan testata saman testikokonaisuuden alla. Ensimmäiseksi rekisteröidään ajonaikaiselle tietokannalle uusi käyttäjä, ja kirjaudutaan näillä tiedoilla sitten järjestelmään. Testit tarkistavat myös, että toiminnallisuudet onnistuvat esimerkiksi, että rekisteröinnin jälkeen sivulle tulee lukemaan viesti onnistuneesta rekisteröinnistä ja kun on sisään kirjautunut niin sivulla näkyy tervehdysviesti etunimen ja sukunimen kera.  

Seuraavaksi testataan uuden projektin lisäämistä ja sen otsikon muuttamista. Kun projekti on luotu ja sitä muutettu niin siihen lisätään myös käyttäjä ja tarkistetaan että tämä onnistuu. Tämän jälkeen lisätyn käyttäjän rooli muutetaan seuraajaksi. Kun tämä on mennyt onnistuneesti läpi, niin kyseinen käyttäjä poistetaan projektista. Rakensin myös testin, joka avaa projektin muokkausnäkymän ja tarkistaa vielä että projektilla ei enää ole muita käyttäjiä eli tarkistaa että näkymässä lukee ”Projektille ei ole vielä lisätty muita käyttäjiä”. Projektin poistoa ei tässä vaiheessa vielä testata, sillä ilman olemassa olevaa projektia ei voida työaikairjausnäkymää testata.

Tämän jälkeen siirrytään testaamaan työaikakirjauksia. Työaikakirjausnäkymään siirryttyä testataan, että voidaan lisätä työaikakirjaus projektille. Tämän jälkeen testataan kirjauksen muokkaus, jossa kohteena on kommentin muokkaaminen. Tässä olisi voinut testata myös muiden asioiden muokkaamista, mutta sitä ei tässä testissä tehdä. Tämän jälkeen testataan, että kyseisen kirjauksen voi vielä poistaa. Seuraavaksi siirrytään takaisin projektinäkymään, jossa tarkistetaan, että luodun projektin voi poistaa onnistuneesti.

Viimeisessä osiossa testataan vielä käyttäjän omien tietojen muokkaamista. Testissä lisätään käyttäjän etunimen perään yksi kirjain. Käyttäjän salasana syötetään myös uudelleen, jonka jälkeen varmistetaan, että muutos menee läpi onnistuneesti. Tämän jälkeen kirjaudutaan vielä ulos ja suljetaan selainikkuna.

## 4.2. Resource-tiedosto
Resource-tiedostossa voidaan määrittää testeille esimerkiksi muuttujia ja avainsanoja. Tähän tiedostoon voidaan sisällyttää uudelleenkäytettäviä osia testeistä. Tämän avulla itse testitiedostoissa ei tarvitse samaa koodia toistaa useasti. Testien ylläpito myös helpottuu, kun muutettavat osiot löytyvät samasta paikasta. Esimerkiksi jos jonkin napin tekstiä muutettaisiin niin muutoksen voi tehdä keskitetysti samasta paikasta sen sijaan että pitäisi jokaisesta testitiedostosta etsiä osiot, joissa on tämä nappi käytössä. Muutujien ja avainsanojen johdosta testitiedostot ovat myös hyvin selkeitä ja esimerkiksi testLocalhost-testitiedostosta pystyy hyvin kuka vain lukemaan mitä mikin osio tekee. Tämä tietysti vaatii myös kuvaavien avainsanojen käytön. 

Muuttujat ovat myös todella käteviä testien ylläpidon kannalta. Näin ollen samaa tekstiä ei tarvitse toistaa moneen kertaan. Esimerkiksi testauksessa käytetyn käyttäjän kirjautumistietoja voidaan käyttää muuttujien avulla, jolloin koodissa voidaan viitata suoraa muuttujaan. Näin ollen esimerkiksi käyttäjän omien tietojen muokkauksessa, jossa salasana pitää syöttää, voidaan hyödyntää samaa muuttujaa kuin kirjautumisessa. Mikäli tietoja pitäisi muuttaa niin voidaan se tehdä helposti muuttujatosion kohdalta. 

Muuttujat osiossa myös testasin erilaisia tapoja toteuttaa asioita. Näitä olivat esimerkiksi sivuilta luettava teksti. Osassa avainsanoista on käytetty muuttujaa ja toisissa taas tekstiä esimerkiksi 'page should contain' -osioissa. Jatkossa tekisin testit niin, että mikäli on mahdollista käyttää samaa tekstiä useamman avainsanan alla, niin silloin käyttäisin muuttujia, mutta mikäli kyseessä on kertaluontoinen asia, niin silloin siitä ei muuttujaa kannata välttämättä tehdä. 

## 4.3. Raportit
Aina kun testit ajetaan, niin päivittyvät myös testiraportit. Tämän vuoksi niitä ei yleensä viedä GitHubin repositoryyn. Testien tulokset näkyvät myös terminaalissa, missä testikomento on annettu. Tämä on hyvin suppea näkymä testeistä, mutta sitä kautta näkee hyvin moniko testeistä on mennyt läpi ja missä mahdolliset virheet sijaitsivat. Tämän lisäksi testien ajamisen jälkeen syntyy kolme eri raporttia, joista testien tarkempia tuloksia pystyy analysoimaan. Mikäli testit eivät mene läpi niin robotti nappaa myös kuvankaappaukset virhetilanteista. Raportit kannattaa avata selainikkunan kautta, jolloin niitä on kaikista helpoin tarkastella. 

Raporttinäkymästä pääsee tarkkailemaan myös testien läpimenoa tagien kautta. Esimerkiksi omissa testeissäni olen käyttänyt suoraan projektiin liittyvissä testeissä tagia project, rooliin liittyvissä testeissä tagia role, kirjauksiin liittyvissä testeissä tagia entry ja käyttäjää koskevissa testeissä tagia user. Käytössä on myös post, put ja delete tagit. Näin ollen raportista pääsee katsomaan myös näitä kokonaisuuksia ja testit voi ajaa myös tagien perusteella. Tässä tapauksessa tosin pitää ottaa huomioon, että kaikissa tapauksissa vaaditaan rekisteröinti ja kirjautuminen ja että kirjauksia ei voi tehdä, jos projektia ei ole luonut. 

Tagikohtaisten tietojen lisäksi raporteista löytyy yksityiskohtaiset tiedot koskien kaikkia ajettuja testejä. Tämä on myös todella hyvä paikka tarkastella virheilmoituksia, sillä niistä pääsee tutkimaan mikä tarkalleen ottaen meni vikaan. Jos esimerkiksi testissä tarkasteltiin tuliko sivulle näkyviin jotain virheilmoitusta tai tekstiä, saattaa täältä löytää hyvin selityksen, että kyseinen teksti ei koskaan ilmestynyt sivulle ja siksi testi ei mennyt läpi.

## 5. Arkkitehtuuri
Projekti on rakennettu käyttäen Robot Frameworkille olennaista projektin rakennetta, jossa testit on sijoitettu tests-kansion alle, resources-tiedosto löytyy samannimisen kansion alta ja testiraportit tallennetaan reports-kansioon. Alkuperäisen projektin gitignore-tiedostossa on määritelty, että raportteja ei viedä GitHubiin. Tässä repossa ne kuitenkin ovat poikkeuksellisesti mukana.

## 6. Oppimisen pohdinta
Tämän seminaarityön myötä oma osaamiseni koskien Robot Framework testausta kasvoi todella paljon. Sain toteutettua toimivan testauskokonaisuuden, joka hyödytti myös Ohjelmistoprojekti 2 -kurssin ryhmäläisiäni. Robot-tiedostojen aluksi olen kertonut kuinka testejä voi ajaa, vaikka itse Robot Framework testauksesta ei mitään tietäisikään. Muut ryhmäläiset pystyivät myös ajamaan testejä aina kun tekivät jotain muutoksia koodiin ja näin ollen varmistamaan, että mitään ei mennyt rikki koodimuutoksen myötä. Muilta ryhmäläisiltä sain testeistä myös kiitosta, sillä se helpotti muiden työtä, kun ei tarvinnut aina manuaalisesti tehdä käyttöjärjestelmää koskevia testejä.

### 6.1. Omat huomiot
Oman oppimiseni kannalta olin todella hyvässä tilanteessa, sillä aloitin Robot Framework testien tekemisen jo Ohjelmistoprojekti 2 -kurssityön alkuvaiheessa. Näin ollen pääsin näkemään miten testejä voi muokata matkan varrella, ja miten niitä tulee muuttaa koodin muuttumisen myötä. Esimerkiksi muutokset navigaation rakenteessa aiheuttivat sen, että ’Click Link Teksti’ -toiminto piti muuttaa ’Click Element xpath’ -toiminnoksi. 

Samoin huomasin, että käytössämme olleet Reactin dialogit aiheuttivat sen, että välillä robotti ei tiennyt mistä näkymästä hänen pitää tekstejä lukea. Tästä esimerkkinä on rekisteröitymisnäkymä, jossa käyttäjää pyydetään lisäämään käyttäjätunnus. Kuitenkin käyttäjätunnus pyydetään myös lisäämään kirjautumissivulla, jonka päälle rekisteröitymisnäkymä on siis dialogina auennut. Ihmiselle on selkeää mikä on päällimmäinen näkymä, mutta robotille kirjautumis- ja rekisteröintinäkymät näyttävät olevan samalla sivulla. Tämän sekä vastaavanlaiset ongelmat ratkaisin sitten nimeämällä osiot tai napit hieman erillä lailla. Tässä tapauksessa muutin Reactin koodissa kyseisen TextField osion name-määreen username-termistä usernameReg-termiksi. Tämän jälkeen pystyin viittaamaan uniikkiin name-määreeseen rekisteröitymissivulla. 

Samoin poista-nappeihin jouduin tekemään muutoksia ja näiden kohdalla muutin käyttäjälle näkyvää syötettä niin, että esimerkiksi projektin vieressä oleva poista-nappi ei muuttunut, mutta poiston varmistuksessa avautuvassa dialogissa lukee ”poista projekti” tai ”poista kirjaus” eikä pelkkä ”poista” termi. Tähän päädyin siksi, että se on myös käyttäjälle selkeämpää, kun tietää mitä hän on poistamassa. Muutamia id-arvoja myös lisäsin, jotta robotti voi niitä lukea. Olenkin onnellinen että pystyin rakentamaan testit keskeneräiselle ja kehityksessä olevalle käyttöjärjestelmälle, ja oppimaan testeistä näin ollen paljon enemmän kuin jos olisin rakentanut testit valmiille käyttöjärjestelmälle.

### 6.2. Xpath-määritelmän käyttö tärkeänä oppina
Kaikkein mielenkiintoisin oppi tuli kuitenkin xpath-määrityksistä. Oli mielenkiintoista oppia, miten tiettyjä elementtejä pystyy valitsemaan xpathin avulla. Esimerkiksi, etusivulla kun oli testi, jossa siirryttiin projektit-sivulle painamalla linkkiä, jossa lukee projektit. Tässä tapauksessa robotilla oli näkyvissä kaksi vaihtoehtoa, joko painaa navigaatiossa olevaa linkkiä projektit (tämä oli ennen navigaation muutoksia) tai etusivulla olevasta laatikosta painaa projektit-linkkiä. Mikäli sivulla löytyy siis sama elementti useamman kerran, kannattaa silloin käyttää xpath-määritelmää, jotta voi määritellä tarkasti mitä kautta esimerkiksi tässä tapauksessa siirrytään projektit-sivulle. 

Mikäli xpath-määrittelyssä on käyttänyt koodin rakenteeseen liittyvää polkua, niin rakenteen muuttuessa saattaa joutua myös testin xpath-määritelmää muuttamaan. Näin kävi esimerkiksi, kun muutimme projektin muokkausnäkymää ja halutun elementin polku muuttui. Nyt kyseessä oli div numero neljä kun testissä oli polussa mainittuna div numero kolme. Robotti ei siis löytänyt enää oikeaa kohtaa. Tässä olisi paras käyttää jotain muuta tapaa päästä kiinni haluttuun elementtiin, kuten esimerkiksi käyttäjän roolien valinnassa pystyin viittaamaan listan elementtiin, josta löytyy teksti ’Seuraaja’. Vaikuttaakin että viittauksissa olisi hyvä käyttää määritteitä, jotka luultavasti eivät niin helposti muutu. Kuitenkin osassa Reactin elementeissä oli haasteellista löytää muita tapoja viittauksille, kuin koodipolun määritys, esimerkiksi mikäli tietokannasta tullutta tietoa käsiteltiin map-toiminnon avulla. 

### 6.3. Opit koskien kansiorakennetta
Testailin myös omaksi ilokseni hieman erilaisia tapoja toteuttaa testejä. Kun rakensin testit myös julkaistulle versiolle, niin huomasin miksi kannattaa käyttää testeissä resources-osiota ja sieltä löytyviä variables ja keywords -toimintoja. Pystyin nimittäin hyödyntämään samoja osioita molemmissa testeissä (lokaalissa ja julkaistussa) kun ne oli määritelty resources osioon. Tämä myös helpottaa testien ylläpitämistä. Tärkeänä huomiona oli myös testien ja keywordsien selkeät nimeämiset, jotta löytää helposti mitä mikäkin testi ja keywords tekee. Yritin tutustua myös muihin kirjastoihin kuin Selenium, mutta rajallisen ajan takia en niitä käyttänyt testeissä. Muihin kirjastoihin tutustuminen on seuraavana työlistallani.

## 7. Jatkokehitys
Projektissa voisi testata myös frontendin virheenkäsittelyn toimivuutta. Yhtenä esimerkkinä voisi olla projektin kaikkien käyttäjien poisto, jonka pitäisi antaa virheilmoitus, sillä jokaisella projektilla pitää olla ainakin yksi omistaja. Samoin voisi yrittää lisätä samaa käyttäjää samalla projektille useampaan kertaan ja varmistaa, että virheviesti näkyy tässä tilanteessa oikein käyttäjälle. Näitä mahdollisia eri testitapauksia on siis hyvin paljon. Vielä pidemmälle jos testejä haluaisi kehittää niin voisi rakentaa testitapaukset niin että kirjaudutaan palveluun kahtena käyttäjänä, ja kun toinen käyttäjä on lisännyt toisen käyttäjän projektille, niin tarkistetaan, että se tulee näkyville toisen käyttäjän projektilistaan. Samoin voitaisiin tarkistaa että tämä käyttäjä-roolilla oleva henkilö voi lisätä kyseiseen projektiin työaikakirjauksia, mutta jos roolina on seuraaja, niin silloin tähän projektiin ei voi työaikakirjauksia tehdä.

## 8. Yhteenveto
Kaiken kaikkiaan seminaarityö oli mielekäs toteuttaa ja oli kiva päästä tutustumaan tarkemmin Robot Framework -testityökaluun. Seminaarityön aiheen sai valita itse ja tarkoitus oli käyttää noin 40 tuntia tämän työn tekemiseen. Kyseinen opintojakso on 5 opintopisteen arvoinen ja tämä seminaarityö kattaa 40 % sen arvosanasta.
