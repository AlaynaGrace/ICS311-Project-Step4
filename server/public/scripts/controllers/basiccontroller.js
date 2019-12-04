myApp.controller("BasicController",["$http","$location",function($http,$location){
    var vm = this;
    vm.rowCount=1;
    vm.currentTable="";
    
    vm.getInfo = function(row){
        vm.rowCount = row;
        if(row === -1 && vm.formoneTable != "pets"){
            row = 10;
            vm.rowCount = 10;
        }
        else{
            row = 15;
            vm.rowCount =15;
        }
        if(vm.currentTable !== vm.formoneTable){
            vm.rowCount=1;
            vm.currentTable = vm.formoneTable;
            vm.showInfo = false;
        }
        if($location.path() === "/formtwo"){
            vm.formoneTable = "vet_visits";
        }
        console.log(vm.formoneTable,row);
        $http.get("/db?table=" + vm.formoneTable + "&row=" + row).then(function success(response){
            if(vm.formoneTable === "pets"){
                console.log(response.data);
                vm.pets = response.data;
                if(vm.pets.adoption_date === null || vm.pets.adoption_date === undefined){
                    vm.pets.adoption_date = "N/A";
                }
                vm.showInfo = true;
            }
            else if(vm.formoneTable === "staff"){
                vm.staff = response.data;
                vm.showInfo = true;
            }
            else if(vm.formoneTable === "vet_visits"){
                vm.visit = response.data;
                vm.showInfo = true;
            }
            else{
                vm.customers = response.data;
                vm.showInfo = true;
            }
            vm.showInfo = true;
        }, function failure(response){
            console.log(response);
        });
    }
    if($location.path() === "/formtwo"){
        vm.getInfo(1);
    }

    vm.getInfoId = function(){
        console.log("In getInfoId");
        $http.get("/db/petid?id=" + vm.petId).then(function success(response){
            vm.pets = response.data;
            if(vm.pets.adoption_date === null || vm.pets.adoption_date === undefined){
                vm.pets.adoption_date = "N/A";
            }
            vm.showPetInfo=true;
        }, function error(response){
            console.log(response);
        });
    }
}]);