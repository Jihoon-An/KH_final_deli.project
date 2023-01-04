history.pushState(null, null, location.href);
window.onpopstate = function(event) {
    history.go(1);
};

$("#complete").on("click", function () {
    location.href = "/order/history";
})
