var app = angular.module("mainModule", []);
app.controller("mainController", function ($scope, $http) {

  $scope.SendDataAuthor = function (author) {
    
    var config = {
      headers: {
        'Content-Type': 'application/json'
      }
    }

    $http.post('/addAuthor', JSON.stringify($scope.author), config)
      .success(function (data, status, headers, config) {
        alert("Success..!")
      })
      .error(function (data, status, header, config) {
        alert("Error while saving..!")
      });
  };

  $scope.SendDataPosts = function (posts) {

    var config = {
      headers: {
        'Content-Type': 'application/json'
      }
    }

    $http.post('/addPost', JSON.stringify($scope.posts), config)
      .success(function (data, status, headers, config) {
        alert("Success..!")
      })
      .error(function (data, status, header, config) {
        alert("Error while saving..!")
      });
  };
});