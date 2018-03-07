function CheckForm()
{
	if (document.UserInsert.urUser.value==""){
		alert("提示：\n\n用户名不能为空！");
		document.UserInsert.urUser.focus();
		return false;
	}
	if (document.UserInsert.urName.value==""){
		alert("提示：\n\n姓名/社团组织部门名不能为空");
		document.UserInsert.urName.focus();
		return false;
	}
	if (document.UserInsert.urAcademy.value==""){
		alert("提示：\n\n学院不能为空！");
		document.UserInsert.urAcademy.focus();
		return false;
	}
	if (document.UserInsert.urDepartment.value==""){
		alert("提示：\n\n系/部门不能为空！");
		document.UserInsert.urDepartment.focus();
		return false;
	}
	if (document.UserInsert.urEmail.value==""){
		alert("提示：\n\n用户邮箱不能为空！");
		document.UserInsert.urEmail.focus();
		return false;
	}
	if (document.UserInsert.urMajor.value==""){
		alert("提示：\n\n专业不能为空！");
		document.UserInsert.urMajor.focus();
		return false;
	}
	if (document.UserInsert.urPrincipal.value==""){
		alert("提示：\n\n负责人不能为空！");
		document.UserInsert.urPrincipal.focus();
		return false;
	}
	if (document.UserInsert.urPhonelong.value==""){
		alert("提示：\n\n手机长号不能为空！");
		document.UserInsert.urPhonelong.focus();
		return false;
	}
	if (document.UserInsert.urPhoneshort.value==""){
		alert("提示：\n\n手机短号不能为空！");
		document.UserInsert.urPhoneshort.focus();
		return false;
	}
	if (document.UserInsert.urPower.value==""){
		alert("提示：\n\n权限不能为空！");
		document.UserInsert.urPower.focus();
		return false;
	}
	if (document.UserInsert.urType.value==""){
		alert("提示：\n\n用户类型不能为空！");
		document.UserInsert.urType.focus();
		return false;
	}
	
	if (document.UserInsert.urPwd.value==""){
		alert("提示：\n\n请输入密码！");
		document.UserInsert.urPwd.focus();
		return false;
	}
	if (document.UserInsert.urPwd1.value==""){
		alert("提示：\n\n请输入确认密码！");
		document.UserInsert.urPwd1.focus();
		return false;
	}
	return true;

// function CheckUrUser(){
// 	if (document.UserInsert.urUser.value.length<6){
// 		alert("提示：\n\n用户名必须大于或等于6位");
// 		document.UserInsert.urUser.focus();
// 	}

}
function CheckPwd(){
	if (document.UserInsert.urPwd1.value!=document.UserInsert.urPwd.value){
		alert("提示：\n\n您两次输入的密码不一致！\n\n请重新输入");
		document.UserInsert.urPwd.focus();
		document.UserInsert.urPwd.value="";
		document.UserInsert.urPwd1.value="";
	}
	else{
		if (document.UserInsert.urPwd.value.length<8)
		{
			alert("提示：\n\n密码必须大于或等于8位");
			document.UserInsert.urPwd.focus();
			document.UserInsert.urPwd.value="";
			document.UserInsert.urPwd1.value="";
		}
	}
}