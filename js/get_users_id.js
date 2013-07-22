var auth = ohauth.headerGenerator({
    consumer_key:    'bf71f03a76e68b10f984797bd3cd3311',
    consumer_secret: '6aa8566be1f0a697b3a2dbb97119cf6d'
});

var url = 'https://api.howareyou.com/users/da0ff676622eaa2faee450b231b322c4.json';

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
 * {
 *   "user": {
 *     "id": "da0ff676622eaa2faee450b231b322c4",
 *     "email": "demo@howareyou.com",
 *     "first_name": "demo",
 *     "last_name": "user",
 *     "type": "",
 *     "creator_id": ""
 *   }
 * }
 */
