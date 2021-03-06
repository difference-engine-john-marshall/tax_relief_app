(function() {
 "use strict";

 // angular.module("app").controller("questionsCtrl", function($scope, $http, $window){
  angular.module("app").controller('questionsCtrl', ['$scope', '$http', '$window', function($scope, $http, $window){

    $scope.setup = function(){
        $http.get('/api/v1/questions.json').then(function(response){
            $scope.questions = response.data;
        });
    };

    $scope.question_index = 0;

    $scope.checkYesResponse = function(response) {
      if (response === "faq") { 
        $window.location.href = '/faq';
      }
      else if (response === "success1") {
        $window.location.href = '/questions/classic';
      }
      else if (response === "success2") {
        $window.location.href = '/questions/equitable';
      }
      else {
        $scope.question_index = response - 1
      }
    };

    $scope.checkNoResponse = function(response) {
      if (response === "faq") { 
        $window.location.href = '/faq';
      }
      else if (response === "success1") {
        $window.location.href = '/questions/classic';
      }
      else if (response === "success2") {
        $window.location.href = '/questions/equitable';
      }

      else {
        $scope.question_index = response - 1
      }
    };


    window.scope = $scope;

 }]);

}());