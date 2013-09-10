(function () {
  var auth = ohauth.headerGenerator({
    consumer_key:    '6aa8d2199357db6670b03653f35a2e91',
    consumer_secret: '8fa254320524c355da88df808fc4c25e'
  });

  // Note that this is the patient_id rather than the user id
  // The patient_id must be used for all clinical data interations
  var url = 'https://api.howareyou.com/patients/f1dc858d5682c9d76722847399b4bf8e/medications.json';

  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      console.log(xhr.responseText);
    }
  }

  var params = { values: '421161003' };

  xhr.open('POST', url);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  xhr.setRequestHeader('Authorization', auth('POST', url, params));

  // These values are required to decrypt data
  // You will have to obtain a new session id and key from the authentication endpoint
  xhr.setRequestHeader('X-CHID-SESSION', JSON.stringify({
      "id":  "+agf7ya6ChJisDSJv/Nmr4intQTVTNOmDlBe7Zx6m3s=",
      "key": "tWzHJ1FhbGm2cTr8ETy0Z4UMhDKFVvvNHXJbiulpKAw="
    })
  );

  xhr.send(ohauth.qsString(params));
})();

/*
 * [
 *   {
 *     "concept_id": 7947003,
 *     "timestamp":  1374502172,
 *     "id":        "1374502172:7947003"
 *   },
 *   {
 *     "concept_id": 90332006,
 *     "timestamp":  1374502172,
 *     "id":        "1374502172:90332006"
 *   },
 *   {
 *     "concept_id": 421161003,
 *     "timestamp":  1374503350,
 *     "id":        "1374503350:421161003"
 *   }
 * ]
 */
