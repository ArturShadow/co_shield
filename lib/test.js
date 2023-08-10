var xhr = new XMLHttpRequest();
var url = 'https://api2.arduino.cc/iot/v2/things/f8c6a63b-a11d-4939-9b23-673c08ebcb54/properties/08987657-b51a-4a3a-b7d1-d5022f9b3d86'; // Reemplaza con la URL correcta
var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2FwaTIuYXJkdWluby5jYy9pb3QiLCJhenAiOiJsNzdESHYxOHZvR2JWV05GYmJYcTlnY0tVVVpNdVNGNCIsImV4cCI6MTY5MTYyMjA1OCwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIiwiaHR0cDovL2FyZHVpbm8uY2MvY2xpZW50X2lkIjoiQWlyZHVpbm8iLCJodHRwOi8vYXJkdWluby5jYy9pZCI6ImZjMzhlMmFlLTJhNjktNDMzYi1iOTA2LTk4ZjYyZTFhNmI3YiIsImh0dHA6Ly9hcmR1aW5vLmNjL3JhdGVsaW1pdCI6MTAsImh0dHA6Ly9hcmR1aW5vLmNjL3VzZXJuYW1lIjoiZW5pYm94IiwiaWF0IjoxNjkxNjIxNzU4LCJzdWIiOiJsNzdESHYxOHZvR2JWV05GYmJYcTlnY0tVVVpNdVNGNEBjbGllbnRzIn0.y5clQHzEHI14QQNgFtpEMlSZ6R0DBC6sFdOb0KUmEX0";

xhr.open('GET', url, true);
xhr.setRequestHeader('Authorization', 'Bearer ' + token);

xhr.onreadystatechange = function() {
    if (xhr.readyState === 4) {
        if (xhr.status === 200) {
            var response = xhr.responseText;
            console.log(response);
        } else {
            console.log('La solicitud falló con código de estado: ' + xhr.status);
        }
    }
};

xhr.send();
