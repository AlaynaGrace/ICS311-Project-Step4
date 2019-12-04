myApp.controller("BasicController",["$http","$location",function($http,$location){
    var vm = this;
    vm.rowCount=1;
    vm.currentTable="";
    vm.getInfo = function(row){
        if(row == 0){
            row = -1;
            vm.rowCount = -1;
        }
        if(vm.currentTable !== vm.formoneTable){
            vm.rowCount=1;
            vm.currentTable = vm.formoneTable;
            vm.showInfo = false;
        }
        if($location.path() === "/formtwo"){
            vm.formoneTable = "vet_visits";
        }
        $http.get("/db?table=" + vm.formoneTable + "&row=" + row).then(function success(response){
            if(vm.formoneTable === "pets"){
                vm.pets = response.body;
                if(vm.pets.adoption_date === null || vm.pets.adoption_date === undefined){
                    vm.pets.adoption_date = "N/A";
                }
            }
            else if(vm.formoneTable === "staff"){
                vm.staff = response.body;
            }
            else if(vm.formoneTable === "vet_visits"){
                vm.visit = response.body;
            }
            else{
                vm.customers = response.body;
            }
            vm.showInfo = true;
        }, function failure(response){
            console.log(response);
        });
    }

    vm.getInfoId = function(){
        console.log("In getInfoId");
        $http.get("/db/petid?id=" + vm.petId).then(function success(response){
            vm.pets = response.body;
            console.log(response);
            vm.showPetInfo=true;
        }, function error(response){
            console.log(response);
        });
    }
}]);