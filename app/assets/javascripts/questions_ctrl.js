(function() {
 "use strict";

 angular.module("app").controller("questionsCtrl", function($scope, $http){
   
    $scope.setup = function(){
        $http.get('/api/v1/questions.json').then(function(response){
            $scope.questions = response.data;
            console.log($scope.questions);
        });
    };

    $scope.question_index = 0;

    $scope.checkYesResponse = function(response) {
      if (response == "landing") { 
        $scope.question_index = 0
      }
      else {
        $scope.question_index = response - 1
      }
    };

    $scope.checkNoResponse = function(response) {
      if (response == "faq") { 
        return "faq";
      }
      else if (response !== "landing") {
        return "landing";
      }
      else {
        return question.id;
      }
    };



   window.scope = $scope;

 });

}());