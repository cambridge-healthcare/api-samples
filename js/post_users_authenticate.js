(function () {
  var url = 'https://api.howareyou.com/users/authenticate.json';

  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      console.log(xhr.responseText);
    }
  }

  var data = {
    email:    'demo@howareyou.com',
    password: 'Password1'
  };

  xhr.open('POST', url);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  xhr.send(ohauth.qsString(data));
})();

/*
 * {
 *     "user": {
 *         "id": "7b33dbb398811023a8512cbda455c0c9",
 *         "email": "demo@howareyou.com",
 *         "first_name": "Demo",
 *         "last_name": "User",
 *         "type": "patient",
 *         "creator_id": "",
 *         "patient_id": "f1dc858d5682c9d76722847399b4bf8e"
 *     },
 *     "consumer_token": {
 *         "key": "6aa8d2199357db6670b03653f35a2e91",
 *         "secret": "8fa254320524c355da88df808fc4c25e",
 *         "user_id": "7b33dbb398811023a8512cbda455c0c9"
 *     },
 *     "session": {
 *         "id": "DMjIvrewGtwVKkD/UIVAUwrtrnNi81U7BSv8MR4YIBU=",
 *         "key": "h0058POWHRm95zMYMh8uEvdLDcoTYKOssdmQzwnc60c=",
 *         "expiry": 1378831979
 *     }
 * }
 */
