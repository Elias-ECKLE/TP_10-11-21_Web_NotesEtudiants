
class JsTable{

	constructor() {
		this.table=document.createElement("table");
		this.thead=document.createElement("thead");
		this.tbody=document.createElement("tbody");
	}

	createTable(){
		this.table.appendChild(this.thead);
		this.table.appendChild(this.tbody);
		console.log("tableau crée");
	}

	addTableToDOM(id){
		document.getElementById(id).appendChild(this.table);
		console.log("tableau ajouté dans le DOM");
	}


}




function editNote(elmt){
	//console.log('checked');
	console.log(elmt);

	let inputCheck=document.getElementById(elmt);
	let inputNum=document.getElementById(elmt+'Note');
	//console.log(idInput);

	if(inputCheck.checked){
		console.log('enabled');
		inputNum.disabled=false;
		inputNum.value=0;
	}
	else{
		console.log('disabled');
		inputNum.disabled=true;
		inputNum.value='';
	}

}