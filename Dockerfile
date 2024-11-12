# Usa la imagen base del SDK de .NET para compilar la aplicación
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out

# Usa la imagen base de ASP.NET Core para ejecutar la aplicación
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .

# Expone el puerto 8080
EXPOSE 8080

# Comando para iniciar la aplicación
ENTRYPOINT ["dotnet", "HolaMundoApp.dll"]