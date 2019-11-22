$(function() {
  let select1 = $('#spot_prefecture_pre_id');
  let selectOuter = $('#prefecture_select');
  
  
  
  function buildHTML() {
    let html = `
                <div class="spots__main__new__contents__form__prefecture--inner spots__main__new__contents__form__prefecture__second">
                  <select name="spot[prefecture_id]", id="spot_prefecture_id">
                  </select>
                </div>
                <div class="spots__main__new__contents__form__prefecture--inner spots__main__new__contents__form__prefecture__second">
                  <input placeholder="(任意)市町村以下" type="text" name="spot[address]" id="spot_address">
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
      let selector = $('.spots__main__new__contents__form__prefecture__second');
      if (selector.length >= 2) {
        selector.remove();
      }
      
      buildHTML();
      prefectures.forEach(function(prefecture) {
        insertCity(prefecture);
      })
      
    })
    .fail(function() {
      alert('エラー');
    })
  }

  function preview(input) {
    console.log(input);
    var i = $('.spots__main__new__contents__form__images__fields__field').size() - 1;
    var parent = $(input).parent();
    var class_name = parent.attr('class');
    var html =
    `
    <li class="spots__main__new__contents__form__images__fields__field">
      <label id="img${i + 1}_label" for="spot_photos_attributes_${i + 1}_image">${i + 2}.
        <i class="fas fa-camera"></i>
        選択
      </label>
      <div class="spots__main__new__contents__form__images__fields__field__preview">
        <input class="spot_img" type="file" name="spot[photos_attributes][${i + 1}][image]" id="spot_photos_attributes_${i + 1}_image">
        <input type="hidden" name="spot[photos_attributes][${i + 1}][image_cache]" id="spot_photos_attributes_${i + 1}_image_cache">
        <input type="hidden" name="spot[photos_attributes][${i + 1}][id]" id="spot_photos_attributes_${i + 1}_id">
        <img id="img${i + 1}_prev" src="">
      </div>
    </li>
    `
    
    
    // 新規アップロードと、既存ファイルの変更で、場合分け
    // 選択して下さい => 新規
    // 変更する => 変更
    // 選択済みのブロックはクラスで分かるようにする

    // 選択済みを変更 => image_tagを変更、新規file_fieldは増やさない
    // thisがfile_fieldの何個目か => そのimgタグを操作したい
    if(class_name.match(/complete/)) {
      var index = $('.spots__main__new__contents__form__images__fields__field').index($(input).parent().parent()) ;
      console.log(index);
      console.log($(this).parent().find("img"));
      var img = $(this).parent().find("img");
      // console.log($(img));
      
      // console.log(input.prop('files')[0]);

      var reader = new FileReader();
      reader.readAsDataURL(input.files[0]);
      reader.onload = function(e) {
        // $(img).attr('src', e.target.result);
        console.log(e.target.result);
        $(`#img${index}_prev`).attr('src', e.target.result);
      }
      
      // console.log(index);

    } else {
      // 新規file_field作成
      // プレビュー用のreaderを作成 => thisのクラス名追加(アップ済) => 新規file_field追加
      
      console.log(i);
      var reader = new FileReader();
      reader.readAsDataURL(input.files[0]);
      reader.onload = function(e) {

        // プレビュー表示
        $(`#img${i}_prev`).attr('src', e.target.result);
        // ラベル変更
        let label = $(`#img${i}_label`);
        // label.text('変更する');
        
        parent.addClass('spots__main__new__contents__form__images__fields__field__preview--complete');
        // 新規file_field追加
        if(i < 4) {
          $('.spots__main__new__form__images__fields').append(html);
        }
        
      }
    } 
  }

  select1.change(nextSelect);

  $(document).on('change', '.spot_img', function() {
    preview(this);
  });
})