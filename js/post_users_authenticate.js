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
 *         "id": "da0ff676622eaa2faee450b231b322c4",
 *             "email": "demo@howareyou.com",
 *             "first_name": "demo",
 *             "last_name": "user",
 *             "type": "",
 *             "creator_id": ""
 *     },
 *     "consumer_token": {
 *         "key": "bf71f03a76e68b10f984797bd3cd3311",
 *         "secret": "6aa8566be1f0a697b3a2dbb97119cf6d",
 *         "user_id": "da0ff676622eaa2faee450b231b322c4"
 *     }
 * }
 */
