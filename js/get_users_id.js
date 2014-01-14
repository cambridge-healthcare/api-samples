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
 * {
 *     "user" => {
 *         "id"         => "c5323558d6750f5571655b71ae2a2380",
 *         "email"      => "demo@howareyou.com",
 *         "first_name" => "Demo",
 *         "last_name"  => "User",
 *         "type"       => "patient",
 *         "patient_id" => "658e810c58653ddf197e13e2fae4cd8a"
 *     }
 * }
*/
