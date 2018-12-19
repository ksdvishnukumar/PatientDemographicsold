﻿<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="EditPerson.aspx.cs" Inherits="PatientDemographicsUI.EditPerson" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Demographics - View / Edit Person</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="Content/Style.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <script>
        function ValidateMandatoryInput() {
            //Validate Mandatory Field
            var InputField = 'forename,T;surname,T;gender,S'
            var sp_Ctrl = InputField.split(';');
            var sp_CtrlDet = "";
            for (var i = 0; i < sp_Ctrl.length; i++) {
                sp_CtrlDet = sp_Ctrl[i].split(',')
                if (sp_CtrlDet[1].trim().toUpperCase() == "T") {
                    if (document.getElementById(sp_CtrlDet[0]).value.trim() == "") {
                        alert(sp_CtrlDet[0] + " can not be blank.")
                        return false;
                    }
                }
                else {
                    if (document.getElementById(sp_CtrlDet[0]).selectedIndex == 0) {
                        alert("Select item from the " + sp_CtrlDet[0] + " field.")
                        return false;
                    }
                }
            }

            //Validate CharLength            
            var len = document.getElementById('forename').value.trim().length
            if (len < 3 || len > 50) {
                alert("Forename value can not be less than 3 and more than 50 characters length")
                return false;
            }

            len = document.getElementById('surname').value.trim().length
            if (len < 2 || len > 50) {
                alert("Surname value can not be less than 2 and more than 50 characters length")
                return false;
            }
            return true;
        }

        $(function () {
            $("#dob").datepicker();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row main">
                <div class="main-login main-center">
                    <a href="PersonList.aspx" class="btn btn-primary" role="button">List</a>
                    <a href="CreatePerson.aspx" class="btn btn-info" role="button">Create</a>
                    <h2><b><span id="titleText" runat="server"></span></b></h2>
                    <br />
                    <%--<form class="" method="post" action="#">--%>
                    <div class="form-group">
                        <label for="forename" class="cols-sm-2 control-label">Forename</label>
                        <div class="cols-sm-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <input type="text" runat="server" class="form-control" name="forename" id="forename" required placeholder="Enter your Forename" />
                            </div>
                        </div>
                        <div>
                            &nbsp;
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="surname" class="cols-sm-2 control-label">Surname</label>
                        <div class="cols-sm-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <input type="text" runat="server" class="form-control" name="surname" id="surname" required placeholder="Enter your Surname" />
                            </div>
                        </div>
                        <div>
                            &nbsp;
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dob" class="cols-sm-2 control-label">DOB</label>
                        <div class="cols-sm-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                <input type="text" runat="server" class="form-control" name="dob" id="dob" placeholder="Enter your DOB in MM/DD/YYYY format" />
                            </div>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="dob" ID="DateValidator"
                                ValidationExpression="((0[1-9]|1[0-2])\/((0|1)[0-9]|2[0-9]|3[0-1])\/((19|20)\d\d))$"
                                ErrorMessage="Invalid date format." />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="gender" class="cols-sm-2 control-label">Gender</label>
                        <div class="cols-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <select runat="server" class="form-control" name="gender" id="gender" required>
                                    <option>Select</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Transgender</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            &nbsp;
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="homenumber" class="cols-sm-2 control-label">Home Number</label>
                        <div class="cols-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <input type="text" runat="server" class="form-control" name="homenumber" id="homenumber" placeholder="Enter your Home Number" />
                            </div>
                        </div>
                        <%--<div >
                        </div>--%>
                    </div>

                    <div class="form-group">
                        <label for="worknumber" class="cols-sm-2 control-label">Work Number</label>
                        <div class="cols-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <input type="text" runat="server" class="form-control" name="worknumber" id="worknumber" placeholder="Enter your Work Number" />
                            </div>
                        </div>
                        <%--<div >
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                ControlToValidate="worknumber" ErrorMessage="Not a valid Work number"
                                ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        </div>--%>
                    </div>

                    <div class="form-group">
                        <label for="phonenumber" class="cols-sm-2 control-label">Phone Number</label>
                        <div class="cols-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <input type="text" runat="server" class="form-control" name="phonenumber" id="phonenumber" placeholder="Enter your Phone Number" />
                            </div>
                        </div>
                        <%--<div >
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                ControlToValidate="phonenumber" ErrorMessage="Not a valid Phone number"
                               ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator> --%>
                    </div>
                </div>

                <div class="form-group">
                    <div class="cols-sm-6 col-sm-push-6">
                        <input type="button" id="btnUpdate" name="btnUpdate" class="btn btn-info" value="Update" runat="server" />
                        <%--<asp:Button runat="server" ID="btnUpdate" name="btnUpdate" OnClientClick="return ValidateInput();" OnClick="btnUpdate_Click" class="btn btn-info" Text="Update" />--%>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hdnPID" runat="server" />
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                $.ajax({
                    type: 'get',
                    url: 'http://localhost:1866/api/Person/' + $('#hdnPID').val(),
                    dataType: 'json',
                    success: function (data) {
                        if (data != null || data != undefined) {
                            console.log(data);
                            $('#forename').val(data.PersomXML.Forename);
                            $('#surname').val(data.PersomXML.Surname);
                            $('#dob').val(data.PersomXML.DOB);
                            $("#gender").val(data.PersomXML.Gender);
                            $('#homenumber').val(data.PersomXML.TelephoneNumbers.HomeNumber);
                            $('#worknumber').val(data.PersomXML.TelephoneNumbers.WorkNumber);
                            $('#phonenumber').val(data.PersomXML.TelephoneNumbers.PhoneNumber);
                        }
                        else {
                            alert(data.d)
                        }
                    },
                    failure: function (data) {
                        alert(data.statusText);
                    },
                    error: function (data) {
                        alert(data.statusText);
                    }
                });
            });

            $("#btnUpdate").click(function () {
                if (ValidateMandatoryInput()) {
                    if (ValidateOptionalInput()) {
                        var sendInfo = {
                            Forename: $('#forename').val(),
                            Surname: $('#surname').val(),
                            DOB: $('#dob').val(),
                            Gender: $("#gender").val(),
                            TelephoneNumbers:
                                {
                                    HomeNumber: $('#homenumber').val(),
                                    WorkNumber: $('#worknumber').val(),
                                    PhoneNumber: $('#phonenumber').val()
                                }
                        };

                        $.ajax({
                            type: 'put',
                            url: 'http://localhost:1866/api/Person/' + $('#hdnPID').val(),
                            dataType: 'json',
                            success: function (data) {
                                console.log(data)
                                alert(data)
                            },
                            failure: function (data) {
                                alert(data.statusText);
                            },
                            error: function (data) {
                                alert(data.statusText);
                            },
                            data: sendInfo
                        });
                    }
                }
            });

            function ValidateOptionalInputs() {
                var parsedNumber;
                if ($('#homenumber').val().trim() != "") {
                    parsedNumber = parseInt($('#homenumber').val());
                    if (isNaN(parsedNumber)) {
                        alert("Home Number can have only Number. It should be 10 digit.")
                        return false;
                    }
                    else {
                        if (parsedNumber.toString().length != 10 && parsedNumber != 0) {
                            alert("Home Number is not a valid number. It should be 10 digit.")
                            return false;
                        }
                    }
                }

                if ($('#worknumber').val().trim() != "") {
                    parsedNumber = parseInt($('#worknumber').val());
                    if (isNaN(parsedNumber)) {
                        alert("Work Number can have only Number. It should be 10 digit.")
                        return false;
                    }
                    else {
                        if (parsedNumber.toString().length != 10 && parsedNumber != 0) {
                            alert("Work Number is not a valid number. It should be 10 digit.")
                            return false;
                        }
                    }
                }

                if ($('#phonenumber').val().trim() != "") {
                    parsedNumber = parseInt($('#phonenumber').val());
                    if (isNaN(parsedNumber)) {
                        alert("Phone Number can have only Number. It should be 10 digit.")
                        return false;
                    }
                    else {
                        if (parsedNumber.toString().length != 10 && parsedNumber != 0) {
                            alert("Phoness Number is not a valid number. It should be 10 digit.")
                            return false;
                        }
                    }
                }
            }

        </script>
    </form>
</body>
</html>
