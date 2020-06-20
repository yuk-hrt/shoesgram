$(function() {

  let search_list = $(".contents.row");

  function appendShoe(shoe) {
    if(shoe.user_sign_in && shoe.user_sign_in.id == shoe.user_id){
      let html = `
                <div class="content_post" style="background-image: url(${shoe.image});">
                  <div class="more">
                    <span><img src="/assets/arrow_top.png"></span>
                    <ul class="more_list">
                      <li>
                        <a href="/shoes/${shoe.id}" data-method="get" >詳細</a>
                      </li>
                      <li>
                        <a href="/shoes/${shoe.id}/edit" data-method="get" >編集</a>
                      </li>
                      <li>
                        <a href="/shoes/${shoe.id}" data-method="delete" >削除</a>
                      </li>
                    </ul>
                  </div>
                  <span class="name">
                    <a href="/users/${shoe.user_id}">
                      ${shoe.name}
                    </a>
                  </span>
                </div>
                ${shoe.text}
                `
    search_list.append(html);
    } else {
      let html = `
                <div class="content_post" style="background-image: url(${shoe.image});">
                  <div class="more">
                    <span><img src="/assets/arrow_top.png"></span>
                    <ul class="more_list">
                      <li>
                        <a href="/shoes/${shoe.id}" data-method="get" >詳細</a>
                      </li>
                    </ul>
                  </div>
                  <span class="name">
                    <a href="/users/${shoe.user_id}">
                      ${shoe.name}
                    </a>
                  </span>
                </div>
                ${shoe.text}
                `
    search_list.append(html);
    }
  }

  function appendErrMsgToHTML(msg) {
    let html = `
              <div class='name'>${ msg }</div>
              `
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/shoes/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(shoes) {
      search_list.empty();
      if (shoes.length !== 0) {
        shoes.forEach(function(shoe){
          appendShoe(shoe);
        });
      }
      else {
        appendErrMsgToHTML("一致するShoesがありません");
      }
    })
    .fail(function() {
      alert('error');
    });
    
  });
});