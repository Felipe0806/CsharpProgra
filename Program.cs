var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hellow my name is Felipe Almeida and this is my Docker in C#");

app.Run("http://0.0.0.0:8080");
