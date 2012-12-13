/**
 */
function ShowSmallForm(group_name,group_id,frm_name,inp_name){
        $("#"+frm_name).css('display','block');
	$("#"+inp_name).val(group_name);
        $("#id_group_id").val(group_id);
	$("#"+inp_name).focus();
	$("#"+inp_name).select();
}

function ShowSmallUserForm(user_id,user_name,user_job,user_phone,group_id,div_name,frm_name){
        $("#"+div_name).css('display','block');
        $("#id_group_id").val(group_id);
	document.forms[frm_name].id_user_id.value = user_id;
	document.forms[frm_name].inp_user_name.value = user_name;
	document.forms[frm_name].inp_user_job.value = user_job;
	document.forms[frm_name].inp_user_phone.value = user_phone;
        document.forms[frm_name].inp_user_name.focus();
	document.forms[frm_name].inp_user_name.select();
}
/*
function ShowSmallChangeForm(group_name,group_id,frm_name){
        $("#"+frm_name).css('display','block');
	$("#inp_new_name_group").val(group_name);
	$("#id_group_id").val(group_id);
}
*/
function CloseSmallForm(frm_name){
        $("#"+frm_name).css('display','none');
}

function CloseExcessForms(no_excess){
    if (no_excess != 'create_user_form')
	CloseSmallForm('create_user_form');
    if (no_excess != 'create_group_form')
	CloseSmallForm('create_group_form');
    if (no_excess != 'change_user_form')
        CloseSmallForm('change_user_form');
    if (no_excess != 'change_group_form')
        CloseSmallForm('change_group_form');
}



function HideEnterForm(nw_tsk_name){
	$("#enter_form").css('display','none');
	$("#inp_val_name").val(nw_tsk_name);
	$("#inp_val_text").val('');	
	$("#inp_val_phone").val('');
	//document.getElementById("task_tp").selectedIndex=1;
	//$("#inp_val_comment").val('');
	CommentType();
}

function ClearPageData(){
	$("#inp_val_name").val('');
        $("#inp_val_text").val('');
        $("#inp_val_phone").val('');
	$("#val_page_id").val('sms_send_stat');
	$("#task_tp").val('');
	document.enter_task.submit();
}


function AddPhone(phones){
        objSel = document.getElementById("gr_task");
	objInp = document.getElementById("inp_val_phone").value + objSel.options[objSel.selectedIndex].value;
        $("#inp_val_phone").val(objInp);
}

function InsertData(){
	if ($("#inp_val_name").val() == '' ||  $("#inp_val_text").val() == '' ||  
	    $("#inp_val_phone").val() == '' ||  $("#task_tp").val() == ''){
	    alert("Недостаточно данных для создания задания.");
	}else{
	    document.enter_task.submit();
	}
}
function CheckUser(e, phone){
	if (e==true){
	    $("#inp_val_phone").val(phone);
	}
}

function CommentType(){
        objSel = document.getElementById("task_tp");
	val_c = objSel.options[objSel.selectedIndex].value;
	if(val_c==1){
	    comment="  (задание не имеет ограничений времени отправки)";
	    document.getElementById("gr_table").style.display='block';
//	    document.getElementById("gr_table").style.width='100%';
	    document.getElementById("lable_type").style.display='block';
	    document.getElementById("inp_val_phone").readOnly=true;
	}else if(val_c==2){
	    comment="  (задание исполняется только в рабочее время (с 9:00 до 18:00))";
	    document.getElementById("gr_table").style.display='none';
	    document.getElementById("lable_type").style.display='none';
	    document.getElementById("inp_val_phone").readOnly=false;
	}else{
	    comment="";
	    document.getElementById("gr_table").style.display='none';
            document.getElementById("lable_type").style.display='none';
	    document.getElementById("inp_val_phone").readOnly=false;
	}
        $("#inp_val_comment").val(comment);
}

function RollChild(elm,val_p,cnt_us,phones){
	for (var i = 1; i <= cnt_us; i++) {
	    if (document.getElementById(val_p+"_"+i)){
		document.getElementById(val_p+"_"+i).checked=elm.checked;
		document.getElementById(val_p+"_"+i).onclick();
		var parent = document.getElementById("pr"+val_p+"_"+i);
		if (elm.checked==true){
		    var vis='block';
		}else{
		    var vis='none';
		}
		parent.style.display=vis;
	    }
	}
}

function collapseAllRows(cnt_gr, cnt_us) {
	for (var i = 1; i <= cnt_gr; i++) {
	    var val_p=i;
	    var elm = document.getElementById("parent"+i);
	    elm.checked=false;
	    RollChild(elm,val_p,cnt_us);
	}
}

