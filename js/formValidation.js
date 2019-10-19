"use strict";

var errors=[];

var checkRequired = function(){
    var fields = $("[data-required]");
    var currentField, fieldName;

    // on boucle sur tous les champ qui possèdent l'attribut data-required
    for (var index = 0; index < fields.length ; index++) {
        currentField = fields[index];
        fieldName = currentField.name;

        // si le champ est vide on créée un erreur
        if(currentField.value === ""){
            errors.push("Le champ "+ fieldName +" est requis");
        }
    }
};




var checkEmail = function(){
    var field = document.getElementById("mail");

    // expression régulière pour identifier un email
    var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([\w]+\.)+[a-zA-Z]{2,}))$/;
    if(field.value.match(regex) === null){
        errors.push("Le champ email doit être un email valide" );
    }
};



var displayErrors = function(){
    /**
     * on veut remplacer le contenu de la zone d'erreur
     * 1. on commence par générer un <ul>
     * 2. on boucle sur les erreurs du formulaire
     * 3. à chaque erreur on créée un nouvel <li>
     * 4. une fois terminé on affiche ce bloc
     */
    var ul =  $("<ul class='errors'>");
    $.each(errors, function(){
        ul.append($("<li>").html(this))
    });
    $("#form .bouton").before(ul);
};




var onSubmitForm = function(event){
    errors = [];
    // vérification des différentes contraintes sur le formulaire
    checkRequired();
    checkEmail();

    // Si des erreurs ont été détectées sur la vérification du formulaire
    // on bloque son envoi au php (preventDefault) et on affiche les erreurs
    if(errors.length > 0){
        // on empèche la soumission du formulaire
        event.preventDefault();

        // on affiche les erreurs
        displayErrors();
    }
};






///////////////////////////////////////////////////
///////////////////CODE PRINCIPAL//////////////////
///////////////////////////////////////////////////
var init=function(){

    var submitForm = document.getElementById("form");
    submitForm.addEventListener("submit", onSubmitForm);
};



// Lancement la fonction "init" au chargement du dom
document.addEventListener("DOMContentLoaded", init);