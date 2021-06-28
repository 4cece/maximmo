
/* SEND MAIL FOR RECALL */
const btnSendForm = document.getElementById("btnSendCall");

btnSendForm.addEventListener("click", function () {

    if (document.cookie.indexOf('call') > -1 ) {
        alert("cookie exists");
      }

    let telNumber = document.getElementById("phoneInput").value;
                        
        if( telNumber.length >= 10){

            let phoneNumber = document.getElementById("phoneInput").value;
            let formData = new FormData();
            formData.append("number", phoneNumber);  
            formData.append("timestamp", Date.now() + 900000)

            /* AJAX */
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {

                    /* APPEL REUSSI */
                    let parent = document.getElementById("formCallClient").parentElement;
                    parent.innerHTML = "<div class='alert alert-success w300'>Votre message a bien été envoyé, vous serez rappelé(e) d'ici quelques minutes</div>";
                    btnSendForm.remove();
                    
                    /* ON CREE UN COOKIE */
                    var d = new Date();
                    d.setTime(d.getTime() + (60*60*1000));
                    var expires = "expires="+ d.toUTCString();
                    document.cookie = "call=asked; expires=" + expires + ";path=/";
                    /* ON CREE UN COOKIE */
                    

                }
            };
            xhttp.open("POST", "php/sendEmailCall.php");
            xhttp.send(formData);
            /* AJAX */

        }else{
            alert("Mauvais numéro de téléphone");
        }

})


/* FORM FOCUS INPUT */
function focusInput(elem){
    document.getElementById(elem).focus();
}

/* NEXT IMG SLIDER REVIEWS */
function changeImg(sort){

    const keyChanges = [ "imgReviews" , "imgWait", "card-review"];

    keyChanges.forEach((changement) => {
        
        //Review à boucler
        let imgActive = document.getElementsByClassName(changement);
        let imgMain = imgActive[0];
        let imgIncoming = imgActive[1];
        let imgLast = imgActive[2];
        
        if(sort === "less"){
            imgLast.classList.add(changement + "Active");
            imgMain.classList.remove(changement + "Active");
            imgLast.classList.remove("d-none");
            imgMain.classList.add("d-none");
            
            let parentDiv = imgMain.parentElement;
            parentDiv.appendChild(imgMain);
            parentDiv.appendChild(imgIncoming);

        }else {
            
            imgIncoming.classList.add(changement + "Active");
            imgMain.classList.remove(changement + "Active");
            imgIncoming.classList.remove("d-none");
            imgMain.classList.add("d-none");
            let parentDiv = imgMain.parentElement;
            parentDiv.appendChild(imgMain);

        }
        
        
    });

}


/* SEND MAIL FOR RECALL */



/* SEARCH CITY */

const locations = [];
fetch("php/getCommunes.php")
.then(resp => resp.json())
.then(data => {
    for(let dept of data){ 
        locations.push(dept); 
    }
})
console.log(locations); 


function chooseItem(elem){
    // elem = id  
    for( let i = 0 ; i < locations.length; i++ ){
        if(locations[i].id == elem){
            let input = document.getElementById("localisation");
            input.value = ucFirst(locations[i].nom.toLowerCase());
            let inputHidden = document.getElementById("localisationHidden");
            inputHidden.value = locations[i].id;

            let divResults = document.getElementById("resultsLocalisation");
            divResults.style.display = "none";
        }
    }

}

const localisation = document.getElementById("localisation");

const searchLoc = localisation.onkeyup = ( () => {
    let divResults = document.getElementById('resultsLocalisation');
    if(localisation.value.length >= 3){

        divResults.style.display = "block";
        divResults.innerHTML = "";

        for( let i = 0 ; i <  locations.length ; i++){
            let position = locations[i].nom.toLowerCase().includes(localisation.value.toLowerCase());
            if(position){
                let listResult = document.createElement("li");
                listResult.setAttribute("onclick", "chooseItem(" + locations[i].id + ")");
                // let liContent = document.createTextNode("<a href=''>" + locations[i].ville + " (" + locations[i].dept + ")</a>");
                listResult.innerHTML = ucFirst(locations[i].nom.toLowerCase()) + " (" + locations[i].code_postal + ")";
                divResults.appendChild(listResult);
            }
        }
    }else{
        divResults.innerHTML = "";
    }
});

localisation.onclick = ( () => searchLoc());

document.body.onclick = () => {
    document.querySelector('#resultsLocalisation').style.display = "none"
}


