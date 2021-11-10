
//VARIABLES ---------------------------------------------------------------------------------

//création des div du digit dynamiquement
let nbDivLigne = 3;
let nbDivColonne = 3;
//gestion de l'affichage aléatoire des chiffres entre 0 et 9 dans chaque Digit
	//on déclare dans un premier tps nos valeurs min et max du digit
let min = 1;
let max = 10;
let longMDP = 4;
let stateMDPEntre = 0;
let login = " ";
let MDP = " ";
//puis ensuite un tableau qui stocker les valeurs établi aléatoirement
let tab_ChiffreDigit=[100,100,100,100,100,100,100,100,100];
let tab_LoginEntre=[100,100,100,100];


sessionStorage.setItem("passageLoginEleve","elias");
sessionStorage.setItem("passageMDPEleve","0606");
sessionStorage.setItem("passageLoginProf","professeur");
sessionStorage.setItem("passageMDPProf","0007");

let textErreurLogin = "Votre login est incorrect";
let textErreurMDP = "Vous avez entré un mot de passe incorrect";
let textErreurLogin_MDP = "Vos indentifants sont incorrects";


//GESTION DE L4AFFICHAGE CIFFRES ALEATOIRES & AFFICHAGE CHIFFRE ENTREES----------------------------------------------------------------

function onloadInitVars(){
	document.getElementById('passageLoginEleve').value=sessionStorage.getItem("passageLoginEleve");
	document.getElementById('passageMDPEleve').value=sessionStorage.getItem("passageMDPEleve");
	document.getElementById('passageLoginProf').value=sessionStorage.getItem("passageLoginProf");
	document.getElementById('passageMDPProf').value=sessionStorage.getItem("passageMDPProf");

}

function digitAleatoire(nbDigitColonne, nbDigitLigne, min,max){
//on récpuère par le DOM la grilleDigit et on y affiche les 9 valeurs aléatoires

	let iTemp = 0;
	let randomTemp = 0;
	let isDoublon = false;
	let l = 0;
	let divColonne;

	for(let i=0;i<nbDigitLigne;i++){
		iTemp=i+1;
		divColonne=document.getElementById("div_ColonneDigit"+iTemp);
			for(let j=0;j<nbDigitColonne;j++){
			//attention il ne faut pas de doublons
				
				do{
					isDoublon=false;
					randomTemp=Math.floor(Math.random() * (max - min)) + min;
					divColonne.childNodes[j].value=randomTemp;
					tab_ChiffreDigit[l]=randomTemp;

					for (let k=0;k<l;k++){

						if(randomTemp===tab_ChiffreDigit[k]) {

							isDoublon = true;
						}
					}

				}while(isDoublon===true);
				l++;
				console.log(tab_ChiffreDigit);
			}
	}

}

function majInputLoginHidden(idLogin){
	let login = document.getElementById(idLogin);
	//var passageLogin=document.getElementById(idPassageLogin);
	//passageLogin.value=login.value;
	login=login.value;
	//console.log(passageLogin.value);
}


function majLoginMDP(idObjet){

	let inputObjet = document.getElementById(idObjet);
	let inputMDP_Result = document.getElementById('input_MDP');
	//var input_passageMDP=document.getElementById('passageMDP');
	
	if(stateMDPEntre<longMDP){
		inputMDP_Result.value=inputMDP_Result.value+inputObjet.value;
		//input_passageMDP.value=inputMDP_Result.value;
		MDP=inputMDP_Result.value;
		stateMDPEntre++;
	}
		//console.log(input_passageMDP.value);
}


function resetEntrees_Annuler(idLogin, idMDP){

	let login = document.getElementById(idLogin);
	let mDP = document.getElementById(idMDP);

	login.value="";
	mDP.value="";
}







//FEEDBACK ENTREES UTILISATEUR ---------------------------------------------------------------
//si les deux indentifants sont faux alors on affiche un message spécifique à ce cas 
function erreurLogin_MDP(divObjet, inputLogin, inputMDP){

	inputLogin.style.borderColor="red";
	inputLogin.style.backgroundColor="#FFB6C1";
	inputMDP.style.borderColor="red";
	inputMDP.style.backgroundColor="#FFB6C1";
	//div affichage erreur
	divObjet.innerHTML=textErreurLogin_MDP;
	divObjet.style.color="red";
	divObjet.style.borderStyle="solid";
	divObjet.style.borderWidth="1px";
	divObjet.style.borderColor="red";
	divObjet.style.backgroundColor="#FFB6C1";
}



function erreurLogin(divObjet, inputLogin){

	console.log('testErreurLogin');
	//input erreur
	inputLogin.style.borderColor="red";
	inputLogin.style.backgroundColor="#FFB6C1";
	//div affichage erreur
	divObjet.innerHTML=textErreurLogin;
	divObjet.style.color="red";
	divObjet.style.borderStyle="solid";
	divObjet.style.borderWidth="1px";
	divObjet.style.borderColor="red";
	divObjet.style.backgroundColor="#FFB6C1";
}

function erreurMDP(divObjet, inputMDP){

	console.log('testErreurMdp');

	//input erreur
	inputMDP.style.borderColor="red";
	inputMDP.style.backgroundColor="#FFB6C1";

	//div affichage erreur
	divObjet.innerHTML=textErreurMDP;
	divObjet.style.color="red";
	divObjet.style.borderStyle="solid";
	divObjet.style.borderWidth="1px";
	divObjet.style.borderColor="red";
	divObjet.style.backgroundColor="#FFB6C1";

}
