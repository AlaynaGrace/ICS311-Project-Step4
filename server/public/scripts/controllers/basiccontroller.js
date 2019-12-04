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
        $http.post("/db?table=" + vm.formoneTable + "&row=" + row).then(function success(response){
            if(vm.formoneTable === "pets"){
                vm.pets = response.body;
                if(vm.pets.adoption_date === null || vm.pets.adoption_date === undefined){
                    vm.pets.adoption_date = "N/A";
                }
            }
            else if(vm.formoneTable === "staff"){
                vm.staff = response.body;
            }
            else{
                vm.customers = response.body;
            }
            vm.showInfo = true;
        }, function failure(response){
            console.log(response);
        });
    }

    vm.login = function(){
        console.log("Hit the login button");
        if(vm.signInCount === 0){
            vm.signInCount = 1;
            $http.post("/signin",{username: vm.username, password: vm.password}).then(function(response){
                if(response.data.user){
                    if(response.data.user.level !== "Customer"){
                        $location.path("/home");
                        return;
                    }
                    else if(response.data.user.level === "Customer"){
                        console.log("Sending the user to the customer page");
                        $location.path("/customer");
                        return;
                    }
                    else{
                        swal("Login Error","Incorrect username or password","error");
                    }
                }
                else{
                    swal("Login Error","Incorrect username or password","error");
                }
            }).catch(function(err){
                swal("Login Error","Incorrect username or password","error");
            });
        }
    };

    vm.logout = function(){
        vm.signInCount = 0;
        $http.get("/logout").then(function success(response){
            $location.path("/");
        }, function failure(response){
            $location.path("/");
        });
    }
}]);