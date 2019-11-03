$(function() {
  let select1 = $('#spot_prefecture_pre_id');
  let selectOuter = $('#prefecture_select');
  
  
  function buildHTML() {
    let html = `
                <div class="spots__main__new__contents__form__prefecture--inner">
                  <select name="spot[prefecture_id]", id="spot_prefecture_id">
                  </select>
                </div>
                `
    selectOuter.append(html);
  }
  function insertCity(prefecture) {
    console.log('OK');
    let object = $('#spot_prefecture_id');
    let html = `
                <option value="${prefecture.id}">${prefecture.name}</option>
              `
    object.append(html);
  }


  function nextSelect(e) {
    e.preventDefault();
    let preNumber = $(this).val();
    
    let href = '/spots/search_prefecture';
    $.ajax({
      url: href,
      type: "GET",
      data: { pre_number: preNumber },
      dataType: 'json'
    })
    
    .done(function(prefectures) {
      let selector = $('.spots__main__new__contents__form__prefecture--inner');
      console.log(preNumber);
      console.log(selector.length);
      if (selector.length > 1) {
        $('.spots__main__new__contents__form__prefecture--inner:last').remove();
      }
      buildHTML();
      prefectures.forEach(function(prefecture) {
        insertCity(prefecture);
      });
    })
    .fail(function() {
      alert('エラー');
    })
  }
  select1.change(nextSelect);
})