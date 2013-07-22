var auth = ohauth.headerGenerator({
    consumer_key:    'bf71f03a76e68b10f984797bd3cd3311',
    consumer_secret: '6aa8566be1f0a697b3a2dbb97119cf6d'
});

var url = 'https://api.howareyou.com/patients/da0ff676622eaa2faee450b231b322c4/medications.json';

var xhr = new XMLHttpRequest();

xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
        console.log( xhr.responseText );
    }
}

var params = {"values" : "421161003"};

xhr.open('POST', url);
xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xhr.setRequestHeader('Authorization', auth('POST', url, params));
xhr.send(ohauth.qsString(params));
/*
 * [
 *   {
 *     "concept_id": 7947003,
 *     "timestamp": 1374502172,
 *     "id": "1374502172:7947003"
 *   },
 *   {
 *     "concept_id": 90332006,
 *     "timestamp": 1374502172,
 *     "id": "1374502172:90332006"
 *   },
 *   {
 *     "concept_id": 421161003,
 *     "timestamp": 1374503350,
 *     "id": "1374503350:421161003"
 *   }
 * ]
 */
