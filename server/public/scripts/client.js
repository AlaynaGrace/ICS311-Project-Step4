var myApp = angular.module("myApp",["ngRoute",'angularjs-dropdown-multiselect', 'ui.bootstrap','xeditable']);

myApp.config(["$routeProvider", "$locationProvider", function($routeProvider,$locationProvider){
    $locationProvider.html5Mode(true);

    $routeProvider.when('/',{
        templateUrl: "/views/home.html",
        controller: "BasicController as bc"
    }).when('/formone',{
        templateUrl: "/views/formone.html",
        controller: "BasicController as bc"
    }).when('/formone',{
        templateUrl: "/views/formtwo.html",
        controller: "BasicController as bc"
    }).when('/formone',{
        templateUrl: "/views/formthree.html",
        controller: "BasicController as bc"
    }).otherwise('/');
}]);

myApp.run(['editableOptions', function(editableOptions) {
    editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default', 'bs3'
}]);