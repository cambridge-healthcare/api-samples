(function () {
  var auth = ohauth.headerGenerator({
    consumer_key:    '6aa8d2199357db6670b03653f35a2e91',
    consumer_secret: '8fa254320524c355da88df808fc4c25e'
  });

  // Note that f1dc85[…] is the patient_id rather than the user_id
  // The patient_id must be used for all clinical data interations
  var url = 'https://api.howareyou.com/patients/f1dc858d5682c9d76722847399b4bf8e/medications/421161003.json';

  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      console.log(xhr.responseText);
    }
  }

  xhr.open('DELETE', url);
  xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
  xhr.setRequestHeader('Authorization', auth('DELETE', url));

  // These values are required to decrypt data
  // You will have to obtain a new session id and key from the authentication endpoint
  xhr.setRequestHeader('X-CHID-SESSION', JSON.stringify({
      "id":  "+agf7ya6ChJisDSJv/Nmr4intQTVTNOmDlBe7Zx6m3s=",
      "key": "tWzHJ1FhbGm2cTr8ETy0Z4UMhDKFVvvNHXJbiulpKAw="
    })
  );

  xhr.send();
})();

/*
 * 1
 */
