<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KOBoxerList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Boxer List</title>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/knockout-3.4.2.js"></script>
    <script src="Boxer.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:100%;" >
            <tbody>
                <tr>
                    <th style="width:100px;">Property Name</th>
                    <th style="width:100px;">Enter Value</th>
                    <th style="width:100px;">Example of Two-Way Binding</th>
                </tr>
                </tbody>
            <tr>
                <td>Boxer ID (int):</td>
                <td>
                    <input data-bind="value: BoxerId" />
                    </td> <!--,valueUpdate:'keypress'-->
                <td><span data-bind="text: BoxerId" /></td>
            </tr>
            <tr>
                <td>First Name :</td>
                <td>
                    <input data-bind="value: FirstName" /></td>
                <td  ><span data-bind="text: FirstName" /></td>
            </tr>
            <tr>
                <td>"Nickname" :</td>
                <td>
                    <input data-bind="value: NickName" /></td>
                <td  ><span data-bind="text: NickName" /></td>
            </tr>
            <tr>
                <td>Last Name :</td>
                <td>
                    <input data-bind="value: LastName" /></td>
                <td><span data-bind="text: LastName" /></td>
            </tr>
            
            <tr>
                <td>Boxer Age (int) :</td>
                <td>
                    <input data-bind="value: Age" /></td>
                <td><span data-bind="text: Age" /></td>
            </tr>
            <tr>
                <td>Gender :</td>
                <td>
                    <select data-bind="options: Genders, value: 
                    Gender, optionsCaption: 'Select Gender...'"></select></td>
                <td><span data-bind="text: Gender" /></td>
            </tr>
            <tr>
                <td>Weight Class :</td>
                <td>
                    <select data-bind="options: WeightClasses, value: 
                    WeightClass, optionsCaption: 'Select Weight Class...'"></select></td>
                <td><span data-bind="text: WeightClass" /></td>
            </tr>
            <tr>
                <td>Knock Out Count :</td>
                <td>
                    <input data-bind="value: KOCount" /></td>
                <td><span data-bind="text: KOCount" /></td>
            </tr>
            <tr>
                <td>Record (Wins-Losses-Draws) :</td>
                <td>
                    <input data-bind="value: Record" /></td>
                <td><span data-bind="text: Record" /></td>
            </tr>
            <tr>
                <td>Hometown :</td>
                <td>
                    <input data-bind="value: HomeTown" /></td>
                <td><span data-bind="text: HomeTown" /></td>
            </tr>
            <tr>
                <td>Home State :</td>
                <td>
                    <input data-bind="value: HomeState" /></td>
                <td><span data-bind="text: HomeState" /></td>
            </tr>
          
            <tr>
                <td colspan="3">
                    <button type="button" data-bind="click: 
                    AddBoxer">Add Boxer</button>
                    <button type="button" data-bind="click: 
                    SaveBoxer">Save Boxer(s) To Database</button>
                </td>
            </tr>

        </table>
            </div>

         <div style="width:70%;float:left;display:inline-block;">
             <h2>List of Boxers</h2>
        <table style="width:100%;" data-bind="visible: Boxers().length > 0" border="0">
            <tr>
                <th>Boxer Id</th>
                <th>First Name</th>
                <th>Nickname</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Weight Class</th>
                <th>Knock Out Count</th>
                <th>Record</th>
                <th>Hometown</th>
                <th>Home State</th>
            </tr>
            <tbody data-bind="foreach: Boxers">
                <tr>
                    <td><span data-bind="text: BoxerId" /></td>
                    <td>
                        <input data-bind="value: FirstName" /></td>
                    <td>
                        <input data-bind="value: NickName" /></td>
                    <td>
                        <input data-bind="value: LastName" /></td>
                    <td>
                        <input data-bind="value: Age" /></td>
                   
                    <td>
                        <select data-bind="options: $root.Genders, 
                        value: Gender"></select></td>
                    <td>
                        <select data-bind="options: $root.WeightClasses, 
                        value: WeightClass"></select></td>
                    <td>
                        <input data-bind="value: KOCount" /></td>
                    <td>
                        <input data-bind="value: Record" /></td>
                    <td>
                        <input data-bind="value: HomeTown" /></td>
                    <td>
                        <input data-bind="value: HomeState" /></td>
                   

                    <td><a href="#" data-bind="click: $root.
                    DeleteBoxer">Delete</a></td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</body>
</html>