function AddRemPhone(phone,elm,pr,cnt_all){
	if (elm.checked==true){
	    var objInp = String(document.getElementById("inp_val_phone").value + "," + phone);
	}else{
	    var objInp = String(document.getElementById("inp_val_phone").value);
	    objInp = objInp.replace(','+phone,'');
	    if ((document.getElementById("parent"+pr).checked==true)){
        	var priz=0;
		for (var i = 1; i <= cnt_all; i++) {
            	    if (document.getElementById(pr+"_"+i)){
                	//alert(pr+"_"+i);
                	if (document.getElementById(pr+"_"+i).checked==true){
                    	    priz=priz+1;
                	}
            	    }
        	}
		if (priz==0){
		    for (var i = 1; i <= cnt_all; i++) {
        		if (document.getElementById(pr+"_"+i)){
            		    var parent = document.getElementById("pr"+pr+"_"+i);
            		    parent.style.display='none';
        		}
    		    }
		    document.getElementById("parent"+pr).checked=false;
		}
            }
	}
        $("#inp_val_phone").val(objInp);
}

function getSelectedSTCGr()
{
  var selStrGr = "";
  var selectedArray = new Array();
  var selObj = document.getElementById('selectGr');
  var i;
  var count = 0;
  for (i=0; i<selObj.options.length; i++) {
    if (selObj.options[i].selected) {
      //selectedArray[count] = selObj.options[i].value;
  	  selStrGr=selStrGr+","+selObj.options[i].value;
      count++;
    }
  }
  $("#id_arr_groups").val(selStrGr);
  $("#id_arr_groups2").val(selStrGr);
  //alert(selStrUT); 
}

function AddRemGrp(elm,str_val)
{
	var selStrGr = String(document.getElementById("id_arr_groups").value);
	if (elm.checked) {
		selStrGr=selStrGr+","+str_val;
	}else{
//		alert(selStrGr);
		selStrGr = selStrGr.replace(','+str_val,'');
//		alert(selStrGr);
	}
	$("#id_arr_groups").val(selStrGr);
  	$("#id_arr_groups2").val(selStrGr);
}

function ShowAddCardForm(frm_name,div_name)
{
	$("#"+div_name).css('display','block');
	document.forms[frm_name].inp_card_num.focus();
	document.forms[frm_name].inp_card_num.select();
}

function AddCard(card_inserter)
{
	//work work
	var card_num = document.getElementById('inp_card_num');
	if (card_num.value != '') {
		var myTable = document.getElementById('tblCard');
		var tBody = myTable.getElementsByTagName('tbody')[0];
		var newTR = document.createElement('tr');
		var newTD = document.createElement('td');
		var newTD2 = document.createElement('td');
		var newTD3 = document.createElement('td');
		var newTD4 = document.createElement('td');
		var row_nmb = myTable.rows.length;
		var strCards = String(document.getElementById("id_arr_cards").value+","+card_num.value);
		$("#id_arr_cards").val(strCards);
		//newTD.innerHTML = row_nmb;
		newTD.innerHTML = '#';
		newTD2.innerHTML = card_num.value;
		newTD3.innerHTML = card_inserter;
		newTD4.innerHTML = "<img src='www/templates/TechCool/image/icon/cancl_16.png' title='Удаление' alt='Удаление' width='16' height='16' onClick=\"javascript: DelCard('tblCard', "+row_nmb+");\" />";
		newTD4.align="center";
		newTR.appendChild(newTD);
		newTR.appendChild(newTD2);
		newTR.appendChild(newTD3);
		newTR.appendChild(newTD4);
		tBody.appendChild(newTR);
		card_num.value = '';
	}
}
function DelCard(tblId, rownmb)
{
	var myTable = document.getElementById(tblId);
	var strCards = String(document.getElementById("id_arr_cards").value);
	var answer = confirm("Удалить карту №"+myTable.rows[rownmb].cells[1].innerHTML+" из черного списка?");
	if (answer) {
		//alert("Отметки будут проставлены после выгрузки притензий в файл.")
		strCards = strCards.replace(','+myTable.rows[rownmb].cells[1].innerHTML,'');
		$("#id_arr_cards").val(strCards);
		myTable.rows[rownmb].cells[0].innerHTML = '';
		myTable.rows[rownmb].cells[1].innerHTML = '';
		myTable.rows[rownmb].cells[2].innerHTML = '';
		myTable.rows[rownmb].cells[3].innerHTML = '';
		myTable.rows[rownmb].innerHTML = '';
	//	alert(myTable.rows[rownmb].innerHTML);
	}else{ 
//		document.getElementById('otmetka_start_id').checked=false;
	}
}
