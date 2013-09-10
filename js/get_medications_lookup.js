(function () {
  var auth = ohauth.headerGenerator({
    consumer_key:    '6aa8d2199357db6670b03653f35a2e91',
    consumer_secret: '8fa254320524c355da88df808fc4c25e'
  });

  var url = 'https://api.howareyou.com/medications/lookup.json?ids=421161003';

  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      console.log(xhr.responseText);
    }
  }

  xhr.open('GET', url);
  xhr.setRequestHeader('Authorization', auth('GET', url));
  xhr.send();
})();

/*
 * [
 *     {
 *         "snomed_concept_id": 421161003,
 *         "term": "Beeswax",
 *         "synonyms": [ ]
 *     }
 * ]
 */
