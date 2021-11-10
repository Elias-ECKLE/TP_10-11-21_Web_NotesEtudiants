



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