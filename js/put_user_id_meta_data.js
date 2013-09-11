(function () {
  var auth = ohauth.headerGenerator({
    consumer_key:    '6aa8d2199357db6670b03653f35a2e91',
    consumer_secret: '8fa254320524c355da88df808fc4c25e'
  });

  var url = 'https://api.howareyou.com/users/7b33dbb398811023a8512cbda455c0c9/meta_data.json';

  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      console.log( xhr.responseText );
    }
  }

  var params = {data: JSON.stringify({meta_key: 'meta_value'})}

  xhr.open('PUT', url);
  xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
  xhr.setRequestHeader('Authorization', auth('PUT', url, params));

  // These values are required to decrypt data
  // You will have to obtain a new session id and key from the authentication endpoint
  xhr.setRequestHeader('X-CHID-SESSION', JSON.stringify({
    "id":  "DMjIvrewGtwVKkD/UIVAUwrtrnNi81U7BSv8MR4YIBU=",
    "key": "h0058POWHRm95zMYMh8uEvdLDcoTYKOssdmQzwnc60c="
  }));

  xhr.send(ohauth.qsString(params));
})();

/*
 * {
 *     "meta_data": {
 *         "user_id": "7b33dbb398811023a8512cbda455c0c9",
 *         "data": "{\"meta_key\":\"meta_value\"}"
 *     }
 * }
 */
