var auth = ohauth.headerGenerator({
    consumer_key:    'bf71f03a76e68b10f984797bd3cd3311',
    consumer_secret: '6aa8566be1f0a697b3a2dbb97119cf6d'
});

var url = 'https://api.howareyou.com/medications/lookup.json?ids=421161003';

var xhr = new XMLHttpRequest();

xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
        console.log( xhr.responseText );
    }
}

xhr.open('GET', url);
xhr.setRequestHeader('Authorization', auth('GET', url));
xhr.send();
/*
 * [
 *   {
 *     "id": 421161003,
 *     "term": "Beeswax"
 *   }
 * ]
 */
