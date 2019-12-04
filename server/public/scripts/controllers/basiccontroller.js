myApp.controller("BasicController",["$http","$location",function($http,$location){
    var vm = this;

    console.log("Loaded the controller");

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