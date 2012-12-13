function AddRemPhone(phone, elm, groupid) {
    if (elm.checked == true) {
        var objInp = String(document.getElementById("SmsList").value);
        var objHide = String(document.getElementById("phones_group-" + groupid).value);
        //var HideInInp = objInp.search(String(objHide));
        var PhnInInp = objInp.search(";" + phone);
        if (PhnInInp != -1) {
            elm.checked = false;
            return;
        }
        var HideInInp;
        if (objHide.length > 0) {
            HideInInp = objInp.search(objHide);
        } else {
            HideInInp = objInp.search("g");
        }
        if (HideInInp != -1) {
            var str1 = objInp.substring(0, HideInInp + objHide.length);
            var str2 = ";" + phone;
            var str3 = objInp.substring(HideInInp + objHide.length, objInp.length)
            objInp = objInp.substring(0, HideInInp + objHide.length) + ";" + phone + objInp.substring(HideInInp + objHide.length, objInp.length);
            objHide += ";" + phone;
        } else {
            objInp += ";" + phone;
            objHide += ";" + phone;
        }
        //var objInp = String(document.getElementById("SmsList").value + ";" + phone);
        //var objHide = String(document.getElementById("phones_group-" + groupid).value + ";" + phone);
    } else {
        var objInp = String(document.getElementById("SmsList").value);
        objInp = objInp.replace(';' + phone, '');
        var objHide = String(document.getElementById("phones_group-" + groupid).value);
        objHide = objHide.replace(';' + phone, '');
    }
    document.getElementById("phones_group-" + groupid).value = objHide;
    $("#SmsList").val(objInp);
}

function RemAllGroupPhones(groupid) {
    var objInp = String(document.getElementById("SmsList").value);
    var objHide = String(document.getElementById("phones_group-" + groupid).value);
    //var objHide = String($("#phones_group" + groupid));
    objInp = objInp.replace(objHide, '');
    document.getElementById("phones_group-" + groupid).value = "";
    $("#SmsList").val(objInp);
}

function ChangeHref(hr_add, hr_text, elm) {
//    elm.href = "Abonents_empty?" + "GroupID=" + hr_add;
    elm.href = hr_add;
    elm.innerHTML=hr_text;
}

function AddRemAbonent(ab_id, elm, groupid) {
    if (elm.checked == true) {
        var objInp = String(document.getElementById("gr_abonents").value);
        objInp += "," + ab_id;
    } else {
        var objInp = String(document.getElementById("gr_abonents").value);
        objInp = objInp.replace(',' + ab_id, '');
    }
    $("#gr_abonents").val(objInp);
}

function AddRemAction(act_id, elm) {
    if (elm.checked == true) {
        var objInp = String(document.getElementById("rl_act_add").value);
        objInp += "," + act_id;
    } else {
        var objInp = String(document.getElementById("rl_act_add").value);
        objInp = objInp.replace(',' + act_id, '');
    }
    $("#rl_act_add").val(objInp);
}

function AddRemStr(act_id, elm, insElmId) {
    if (elm.checked == true) {
        var objInp = String(document.getElementById(insElmId).value);
        objInp += ",|" + act_id + "|";
    } else {
        var objInp = String(document.getElementById(insElmId).value);
        objInp = objInp.replace(',|' + act_id + '|', '');
    }
    $("#"+insElmId).val(objInp);
}

function TypeSelect() {
//    var type_id = document.getElementById('tsk_types').value;
    var objSel = document.getElementById("tsk_types");
    var val_c = objSel.options[objSel.selectedIndex].value;
    if (val_c == 1) {
        //comment = "  (задание не имеет ограничений времени отправки)";
        document.getElementById("groups_table").style.display = 'block';
        document.getElementById("groups_label").style.display = 'block';
        document.getElementById("SmsList").readOnly = true;
    }else {
        document.getElementById("groups_table").style.display = 'none';
        document.getElementById("groups_label").style.display = 'none';
        document.getElementById("SmsList").readOnly = false;
    }
}

function AddRemTxt(act_id, elm, insElmId) {
    if (elm.checked == true) {
        var objInp = String(document.getElementById(insElmId).value);
        objInp += act_id + ";";
    } else {
        var objInp = String(document.getElementById(insElmId).value);
        objInp = objInp.replace(act_id + ';', '');
    }
    $("#" + insElmId).val(objInp);
}