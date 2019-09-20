"use strict";


///////////////////////////////////////////////////
//////////////////////DONNEES//////////////////////
///////////////////////////////////////////////////
var qualites = document.getElementById("lienQualites");
//récupération des qualités dans un tableau
var qualite = document.querySelectorAll("li.qualite");

var modale = document.querySelectorAll(".modale");

var lien = document.querySelectorAll(".lien");

///////////////////////////////////////////////////
/////////////////////FONCTIONS/////////////////////
///////////////////////////////////////////////////

//déclenchement d'un fondu sur chacune des qualités
function onClickQualites(){
    for(var index = 0; index < qualite.length; index++){
        qualite[index].classList.add("fade-in");
    }
};


//fermer la modale lorsqu'on clique dessus
function onClickModale(index){
    modale[index].classList.add("hidden");
};

//rendre la modale visible au click d'un lien
function onClickLien(){
    for(var index = 0; index < modale.length; index++){
        modale[index].classList.remove("hidden");
    }
}





///////////////////////////////////////////////////
///////////////////CODE PRINCIPAL//////////////////
///////////////////////////////////////////////////
var init=function(){

    // ajout de l'écouteur d'évenement sur le click de la qualité
    qualites.addEventListener("click", onClickQualites);


    //ajout d'un écouteur d'évenement sur le click de la modale
    //for(var index = 0; index < modale.length; index++){
    //    => code correct mais ne fonctionne pas au sein d'une boucle
    //    => https://stackoverflow.com/questions/256754/how-to-pass-arguments-to-addeventlistener-listener-function
    //    modale[index].addEventListener("click", onClickModale(index));
    //}
    $(modale).each(function() {
        $(this).on("click", function() {
            $(this).addClass("hidden");
        });
    });


    //ajout d'un écouteur d'évenement sur le click des liens
    $(lien).each(function() {
        $(this).on("click", function() {
            var idModale = $(this).attr("href");
            $(idModale).removeClass("hidden");
        });
    });


    //supprimer écouteur d'évènement de la fermeture au click à l'intérieur de la modale (class="noClose")
    $(".noClose").click(function(event){
        event.stopPropagation();
    });


};

// Lancement la fonction "init" au chargement du dom
document.addEventListener("DOMContentLoaded", init);

