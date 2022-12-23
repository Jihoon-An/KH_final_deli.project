<style>
  a#topBtn {
    background-color: #e84c4f;
    position: fixed; /* 포지션 고정 */
    margin: 0 auto;
    left: 310px;
    right: 0; /* 오른쪽에서 2% - %도 할수 있음*/
    bottom: 90px; /* 밑에서 5px */
    display: none; /* 보여지지 없음 - 기본적으로 안보여지게 */
    z-index: 30; /* 포지션을 먼저 지정후 z-좌표(레이어) : 9999입니다. */
    border-radius: 50%;
    width: 30px;
    height: 30px;
    box-shadow: 0 2px 5px -2px rgba(0,0,0,0.7);
  }

  a#topBtn {
    color: #F8F5F2;
    text-decoration: none;
  }

  a#topBtn:link {
    color: #F8F5F2;
  }

  a#topBtn:hover {
    color: #F8F5F2;
  }

  a#topBtn:active {
    color: #F8F5F2;
  }
</style>

<script>
  $(function () { // 보이기 | 숨기기
    $(window).scroll(function () {
      if ($(this).scrollTop() > 250) { //250 넘으면 버튼이 보여짐니다.
        $('#topBtn').fadeIn();
      } else {
        $('#topBtn').fadeOut();
      }
    }); // 버튼 클릭시
    $("#topBtn").click(function () {
      $('html, body').animate({
        scrollTop: 0 // 0 까지 animation 이동합니다.
      }, 100); // 속도 400
      return false;
    });
  });
</script>

<a id="topBtn" href="#">
  <div style="position: absolute; top: 7px; left: 8px" class="text-center">
    <i class="fa-solid fa-chevron-up"></i></div>
</a>