$(document).ready(function() {
    $("#flip").bind("click", function() {
        $("#panel").slideDown("slow");
        document.getElementById("flip").style.display = "none";
        document.getElementById("btn").style.display = "unset";
    });
    $("#btn").bind("click", function() {
        $("#panel").slideUp("slow");
        document.getElementById("btn").style.display = "none";
        document.getElementById("flip").style.display = "unset";
    });
});