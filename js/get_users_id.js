(function () {
  var auth = ohauth.headerGenerator({
    consumer_key:    '6aa8d2199357db6670b03653f35a2e91',
    consumer_secret: '8fa254320524c355da88df808fc4c25e'
  });

  var url = 'https://api.howareyou.com/users/7b33dbb398811023a8512cbda455c0c9.json';

  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      console.log(xhr.responseText);
    }
  }

  xhr.open('GET', url);
  xhr.setRequestHeader('Authorization', auth('GET', url));

  // These values are required to decrypt data
  // You will have to obtain a new session id and key from the authentication endpoint
  xhr.setRequestHeader('X-CHID-SESSION', JSON.stringify({
    "id":  "DMjIvrewGtwVKkD/UIVAUwrtrnNi81U7BSv8MR4YIBU=",
    "key": "h0058POWHRm95zMYMh8uEvdLDcoTYKOssdmQzwnc60c="
  }));

  xhr.send();
})();

/*
 * [
 *     {
 *         "concept_id": 421161003,
 *         "timestamp": 1378829577,
 *         "id": "1378829577:421161003"
 *     }
 * ]
 */
