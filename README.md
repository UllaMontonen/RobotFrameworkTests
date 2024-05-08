# Robot Framework testaus seminaarityönä

TYÖN ALLA

## Taustaa
Tämän seminaarityön on luonut Ulla Montonen Haaga-Helian Ammattikorkeakoulun kurssille Ohjelmistokehityksen Teknologiat. Kyseessä on kurssin lopputyö, jossa tutustuin tarkemmin Robot Framework testaukseen. Testitapaukset on luotu Ohjelmistoprojekti 2 -kurssin lopputyölle, jota työstin yhdessä neljän muun hengen kanssa keväällä 2024. Linkki projektiin löytyy tästä: [TimeManagement software](https://github.com/TeamRed-Ohjelmistoprojekti2/TimeManagement).  Alkuperäinen Robot Framework koodini löytyy myös kyseisen projektin repositiosta: [RobotTest-kansio] (https://github.com/TeamRed-Ohjelmistoprojekti2/TimeManagement/tree/main/TimeManagementFE/robotTests). Olen lisännyt kopion testituloksineen myös tähän repoon, kansioon RobotTest. Testituloksia ei yleensä viedä repoon, mutta koska kyseessä on kouluprojekti niin kyseiset tiedot löytyvät tämän repon Reports-kanison takaa.

Robot Framework koodi on kokonaan minun kirjoittamaani eikä kirjoituksen apuna ole käytetty tutoriaaleja. Robot Framework testauksen oppeihin syvennyin Udemyn kurssilla ["Robot Framework Test Automation - Level 2"](https://www.udemy.com/course/robot-framework-2/?couponCode=ST20MT50724), jonka opettajana toimii Bryan Lamb.

## Tiivistelmä
Haaga-Helian Ohjelmistotestaus-kurssilla, jossa aihetta sivuttiin. Halusin syventyä aiheeseen vielä tarkemmin ja tavoitteenani oli oppia rakentamaan kattava testikokonaisuus toisen kurssin projektillemme. Tarkoituksena oli testata projektin HTTP-menetelmiä ja REST-rajapinnan toimivuutta. 

Koodissa on hyödynnetty Robot Frameworkin omien kirjastojen lisäksi Selenium-kirjastoa. Rakensin testit niin lokaalin koodin kuin julkaistun version testaamiseen. Molemmat koodit löytyvät reposta. Koska Ohjelmistoprojekti 2 kurssin julkaistu versio on ajettu alas, ei testHeroku -testejä pysty enää ajamaan, kuitenkin testLocalhost -testit pystyy ajamaan sen jälkeen kun TimeManagement -sovelluksen on asentanut omalle koneelleen.

Onnistuin rakentamaan tavoitteideni mukaisen testikokonaisuuden ja kaikki testitapaukset menivät onnistuneesti läpi ja testasivat juuri sitä ominaisuutta mitä niiden oli tarkoituskin testata. 


## 1. Johdanto
Projektin tarkoituksena oli perehtyä Robot Framework testaukseen tarkemmin ja rakentaa sen avulla testikokonaisuus kehityksen alla olevalle käyttöjärjestelmälle. Tämän avulla pystyin samalla syventämään oppiani, sillä kyseinen käyttöjärjestelmä muuttui matkan varrella ja sitä oli kehittämässä minun lisäkseni neljä muuta henkilöä. Jouduin siis muutamaan testejä matkan varrella koodin kehittyessä ja opin miten tärkeää nimeämiskäytännöt ovat Robot Framework testauksessa.  

Testien rakenne kehittyi matkan varrella todella paljon ja aluksi testit olivat hyvin yksinkertaisia ja käytössä olleet muutamat variablet ja keywordsit oli samassa tiedostossa testien kanssa. Opin karttuessa pääsin hyödyntämään enemmän variables ja keywords osioita ja ne siirtyivätkin omaan tiedostoon. Käyttöjärjestelmän kehityttyä myös testien laajuus kasvoi. Käyttöjärjestelmää työstettiin sprinteissä ja jokaisen sprintin päätteeksi huolehdin, että testit toimivat ja että ne testaavat uusia kehitettyjä ominaisuuksia. Kaikki kirjoittamani testit menevät läpi onnistuneesti.


## 2. Käytetyt tekniikat
Testien rakennuksessa käytettiin lähinnä Robot Frameworkkia sekä Selenium kirjastoa.


## 2.1. Robot Framework
Ohjeet myös miten testit voidaan tehdä ja mitä vaatii (Python ja pip asennettuna)

## 2.2. Selenium Library


## 3. Testattava käyttöjärjestelmä
TimeManagement on käyttöjärjestelmä, jossa käyttäjä voi kirjata työaikakirjauksia projekteille. Käyttäjän tulee rekisteröityä palveluun, jonka jälkeen hän pääsee lisäämään itselleen projekteja ja kirjaamaan työaikakirjauksia niille. Käyttäjä voi myös muokata ja poistaa omia projektejaan ja kirjauksiaan. Jokaiselle projektille voi lisätä muita käyttäjiä ja määritellä minkälaiset käyttöoikeudet heille annetaan. Projektikohtaisina rooleina ovat omistaja, käyttäjä ja seuraaja. Omistajalla on kaikki oikeudet, käyttäjä ei voi muokata tai poistaa projektia, mutta hän voi tehdä projekteille työaikakirjauksia ja seuraaja nimensä mukaisesti pääsee katselemaan tietoja, mutta ei voi lisätä seuraamilleen projekteille työaikakirjauksia. Käyttöjärjestelmä on rakennettu Reactilla.

## 4. Testit


## 4.1. Testien kirjoitus


## 4.2. Resource-tiedosto


## 4.3. Raportit



## 5. Arkkitehtuurikaavio
Projekti on rakennettu käyttäen Robot Frameworkille olennaista projektin rakennetta, jossa testit on sijoitettu tests-kansion alle, resources-tiedosto löytyy samannimisen kansion alta ja testiraportit tallennetaan reports kansioon. Alkuperäisen projektin gitignore-tiedostossa on määritelty, että raportteja ei viedä GitHubiin. Tässä repossa ne kuitenkin ovat poikkeuksellisesti mukana.


## 6. Oppimisen pohdinta
Tämän seminaarityön myötä oma osaamiseni koskien Robot Framework testausta kasvoi todella paljon. Sain toteutettua toimivan testauskokonaisuuden, joka hyödytti myös Ohjelmistoprojekti 2 kurssin ryhmäläisiäni. Robot-tiedostojen aluksi olen kertonut kuinka testejä voi ajaa, vaikka itse Robot Framework testauksesta ei mitään tiedä. Muut ryhmäläiset pystyivät myös ajamaan testejä aina kun tekivät jotain muutoksia koodiin ja varmistamaan, että mitään ei mennyt rikki koodimuutoksen myötä. Muilta ryhmäläisiltä sain testeistä myös kiitosta, sillä se helpotti muiden työtä, kun ei tarvinnut aina manuaalisesti tehdä käyttöjärjestelmää koskevia testejä.

### 6.1. Omat huomiot
Oman oppimiseni kannalta olin todella hyvässä tilanteessa, sillä aloitin Robot Framework testien tekemisen jo Ohjelmistoprojekti 2 -kurssin aikana. Näin ollen pääsin näkemään miten testejä voi muokata matkan varrella, ja miten niitä tulee muuttaa koodin muuttumisen myötä. Esimerkiksi muutokset navigaation rakenteessa aiheuttivat sen, että Click Link Teksti -toiminto piti muuttaa Click Element xpath -toiminnoksi. Samoin huomasin, että käytössämme olleet Reactin dialogit aiheuttivat sen, että välillä robotti ei tiennyt mistä näkymästä hänen pitää tekstejä lukea. Tästä esimerkkinä on rekisteröitymisnäkymä, jossa käyttäjää pyydetään lisäämään käyttäjätunnus. Kuitenkin käyttäjätunnus pyydetään myös lisäämään kirjautumissivulla, jonka päälle rekisteröitymisnäkymä on siis dialogina auennut. Ihmiselle on selkeää mikä on päällimmäinen näkymä, mutta robotille kirjautuminen ja rekisteröintinäkymät näyttävät olevan samalla sivulla. Tämän ja vastaavan ongelmat ratkaisin sitten nimeämällä osiot tai napit hieman erillä tavalla. Tässä tapauksessa muutin Reactin koodissa kyseisen TextField osion name määreen username-termistä usernameReg-termiksi. Samoin poista nappeihin jouduin tekemään samantyylisiä muutoksia, tosin siinä muutin myös käyttäjälle näkyvää syötettä niin, että esimerkiksi projektin vieressä oleva poista-nappi ei muuttunut, mutta poiston varmistuksessa lukee ”poista projekti” eikä pelkkä ”poista” termi. Muutamia id-arvoja myös lisäsin, jotta robotti voi niitä lukea. 

### 6.2. Xpath-määritelmän käyttö tärkeänä oppina

Kaikkein mielenkiintoisin oppi tuli kuitenkin xpath-määrityksistä. Oli mielenkiintoista oppia, miten tiettyjä elementtejä pystyy valitsemaan xpathin avulla. Esimerkiksi, etusivulla kun oli testi, jossa siirryttiin projektit-sivulle painamalla linkkiä, jossa lukee projektit. Tässä tapauksessa robotilla oli näkyvissä kaksi vaihtoehtoa, joko painaa navigaatiossa olevaa linkkiä projektit (tämä oli ennen navigaation muutoksia) tai etusivulla olevasta laatikosta painaa projektit-linkkiä. Mikäli sivulla löytyy siis sama elementti useamman kerran, kannattaa silloin käyttää xpath-määritelmää, jotta voi määritellä tarkasti mitä kautta esimerkiksi tässä tapauksessa siirrytään projektit-sivulle. Tosin mikäli tässä on käyttänyt koodin rakenteeseen liittyvää määritelmää, niin rakenteen muuttuessa täytyy myös testin xpath-määritelmää muuttaa. Näin kävi esimerkiksi, kun lisäsimme roolin valikkoon valinnan ”Valitse”. Kyseisessä testissä olin määritellyt xpathin avulla, että lisätylle käyttäjälle valitaan rooli, joka on valikossa toisena. Tämän koodimuutoksen myötä se olikin nyt valikossa kolmantena.

### 6.3. Opit koskien kansiorakennetta

Testailin myös omaksi ilokseni hieman erilaisia tapoja toteuttaa testejä. Kun rakensin testit myös julkaistulle versiolle, niin huomasin miksi kannattaa käyttää testeissä resources osiota ja sieltä löytyviä variables ja keywords toimintoja. Pystyin nimittäin hyödyntämään samoja osioita molemmissa testeissä (lokaalissa ja julkaistussa) kun ne oli määritelty resources osioon. Yritin tutustua myös muihin kirjastoihin kuin Selenium, mutta rajallisen ajan takia en niitä käyttänyt testeissä. Muihin kirjastoihin tutustuminen on seuraavana työlistallani.

## 7. Jatkokehitys

Projektia voisi jatkaa vielä niin, että frontendin virheenkäsittelyä testataan kokeilemalla erilaisia virheenkäsittelyjä ja niiden toimivuutta. Yhtenä esimerkkinä voisi olla projektin kaikkien käyttäjien poisto, jonka pitäisi antaa virheilmoitus, sillä jokaisella projektilla pitää olla ainakin yksi omistaja. Samoin voisi yrittää lisätä samaa käyttäjää samalla projektille useampaan kertaan ja varmistaa, että virheviesti näkyy tässä tilanteessa oikein käyttäjälle. Vielä pidemmälle jos testejä haluaisi kehittää niin voisi rakentaa testitapaukset niin että kirjaudutaan palveluun kahtena käyttäjänä ja kun toinen käyttäjä on lisännyt toisen projektille, niin tarkistetaan, että se tulee näkyville toisen käyttäjän projektilistaan. 
