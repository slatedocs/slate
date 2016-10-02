var app = angular.module('scale', ['ngResource']);

app.controller('docsController', function ($scope, $http, $resource) {
  $http.defaults.withCredentials = true;
  var User = $resource('https://dashboard.scaleapi.com/internal/logged_in_user');

  $scope.user = {};
  $scope.ApiKey = 'SCALE_API_KEY';

  User.get({}, function(user) {
    $scope.user = user;
    if (user.testApiKey) {
      $scope.ApiKey = user.testApiKey;
    }
  });
});