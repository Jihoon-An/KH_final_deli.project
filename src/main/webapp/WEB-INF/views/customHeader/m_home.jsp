<style>
  #deli_home{
    z-index: 30;
    width: 50px;
    position: fixed;
    margin: 0 auto;
    left: 320px;
    right: 0;
    top: 0;
    height: 50px;
    padding-top: 16px;
    color: #E84C4F;
    text-align: center;
  }
</style>

<div id="deli_home"><i class="fa-solid fa-house"></i></div>

<script>
    $("#deli_home").on("click",function (){
        location.replace('/');
    })
</script>
