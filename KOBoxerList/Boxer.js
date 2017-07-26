/// <reference path="C:\Projects\C#\KnockOut_Projects\KOBoxerList\KOBoxerList\Scripts/jquery-3.1.1.min.js" />
/// <reference path="C:\Projects\C#\KnockOut_Projects\KOBoxerList\KOBoxerList\Scripts/knockout-3.4.2.js" />

function Boxer(data) {
    this.BoxerId = ko.observable(data.BoxerId);
    this.FirstName = ko.observable(data.FirstName);
    this.NickName = ko.observable(data.NickName);
    this.LastName = ko.observable(data.LastName);
    this.Age = ko.observable(data.Age);
    this.Gender = ko.observable(data.Gender);
    this.WeightClass = ko.observable(data.WeightClass);
    this.KOCount = ko.observable(data.KOCount);
    this.Record = ko.observable(data.Record);
    this.HomeTown = ko.observable(data.HomeTown);
    this.HomeState = ko.observable(data.HomeState);
}

function BoxerViewModel() {
    var self = this;
    self.WeightClasses = ko.observableArray(['Flyweight', 'Bantamweight', 'Lightweight', 'Welterweight', 'Middleweight', 'Cruiserweight', 'Heavyweight']);
    self.Genders = ko.observableArray(['Male', 'Female']);
    self.Boxers = ko.observableArray([]);
    self.BoxerId = ko.observable();
    self.FirstName = ko.observable();
    self.NickName = ko.observable();
    self.LastName = ko.observable();
    self.Age = ko.observable();
    self.Gender = ko.observable();
    self.WeightClass = ko.observable();
    self.KOCount = ko.observable();
    self.Record = ko.observable();
    self.HomeTown = ko.observable();
    self.HomeState = ko.observable();


    self.AddBoxer = function () {
        self.Boxers.push(new Boxer({
            BoxerId: self.BoxerId(),
            FirstName: self.FirstName(),
            NickName: self.NickName(),
            LastName: self.LastName(), 
            Age: self.Age(),
            Gender: self.Gender(),
            WeightClass: self.WeightClass(),
            KOCount: self.KOCount(),
            Record: self.Record(),
            HomeTown: self.HomeTown(),
            HomeState: self.HomeState()
        }));
        self.BoxerId(""),
        self.FirstName(""),
        self.NickName(""),
        self.LastName(""),
        self.Age(""),
        self.Gender(""),
        self.WeightClass(""),
        self.KOCount(""),
        self.Record(""),
        self.HomeTown(""),
        self.HomeState("")
    };

    self.DeleteBoxer = function (boxer) {

        $.ajax({
            type: "POST",
            url: 'Default.aspx/DeleteBoxer',
            data: ko.toJSON({ data: boxer }),
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                alert(result.d);
                self.Boxers.remove(boxer)
            },
            error: function (err) {
                alert(err.status + " - " + err.statusText);
            }
        });
    };

    self.SaveBoxer = function () {
        $.ajax({
            type: "POST",
            url: 'Default.aspx/SaveBoxer',
            data: ko.toJSON({ data: self.Boxers }),
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                alert(result.d);
            },
            error: function (err) {
                alert(err.status + " - " + err.statusText);
            }
        });
    };

    $.ajax({
        type: "POST",
        url: 'Default.aspx/FetchBoxers',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (results) {
            var boxers = $.map(results.d, function (item) {
                return new Boxer(item)
            });
            self.Boxers(boxers);
        },
        error: function (err) {
            alert(err.status + " - " + err.statusText);
        }
    })
}

$(document).ready(function () {
    ko.applyBindings(new BoxerViewModel());
});