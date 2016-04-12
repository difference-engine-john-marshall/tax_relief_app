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
    $scope.question = {};

    $scope.next = function () {
        if ($scope.question_index >= $scope.questions.length - 1) {
            $scope.question_index = 0;
        } else {
            $scope.question_index++;
        }
        console.log($scope.questions.length + '/' + $scope.question_index);
    };



   window.scope = $scope;

 });

}());