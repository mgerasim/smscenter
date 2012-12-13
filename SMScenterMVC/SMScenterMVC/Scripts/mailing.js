
function AddPhone(phones) {
    objSel = document.getElementById("gr_task");
    objInp = document.getElementById("inp_val_phone").value + objSel.options[objSel.selectedIndex].value;
    $("#inp_val_phone").val(objInp);
}