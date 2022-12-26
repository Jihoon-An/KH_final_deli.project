<style>
    #deli_back{
        z-index: 30;
        width: 50px;
        position: fixed;
        margin: 0 auto;
        left: -320px;
        right: 0;
        top: 0;
        height: 50px;
        padding-top: 16px;
        color: #E84C4F;
        text-align: center;
    }
</style>

<div id="deli_back"><i class="fa-solid fa-arrow-left"></i></div>

<script>
    $("#deli_back").on("click",function (){
        history.back();
    })
</script>