(function() {
 "use strict";

 angular.module("app").controller("questionsCtrl", function($scope, $http, $window){
   
    $scope.setup = function(){
        $http.get('/api/v1/questions.json').then(function(response){
            $scope.questions = response.data;
        });
    };

    $scope.question_index = 0;

    $scope.checkYesResponse = function(response) {
      if (response === "landing") { 
        console.log("landing page text");
      }
      else {
        $scope.question_index = response - 1
      }
    };

    $scope.checkNoResponse = function(response) {
      if (response === "faq") { 
        $window.location.href = '/faq';
      }
      else if (response === "landing") {
        console.log("landing page text");
      }
      else {
        $scope.question_index = response - 1
      }
    };



   window.scope = $scope;

 });

}());