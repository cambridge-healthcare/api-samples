(function () {
  var auth = ohauth.headerGenerator({
    consumer_key:    '6aa8d2199357db6670b03653f35a2e91',
    consumer_secret: '8fa254320524c355da88df808fc4c25e'
  });

  // Note that f1dc85[…] is the patient_id rather than the user_id
  // The patient_id must be used for all clinical data interations
  var url = 'https://api.howareyou.com/patients/658e810c58653ddf197e13e2fae4cd8a/medications.json';

  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      console.log(xhr.responseText);
    }
  }

  var params = { concept_id: '421161003', started_at: '2014-01-13T12:24:29+00:00"'};

  xhr.open('POST', url);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  xhr.setRequestHeader('Authorization', auth('POST', url, params));

  // These values are required to decrypt data
  // You will have to obtain a new session id and key from the authentication endpoint
  xhr.setRequestHeader('X-CHID-SESSION', JSON.stringify({
    "id":  "DMjIvrewGtwVKkD/UIVAUwrtrnNi81U7BSv8MR4YIBU=",
    "key": "h0058POWHRm95zMYMh8uEvdLDcoTYKOssdmQzwnc60c="
  }));

  xhr.send(ohauth.qsString(params));
})();

/*
 *   {
 *     "id": "7e0f54c3-98b6-41a8-9e95-06958eebdf2c"
 *   }
 */
